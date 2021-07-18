module CategoriesHelper
  def cate_articles(category, category_articles)
    if !category_articles.empty?
      render 'categories/cate_article', obj: category
    else
      "There are no articles in this category"
    end
  end
end
