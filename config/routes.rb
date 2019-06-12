Rails.application.routes.draw do
  resources :users, :only => [ :index, :show ]
  root "events#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "signup", :to => "devise/registrations#new"
  end
  resources :events
end
