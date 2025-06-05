class Feedback < ApplicationRecord
  belongs_to :application
  belongs_to :user, dependent: :destroy

  validates :rating, :comment, presence: true
end
