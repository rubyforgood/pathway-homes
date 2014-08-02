Rails.application.routes.draw do

  get 'pages/about'

  get 'pages/contact'

  devise_for :users
  resources :users

  resources :service_requests do
    resources :notes
    get 'export', on: :collection
  end

  root to: 'pages#index'
end
