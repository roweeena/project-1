# README

## Project 1: Marketeplace app

The app can be found [here](https://fukuzatsu-project1.herokuapp.com/)

### Overview

I wanted to make a marketplace app that would allow sellers to sell preloved clothes and accessories to each other.

I was inspired by other marketplace and ecommerce stores like [Depop](https://www.depop.com/), [ASOS Marketplace](https://marketplace.asos.com/) and [Etsy](https://www.etsy.com/au/), and wanted to challenge myself to make something similar. 
### Dependencies and Configuration
The app runs on Ruby version 2.7.4 and  Rails 5.2.6.

Additionally, I used the `cloudinary` gem for image upload and the `bcrypt` gem for securely storing the users' password. information.

### Database and associations

My app uses 6 models : `users`, `items`, `orders`, `cart`, `reviews` and `line_items`. I also have a `sessions` controller to allow the user to log in.

Using pen and paper, I drew out a basic framework of the associations such as `items` `belongs_to :user` and `has_many :line_items`, or a `user` `has_many :items` and `has_many :reviews`.  I also drew out a rudimentary wireframe so I knew what I wanted the pages to look like.

### Bugs and nice-to-haves

- The app is not responsive. On mobile, the carousel on the home page is off centre.
- I hope to use the `stripe` gem to properly implement a checkout function. At the moment, once the user fills out the order form and checks out, they are redirected to the the root_path and their order is stored in an `index` page.
- I would like to implement a search function and a `categories` model so that the user can filter by item type.
- The `admin` user exists as I have seeded the data in to the database, but I would like to give the admin user more access and restrict users some more.
