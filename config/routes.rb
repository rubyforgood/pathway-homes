Rails.application.routes.draw do

  get 'pages/about'

  get 'pages/contact'

  devise_for :users
  resources :users
  
  get 'admin/create_user' => 'users#new'

  resources :request_types, only: [:index]

  resources :service_requests do
    resources :notes
    get 'export', on: :collection
  end

  root to: 'pages#index'
end
