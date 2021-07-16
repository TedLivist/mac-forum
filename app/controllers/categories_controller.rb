# rubocop:disable Style/GuardClause, Style/SoleNestedConditional

class CategoriesController < ApplicationController
  before_action :check_admin, only: [:create]

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      flash[:notice] = 'Category has been saved'
      redirect_to @category
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def check_admin
    @user = User.where(username: 'admin').take

    unless @user.nil?
      @user.toggle!(:admin) unless @user.adminn?
    end

    unless current_user.adminn?
      flash[:alert] = 'Only admin can create category'
      redirect_back(fallback_location: :back) and return
    end
  end
end

# rubocop:enable Style/GuardClause, Style/SoleNestedConditional
