class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show_recipes
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + ENV["SECRET_ONE"] + "&_app_key=" + ENV["SECRET_TWO"] + params["ingredients"]
    request = RestClient.get(url)
    response = JSON.parse(request)
    # response.matches.each do |recipe| 
    #   Recipe.create(alkrlkjaerg: recipe.algerjlaejrg)
    # end
    render json: response
  end

end
