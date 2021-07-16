class HomeController < ApplicationController
  def index
    @top_vote_article = Article.find(Vote.group(:article_id).count.max_by{|k, v| v}[0])
  end
end
