Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # users could sign up multiple times
  resources :users

  # users can only make one session
  resource :session

  get "about", to: "pages#about"

  # for the homepage
  root "pages#home"

end
