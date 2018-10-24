class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      if params[:user][:user_name] == ''
        render json: {errors: "Username field must not be blank"}, status: :not_acceptable
      elsif params[:user][:password] == ''
        render json: {errors: "Password field must not be blank"}, status: :not_acceptable
      else
        render json: {errors: "Username already exists"}, status: :not_acceptable
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
