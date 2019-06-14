Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "signup", :to => "devise/registrations#new"
  end
  resources :users, :only => [ :index, :show ]
  resources :events
end
