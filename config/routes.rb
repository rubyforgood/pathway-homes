Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/about'

  get 'pages/contact'

  devise_for :users

  resources :service_requests do
    resources :notes
    get 'export', on: :collection
  end

  root to: 'pages#index'
end
