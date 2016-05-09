class WelcomeController < ApplicationController
  def index
    @articles = Article.all
    @cmts = @articles.sort_by{|f| f.comments.size}
  end

end