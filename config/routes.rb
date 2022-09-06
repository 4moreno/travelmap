Rails.application.routes.draw do
  # get 'wishlists/show'
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/create'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/destroy'
  devise_for :users
  root to: "pages#home"
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
