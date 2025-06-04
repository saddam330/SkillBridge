class Notification < ApplicationRecord
  belongs_to :user

  scope :unread, -> { where(read: false) }


  after_create_commit do
    broadcast_replace_to(
      user,
      target: "notifications",
      partial: "shared/notification_icon",
      locals: { current_user: user }
    )
  end


end
