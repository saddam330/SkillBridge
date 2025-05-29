class ApplicationsController < ApplicationController
  def index
    @applications = current_user.applications
  end
  
  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def create
    @project = Project.find(params[:project_id])
    @application = @project.applications.build(application_params)

    if @application.save
      redirect_to @project, notice: 'Application submitted successfully.'
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
end
