# rubocop:disable Style/GuardClause, Style/SoleNestedConditional

class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :check_admin, only: %i[new create]

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
      @user.toggle!(:adminn) unless @user.adminn?
    end

    unless current_user.adminn?
      flash[:alert] = 'Only admin can create category'
      redirect_to root_path and return
    end
  end
end

# rubocop:enable Style/GuardClause, Style/SoleNestedConditional
