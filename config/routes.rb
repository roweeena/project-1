Rails.application.routes.draw do
  root :to => "pages#home"
  resources :users
  resources :items
  resources :orders
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"


  get 'line_items/:id' => "line_items#show", as: "line_item"
  post 'line_items' => "line_items#create"
  delete 'line_items/:id' => "line_items#destroy"
  #not crud #controller#action
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  delete '/login' => 'sessions#destroy'

end
