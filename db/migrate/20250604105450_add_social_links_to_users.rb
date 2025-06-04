class AddSocialLinksToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :linkedin_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :portfolio_url, :string
  end
end
