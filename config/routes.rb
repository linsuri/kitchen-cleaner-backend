Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :recipes, only: [:index]
      resources :user_recipes, only: [:index]
      post '/show_recipes', to: "recipes#show_recipes"
    end
  end
end
