class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
      flash[:new_user] = "You've successfully registered"
    else
      flash.now[:invalid_user] = "Try again. Username and Password are required"
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
