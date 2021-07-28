class ReformatShippingColumn < ActiveRecord::Migration[5.2]
  def change
    change_column(:items, :price, :float)
    change_column(:items, :shipping, :float)
  end
end
