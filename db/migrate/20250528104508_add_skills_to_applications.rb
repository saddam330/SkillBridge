class AddSkillsToApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :applications, :skills, :text
  end
end
