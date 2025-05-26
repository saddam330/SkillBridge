class Message < ApplicationRecord
  belongs_to :user
  belongs_to :application
  validates :content, presence: true
end
