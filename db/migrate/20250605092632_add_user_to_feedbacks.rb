class AddUserToFeedbacks < ActiveRecord::Migration[7.1]
  def change
    add_reference :feedbacks, :user, null: false, foreign_key: true
  end
end
