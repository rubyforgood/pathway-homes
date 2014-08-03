Rails.application.routes.draw do

  get 'pages/about'

  get 'pages/contact'

  get 'pages/admin'

  devise_for :users
  resources :users, except: :show
  get 'user', to: 'users#show'
  
  get 'admin/create_user' => 'users#new'

  resources :request_types, only: [:index]

  resources :service_requests do
    resources :notes
    get 'export', on: :collection
  end

  resources :request_types, only: [:index]

  root to: 'pages#index'
end
