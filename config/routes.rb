Rails.application.routes.draw do
  get 'wishlists/show'
  devise_for :users
  root to: "pages#home"
  resources :posts do
    resources :bookmarks, only: :create
  end
  resources :bookmarks, only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
