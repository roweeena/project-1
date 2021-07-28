class ShippingTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping
    remove_column :items, :price

    add_column :items, :shipping, :float
    add_column :items, :price, :float
  end
end
