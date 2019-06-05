Rails.application.routes.draw do
  # root is now defined in initializers/high_voltage.rb
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "signup", :to => "devise/registrations#new"
  end
  resources :events
end
