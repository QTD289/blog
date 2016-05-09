class UsersController < ApplicationController
  
  def new 
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params) 
    if @user.save 
      flash[:success] = "Your user is created!"
      session[:user_id] = @user.id 
      redirect_to '/' 
    else 
      flash[:danger] = "Name is already taken, please choose another name."
      redirect_to '/signup' 
    end 
  end

  
  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
