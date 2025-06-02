class Project < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
  validate :closing_date_before_start_date

  validates :project_title, :project_description, :job_title, :job_description, :duration,
            :requirements, :closing_date, :start_date, :location, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [:project_title, :project_description],
    using: {
      tsearch: { prefix: true }
    }


    private

    def closing_date_before_start_date
      if closing_date.present? && start_date.present? && closing_date > start_date
        errors.add(:closing_date, "must be before the project start date.")
      end
    end
end
