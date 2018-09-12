class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  ####################### Not working. Might be because of strong params.
  def create
    @recipe = Recipe.new(recipe_object: params[:recipe_object], user: params[:user])
    byebug
    if @recipe.save
      render json: @recipe
    else
      render json: {errors: "Recipe did not save"}
    end
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

  private

  def recipe_params
    params.permit(:recipe_object, :user)
  end
end
