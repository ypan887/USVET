Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "home#index"

  get '/learn_about', to: 'home#learn_about'
  get '/volunteer', to: 'home#volunteer'
  get '/donation', to: 'home#donation'
end
