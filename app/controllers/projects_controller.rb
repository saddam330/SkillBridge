class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


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
end
