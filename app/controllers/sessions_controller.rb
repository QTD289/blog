class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    @user = User.find_by_name(params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Login successfully!"
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      flash[:danger] = "Wrong Name or Password!"
      redirect_to login_path
    end 
  end
  
  def destroy 
    flash[:success] = "Logged out!"
    session[:user_id] = nil 
    redirect_to articles_path 
  end


end
