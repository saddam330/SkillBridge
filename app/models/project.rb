class Project < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications

  validates :project_title, :project_description, :job_title, :job_description, :duration,
            :requirements, :closing_date, :start_date, :location, presence: true
end
