module HomeHelper
  def card_helper(category, articles)
    if articles.empty?
      render 'home/else_category', obj: category
    else
      render 'home/card_category', obj: category
    end
  end

  def jumbo_helper(article_with_top_vote)
    if article_with_top_vote.nil?
      render 'no_vote_jumbo'
    else
      render 'top_vote_jumbo', obj: article_with_top_vote
    end
  end
end
