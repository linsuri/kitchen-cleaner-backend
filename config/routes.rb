Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :recipes, only: [:index, :create]
      post '/show_recipes', to: "recipes#show_recipes"
    end
  end
end
