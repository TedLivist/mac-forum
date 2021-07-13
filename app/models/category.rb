class Category < ApplicationRecord
  enum priority: { high: 0, medium: 1, low: 2 }

  validates :priority, presence: true
  validates :name, presence: true

  has_many :article_categories
  has_many :articles, through: :article_categories
end
