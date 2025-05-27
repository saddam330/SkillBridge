class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @projects = Project.all
  end

  def show
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
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:project_title, :project_description, :job_title, :job_description,
    :requirements, :duration, :category, :closing_date, :start_date, :location)
  end
end
