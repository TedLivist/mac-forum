class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true
  validates :text, presence: true, length: { minimum: 10 }
end
