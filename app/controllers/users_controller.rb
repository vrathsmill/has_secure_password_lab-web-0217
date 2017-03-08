class UsersController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
end

    def home
    end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
