class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :message
      t.integer :user_id
      t.integer :item_id
    end
  end
end
