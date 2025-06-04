class RenameLinksToGithubUrlOnUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :links, :github_url
  end
end
