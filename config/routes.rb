Rails.application.routes.draw do
  root "home#index"
  get '/still', to: 'home#index'
  get '/checked', to: 'home#index'
  get '/signup', to: 'home#index'
  get '/login', to: 'home#index'
  namespace :api, { format: "json" } do
  	namespace :v1 do
  	  resources :todos, :only => [:index, :create, :update, :destroy]
    end
    namespace :v2 do
      post 'signup', controller: :users, action: :create
      post 'signin', controller: :sessions, action: :create
      delete 'signin', controller: :sessions, action: :destroy
      post 'refresh', controller: :refresh, action: :create
    end
  end
end
