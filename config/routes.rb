Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "signup", :to => "devise/registrations#new"
  end
  resources :users, :only => [ :index, :show ]
  resources :friendships, :only => [:create, :update, :destroy]
  get "friend_requests", to: "friend_requests#index"
  get "friends", to: "friends#index"
  resources :events
end
