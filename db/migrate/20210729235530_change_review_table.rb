class ChangeReviewTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :reviewer, :text
    remove_column :reviews, :reviewee, :text
    remove_column :reviews, :user_id, :integer


    add_column :reviews, :reviewer_id, :integer
    add_column :reviews, :reviewee_id, :integer
  end
end
