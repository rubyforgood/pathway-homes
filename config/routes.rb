Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/about'

  get 'pages/contact'

  devise_for :users
  devise_scope :user do
    get '/users/add_user' => 'devise/registrations#new'
  end
  
  resources :service_requests
  root to: 'pages#index'
end
