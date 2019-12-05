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
      resources :users, :only => [:create]
    end
  end
end
