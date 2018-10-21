class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show_recipes]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  ####################### Not working. Might be because of strong params.
  def create
    @recipe = Recipe.create(recipe_object: params[:recipe][:recipe_object], user_id: recipe_params[:user_id])
    if @recipe.valid?
      render json: { recipe: RecipeSerializer.new(@recipe) }, status: :created
    else
      render json: {errors: "Recipe did not save"}, status: :not_acceptable
    end
  end

  def show_recipes
    url = "http://api.yummly.com/v1/api/recipes?_app_id=" + ENV["SECRET_ONE"] + "&_app_key=" + ENV["SECRET_TWO"] + params["ingredients"] + "&maxResult=400&start=400"
    request = RestClient.get(url)
    response = JSON.parse(request)
    # response.matches.each do |recipe|
    #   Recipe.create(alkrlkjaerg: recipe.algerjlaejrg)
    # end
    render json: response
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_object, :user_id)
  end
end
