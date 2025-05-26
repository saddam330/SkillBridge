class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :project_title
      t.text :project_description
      t.string :job_title
      t.text :job_description
      t.string :duration
      t.text :requirements
      t.string :category
      t.date :closing_date
      t.date :start_date
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
