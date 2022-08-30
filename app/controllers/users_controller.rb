class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end

    # if user = User.authenticate_with_credentials(user_params)
    #   # success logic, log them in
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    #   # failure, render login form
    #   redirect_to '/signup'
    # end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
