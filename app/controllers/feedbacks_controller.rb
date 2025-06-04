class FeedbacksController < ApplicationController
  before_action :set_application

  def create
    @feedback = @application.feedbacks.new(feedback_params)

    if @feedback.save
      redirect_to application_path(@application), notice: "Thanks for your feedback!"
    else
      flash.now[:alert] = "Please try again."
      render "applications/show"
    end
  end

  private

  def set_application
    @application = Application.find(params[:application_id])
  end

  def feedback_params
    params.require(:feedback).permit(:comment, :rating)
  end
end
