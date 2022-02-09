class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Login successfully."
      session[:user_id] = @user.id
    else
      render :new, alert: "Invalid params, try again."
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
