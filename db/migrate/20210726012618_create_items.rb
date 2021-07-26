class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :image
      t.text :size
      t.text :condition
      t.text :color
      t.text :shipping
      t.text :style
      t.text :name
      t.text :description
      t.float :price
      t.integer :user_id
      t.timestamps
    end
  end
end
