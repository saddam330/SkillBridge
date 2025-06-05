class Feedback < ApplicationRecord
  belongs_to :application
  belongs_to :user

  validates :rating, :comment, presence: true
end
