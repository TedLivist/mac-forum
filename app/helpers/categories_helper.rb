module CategoriesHelper
  def cate_articles(category, category_articles)
    if category_articles.empty?
      'There are no articles in this category'
    else
      render 'categories/cate_article', obj: category
    end
  end
end
