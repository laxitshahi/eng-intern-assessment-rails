class ArticlesController < ApplicationController
  def index
    @articles = Article.search(params[:query])
  end
end
