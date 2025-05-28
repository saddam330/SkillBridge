class Project < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications

  validates :project_title, :project_description, :job_title, :job_description, :duration,
            :requirements, :closing_date, :start_date, :location, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [:project_title, :project_description],
    using: {
      tsearch: { prefix: true } 
    }
end
