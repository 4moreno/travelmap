Rails.application.routes.draw do
  get 'wishlists/show'
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  resources :posts
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
