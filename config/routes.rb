Rails.application.routes.draw do
  devise_for :users

  resources :service_requests

  root to: 'service_requests#new'
end
