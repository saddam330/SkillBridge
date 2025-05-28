class ChangeColumnNameForUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :employee, :employer

  end
end
