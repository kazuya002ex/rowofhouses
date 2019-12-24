Rails.application.routes.draw do
  root "home#index"
  get '/still', to: 'home#index'
  get '/checked', to: 'home#index'
  get '/signup', to: 'home#index'
  get '/signin', to: 'home#index'
  
  namespace :api, { format: "json" } do
    resources :todos, :only => [:index, :create, :update, :destroy]
    get 'checks', controller: :checks, action: :index
    get 'stills', controller: :stills, action: :index
    post 'signup', controller: :users, action: :create
    get 'users', controller: :users, action: :show
    post 'signin', controller: :sessions, action: :create
    delete 'signin', controller: :sessions, action: :destroy
    post 'refresh', controller: :refresh, action: :create
  end
end
