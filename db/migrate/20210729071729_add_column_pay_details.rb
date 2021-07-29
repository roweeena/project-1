class AddColumnPayDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :pay_method, :text


    add_column :orders, :cc_number, :text
    add_column :orders, :cvv, :integer
    add_column :orders, :exp, :text
    add_column :orders, :location, :text
    add_column :orders, :state, :text
    add_column :orders, :postcode, :integer
  end
end
