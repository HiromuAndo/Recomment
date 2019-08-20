class RemoveWorkIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :work_id, :integer
  end
end
