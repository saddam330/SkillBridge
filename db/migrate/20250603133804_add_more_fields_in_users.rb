class AddMoreFieldsInUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :about_me, :text
    add_column :users, :contact_info, :text
    add_column :users, :links, :text
    add_column :users, :location, :string
    add_column :users, :education, :string
    add_column :users, :expertise, :text
    add_column :users, :work_experience, :text
    add_column :users, :hobbies, :text
  end
end
