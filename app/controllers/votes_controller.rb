class VotesController < ApplicationController

  def create

    @article = Article.find(params[:article_id])

    add_vote = current_user.votes.build(vote_params)

    check_vote = Vote.where(user_id: current_user, article_id: params[:article_id]).take

    if !check_vote.nil?
      flash[:alert] = 'You cannot vote twice'
      redirect_to @article and return
    elsif add_vote.save
        flash[:notice] = 'You have voted this article'
        redirect_to @article and return
    else
      flash[:alert] = 'Vote not added'
      redirect_to root_path and return
    end

  end

  private

  def vote_params
    params.permit(:article_id)
  end

end
