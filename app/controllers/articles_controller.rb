class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:notice] = 'Article created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    flash[:alert] = 'Article has been deleted'
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
