class Feedback < ApplicationRecord
  belongs_to :application

  validates :rating, :comment, presence: true
end
