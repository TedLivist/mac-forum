module HomeHelper
  def card_helper(category, articles)
    unless articles.empty?
      render 'home/card_category', obj: category
    else
      render 'home/else_category', obj: category
    end
  end

  def jumbo_helper(article_with_top_vote)
    unless @top_vote_article.nil?
      render 'top_vote_jumbo', obj: article_with_top_vote
    else
      render 'no_vote_jumbo'
    end
  end
end
