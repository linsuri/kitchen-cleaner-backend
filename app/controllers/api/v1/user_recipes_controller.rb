class Api::V1::UserRecipesController < ApplicationController
  def index
    @user_recipes = UserRecipe.all
    render json: @user_recipes
  end

end
