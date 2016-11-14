Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "home#index"
  resources :posts, only: :show
  resources :survey, only: [:index, :show, :create]

  get '/learn_about', to: 'home#learn_about'
  get '/volunteer', to: 'home#volunteer'
  get '/donation', to: 'home#donation'
  get '/subscribe', to: 'emailapi#index'
  post 'emailapi/subscribe', to: 'emailapi#subscribe'
end
