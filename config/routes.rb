Rails.application.routes.draw do
  get 'carts/show'
  get 'cart/show'
  root :to => "pages#home"
  resources :users
  resources :items
  resource :cart

  #not crud #controller#action
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  delete '/login' => 'sessions#destroy'

end
