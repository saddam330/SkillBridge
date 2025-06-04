class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :ensure_employer, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = Project.all.order(created_at: :desc)

    if params[:query].present?
      @projects = Project.search_by_title_and_description(params[:query].capitalize)
    end

    if params[:location].present?
    @projects = @projects.where(location: params[:location])
    end

    if params[:duration].present?
      if params[:duration].include?("1-3")
        @projects = @projects.where(duration: ["1 months", "2 months", "3 months"])
      elsif params[:duration].include?("4-6")
        @projects = @projects.where(duration: ["4 months" , "5 months", "6 months"])
      else
        "Not found.."
      end
    end

    if params[:category].present?
      @projects = @projects.where(category: params[:category])
    end
  end

  def show
    @application = Application.new
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: "Project posted successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to dashboard_path(current_user)
  end

  def dashboard
    @projects = current_user.projects
  end

  def applicants
    @project = Project.find(params[:id])
    @applicants = @project.applications
  end

  def save
    session[:saved_project_ids] ||= []
    session[:saved_project_ids] << params[:id].to_i unless session[:saved_project_ids].include?(params[:id].to_i)
    redirect_back fallback_location: projects_path
  end

  def unsave
    session[:saved_project_ids] ||= []
    session[:saved_project_ids].delete(params[:id].to_i)
    redirect_back fallback_location: projects_path
  end

  def saved
    saved_ids = session[:saved_project_ids] || []
    @saved_projects = Project.where(id: saved_ids)
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def ensure_employer
    unless current_user.employer?
      redirect_to root_path, alert: "Only employers can post new projects."
    end
  end

  def apply
    @project = Project.find(params[:id])
    @application = @project.applications.new(user: current_user)

    if @application.save
      redirect_to @project_path, notice: 'Application was successfully created.'
    else
      redirect_to @project, alert: 'Failed to apply for the project.'
    end
  end

  def project_params
    params.require(:project).permit(:project_title, :project_description, :job_title, :job_description,
    :requirements, :duration, :category, :closing_date, :start_date, :location, :perks, :learning_outcomes, :company_name )
  end
end
