Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :current_user]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :recipes, only: [:index, :create, :destroy]
      delete '/recipes', to: 'recipes#destroy'
      post '/show_recipes', to: "recipes#show_recipes"
    end
  end
end
