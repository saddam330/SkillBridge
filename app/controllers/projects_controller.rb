class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
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
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to project_path(@project), notice: 'Project created.'
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
  end

  private

  def set_project
    begin
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to projects_path
    end
  end

  def project_params
    params.require(:project).permit(:project_title, :project_description, :job_title, :job_description,
                                   :duration, :requirements, :category, :closing_date, :start_date, :location)
  end
end
