class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.date :dob
      t.text :location
      t.text :username
      t.text :name
      t.text :image
      t.boolean :admin, :default => false
      t.string :password_digest
      t.timestamps
    end
  end
end
