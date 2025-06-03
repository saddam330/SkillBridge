class Message < ApplicationRecord
  belongs_to :user
  belongs_to :application
  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "application_#{application.id}_messages",
                        partial: "messages/message",
                        target: "messages",
                        locals: { message: self, user: user }
  end
end
