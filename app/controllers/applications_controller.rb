class ApplicationsController < ApplicationController
  def index
  end

  def show
    @application = Application.find(params[:id])
  end

  def new

  end

  def create
  end

  def update
  end
end
