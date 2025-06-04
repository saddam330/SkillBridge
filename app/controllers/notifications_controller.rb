class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.unread.order(created_at: :desc)
  end

  def mark_as_read
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    redirect_back fallback_location: root_path
  end

  def list
    @notifications = current_user.notifications.order(created_at: :desc).limit(10)

    render partial: "notifications/list", formats: [:html]
  end
end
