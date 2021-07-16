# rubocop:disable Style/ConditionalAssignment

class HomeController < ApplicationController
  def index
    if Article.count.positive?
      @top_vote_article = Article.find(Vote.group(:article_id).count.max_by { |_k, v| v }[0])
    else
      @top_vote_article = nil
    end
  end
end

# rubocop:enable Style/ConditionalAssignment
