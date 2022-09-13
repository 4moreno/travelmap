Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :posts do
    resources :bookmarks, only: :create
  end
  get "profile", action: :show, controller: "users"
  resources :bookmarks, only: :destroy
  resources :wishlists, only: :index
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :events do
    resources :attendances, only: [:index, :create]
  end
  resources :attendances, only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
