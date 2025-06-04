class MessagesController < ApplicationController
  def create
    @application = Application.find(params[:application_id])
    @message = Message.new(message_params)
    @message.application = @application
    @message.user = current_user

    if @message.save

      applicant = @application.user                    # Candidate
      employer = @application.project.user             # Project owner

      recipient = current_user == applicant ? employer : applicant

      # Create notification
      Notification.create!(
        user: recipient,
        content: "💬 New message from #{current_user.first_name} regarding '#{@application.project.project_title}'"
      )
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
            locals: { message: @message, user: current_user})
        end
        format.html { redirect_to application_path(@application) }
      end
    else
      render "applications/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
