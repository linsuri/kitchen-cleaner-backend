class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      if params[:name] == ''
        render json: {errors: "Username field must not be blank"}
      else
        render json: {errors: "Username already exists"}
      end
    end
  end

  private
  def user_params
    params.permit(:name)
  end

end
