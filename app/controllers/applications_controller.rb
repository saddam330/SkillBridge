class ApplicationsController < ApplicationController


  before_action :authenticate_user!
  before_action :set_application, only: [:show, :update]
  # before_action :authorize_user!
  before_action :ensure_non_employer, only: [:create]
  before_action :set_project, only: [:new, :create]

  def index
    @applications = current_user.applications
  end

  def show
    if current_user.employer?
      @application = Application.where(project_id: current_user.projects.pluck(:id)).find(params[:id])
    else
      @application = current_user.applications.find(params[:id])
    end
    @message = Message.new
  end

  def new

    @application = Application.new
    @user = User.all
  end

  def update
    if current_user.employer? && @application.project.user == current_user
      if @application.update(status_params)
        redirect_to @application, notice: "Application status updated to #{@application.status}"
      else
        render :show, alert: "Failed to update status"
      end
    else
      redirect_to root_path, alert: "Unauthorized"
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @application = @project.applications.new(application_params)
    @application.user = current_user
    @application.status = "pending"

    if @application.save
      redirect_to application_path(@application), notice: "Your application successfully submitted!"

    else
      render :new, status: :unprocessable_entity
    end
  end

  private


  def set_application
    @application = Application.find(params[:id])
  end

  # def authorize_user!

  #   unless current_user == @application.user || current_user == @application.project.user
  #     redirect_to root_path, alert: "Access denied."
  #   end
  # end

  def application_params
    params.require(:application).permit(:status, :user_id, :cover_letter, :cv, :skills)
  end

  def ensure_non_employer
    if current_user.employer?
      redirect_to root_path, alert: "Employers are not allowed to apply for projects."
    end
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def status_params
    params.require(:application).permit(:status)
  end
end
