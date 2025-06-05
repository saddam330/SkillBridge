class AddApplicationIdToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :application_id, :integer
  end
end
