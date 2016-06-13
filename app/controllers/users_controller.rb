class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def options
    render text: ''
  end
  
  def index
    @users = User.all
    render json: @users.to_json
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: {message: @user.errors.full_messages}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: {message: @user.errors.full_messages,params: params.inspect}
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user
    else
      render json: {message: 'Something went wrong while deleting user'}
    end
  end

  private

  def user_params
    params.permit(:id, :first_name, :last_name, :username, :email, :password)
  end
end