class WelcomeController < ApplicationController
  def index
    
  end
  
  def comments_count
    Article.find(params[:id]).comments.size
  end
end