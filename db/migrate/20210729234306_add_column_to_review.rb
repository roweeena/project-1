class AddColumnToReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :item_id, :integer

    add_column :reviews, :reviewer, :text
    add_column :reviews, :reviewee, :text  

  end
end
