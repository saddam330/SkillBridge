class ApplicationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_application
  before_action :authorize_user!

  def index
  end

  def show
    if current_user.employer?
      @application = Application.where(project_id:  current_user.projects.pluck(:id) ).find(params[:id])
    else
      @application = current_user.applications.find(params[:id])
    end
  end


  def new

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

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def authorize_user!

    unless current_user == @application.user || current_user == @application.project.user
      redirect_to root_path, alert: "Access denied."
    end
  end
    def status_params
      params.require(:application).permit(:status)
    end
end
