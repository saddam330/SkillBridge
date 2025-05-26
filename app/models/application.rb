class Application < ApplicationRecord
  has_one_attached :cover_letter
  belongs_to :user
  belongs_to :project
  has_many :feedbacks
  has_many :messages, dependent: :destroy
  validates :status, presence: true
end
