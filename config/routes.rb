Rails.application.routes.draw do
  get 'users/Authentication'
  namespace :api do
    namespace :v1 do
      resources :users, only: :index
      resources :courses
      post 'authenticate', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end
