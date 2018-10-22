class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show_recipes, :destroy]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def create
    @recipe = Recipe.create(recipe_object: params[:recipe][:recipe_object], user_id: recipe_params[:user_id])
    if @recipe.valid?
      render json: { recipe: RecipeSerializer.new(@recipe) }, status: :created
    else
      render json: { errors: "Recipe did not save" }, status: :not_acceptable
    end
  end

  def destroy
    @recipe = Recipe.find_by(recipe_object: params[:recipe][:recipe_object], user_id: recipe_params[:user_id])
    if @recipe.destroy
      render json: { recipe: RecipeSerializer.new(@recipe), message: "Recipe unsaved" }, status: :accepted
    else
      render json: { errors: "Recipe unsave failed" }, status: :not_acceptable
    end
  end

  def show_recipes
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + ENV["SECRET_ONE"] + "&_app_key=" + ENV["SECRET_TWO"] + params["ingredients"] + "&maxResult=400&start=400"
    request = RestClient.get(url)
    response = JSON.parse(request)
    render json: response
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_object, :user_id)
  end
end
