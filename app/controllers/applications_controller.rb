class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    @application = Application.new
    @user = User.all
  end

  def create
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
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def application_params
    params.require(:application).permit(:status, :cover_letter)
  end
end
