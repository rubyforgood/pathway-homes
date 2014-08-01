Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/add_user' => 'devise/registrations#new'
  end
  
  resources :service_requests
  root to: 'service_requests#new'
end
