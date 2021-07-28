# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
u1 = User.create :email => 'roe0320@gmail.com', :dob => '1996-06-19', :location => 'Sydney, Australia', :username => 'weiner', :name => 'Rowena Leung',:password => 'testabc'
u2 = User.create :email => 'admin@ga.com', :dob => '1990-08-20', :location => 'Sydney, Australia', :username => 'the_admin', :name => 'John Smith',:password => 'adminabc', :admin => true
u3 = User.create :email => 'rei@solo.com', :dob => '1994-07-30', :location => 'Melbourne, Australia', :username => 'lightsaber_2', :name => 'Rei Solo',:password => 'user1abc'

puts "#{ User.count } users created."

# Review.destroy_all
# r1 = Review.create :message => "Responds quickly."
# r2 = Review.create :message => "The shipping was quick! Thank you so much."
# r3 = Review.create :message => "At first I was worried it wouldn't fit but when I tried it on, it was perfect. In love!"
# r4 = Review.create :message => "I'd been looking for something like for ages So glad I found this."
# r5 = Review.create :message => "I'd like to purchase this. Can we meet up?"
#
# puts "#{ Review.count } reviews created."

Item.destroy_all
i1 = Item.create :size => "S", :condition => "Excellent", :color => "Pastel green", :shipping => 5.00, :name => "Floral cropped vest", :price => 25.00,  :image => '/assets/P0.jpeg'
i2 = Item.create :size => "S-M", :condition => "Used, still in good condition", :color => "Navy", :shipping => 0, :name => "Wide leg jeans", :price => 36.50, :image => '/assets/L_g0108560159.jpeg'
i3 = Item.create :size => "L", :condition => "Used, still in good condition", :color => "Red", :shipping => "Free", :name => "Charles River windbreaker", :price => 36.50, :image => '/assets/61e+AMO8uQL._AC_SX679_.jpg'
i4 = Item.create :size => "M-L", :condition => "Used with a small stain near the waist", :color => "Yellow", :shipping => 0, :name => "Plaid mini skirt", :price => 15.00, :image => '/assets/il_570xN.2374720083_2ya5.jpg'

puts "#{ Item.count } items created."

##Associations##
puts 'users and items'
u1.items << i1 << i2
u3.items << i3 << i4

# puts "items and reviews"
# i1.reviews << r1 << r2
# i2.reviews << r3
# i3.reviews << r4
# i4.reviews << c5

# puts "users and reviews"
# u1.reviews << r2 << r4
# u3.reviews << r3
