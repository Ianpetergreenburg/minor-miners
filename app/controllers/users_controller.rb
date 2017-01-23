class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id].to_i)
  end

  def create

    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def login_form
    @user = User.new
    render "login_form"
  end

  def login
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to action: "index"
    else
      @user = nil
      render "login_form"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to action: "index"
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end

