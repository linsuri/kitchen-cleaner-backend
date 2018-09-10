class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show_recipes
    app_id = '8d1d3268'
    app_key = 'ccb8a47a38fe914e9ab5698068bc2dec'
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + app_id + "&_app_key=" + app_key + params["ingredients"]
    request = RestClient.get(url)
    response = JSON.parse(request)
    render json: response
  end

end
