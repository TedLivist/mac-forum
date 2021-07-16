class HomeController < ApplicationController
  def index

    if Article.count > 0
      @top_vote_article = Article.find(Vote.group(:article_id).count.max_by{|k, v| v}[0])
    else
      @top_vote_article = nil
    end
    
  end
end
