class Application < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :feedbacks
  has_many :messages, dependent: :destroy
  validates :status, presence: true
  validates :skills, presence: true

  has_one_attached :cover_letter
  has_one_attached :cv
  validates :cover_letter, attached: true
  validates :cv, attached: true
end
