class AddColumnsToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :company_name, :string
    add_column :projects, :perks, :text
    add_column :projects, :learning_outcomes, :text
  end
end
