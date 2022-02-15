class UsersController < ApplicationController

  before_action :require_user, only: [:my_portfolio]

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

  def my_portfolio
    @user = current_user
  end




  def search_friend

    if params[:friend].present?
      @people = User.look_friend_up(params[:friend])
      if @people.nil?
        redirect_to friendships_path, alert: "There's nobody with that username."
      else
        render 'friendships/index'
      end
    else
      redirect_to friendships_path, alert: "You must enter a value."
    end
  end




  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
