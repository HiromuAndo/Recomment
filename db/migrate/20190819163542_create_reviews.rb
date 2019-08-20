class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :user_id
      t.integer :work_id
      t.integer :category_id
      t.boolean :open

      t.timestamps
    end
  end
end
