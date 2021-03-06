class ArticlesController < ApplicationController
  before_action :require_user, only: [:new, :edit, :create, :update, :destroy]
 
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @user = User.find(current_user.id)
    @article = @user.articles.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @user = User.find(current_user.id)
    @article = @user.articles.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
