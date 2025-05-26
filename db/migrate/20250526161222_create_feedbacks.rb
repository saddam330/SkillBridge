class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.float :rating
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
