Rails.application.routes.draw do
  root :to => "pages#home"
  resources :users
  resources :items
  resource :cart, only: [:show] do
    put 'add/:item_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  #not crud #controller#action
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  delete '/login' => 'sessions#destroy'

end
