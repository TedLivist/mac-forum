class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = "Article created"
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_ids)
  end

end
