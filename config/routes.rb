Rails.application.routes.draw do
  devise_for :users

  resources :service_requests do
    resources :notes
    get 'export', on: :collection
  end

  root to: 'service_requests#new'
end
