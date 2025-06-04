class ChangeGithubUrlTypeInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :github_url, :string
  end
end
