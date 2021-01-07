class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:create, :login]

  def index
    @users = User.all

    render json: @users
  end

  def login  
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
        @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
        render json: {user: @user, token: @token}
    else
        render json: {message: "Invalid credentials!"}
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
