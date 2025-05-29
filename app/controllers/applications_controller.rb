class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:new, :create]

  def index
    @applications = current_user.applications
  end
  
  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
    @user = User.all
  end

  def create
    @project = Project.find(params[:project_id])
    @application = @project.applications.new(application_params)
    @application.user = current_user
    @application.status = "pending"

    if @application.save
      redirect_to applications_path, notice: "Your application successfully submitted!"

    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      redirect_to @application, notice: 'Application updated.'
    else
      render :edit
    end
  end

  private

  def application_params
    params.require(:application).permit(:user_id, :cover_letter)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def application_params
    params.require(:application).permit(:status, :cover_letter)
  end
end
