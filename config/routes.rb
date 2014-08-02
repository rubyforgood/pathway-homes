Rails.application.routes.draw do
  devise_for :users,  :controllers => { registrations: "users/registrations" }
  devise_scope :user do
    get '/users/add_user' => 'users/registrations#new'
  end
  
  resources :service_requests
  root to: 'service_requests#new'
end
