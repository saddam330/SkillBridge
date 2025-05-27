class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
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
end
