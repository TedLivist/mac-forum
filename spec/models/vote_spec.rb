require 'rails_helper'

describe 'Vote', type: :model do
  before :each do
    c = Category.create(name: "West", priority: :high)
    author = User.create(username: "user_name", email: "xcv@vv.com", password: "123456", password_confirmation: "123456")
    file = Rails.root.join('app', 'assets', 'images', 'blogging.jpg')
    image = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'blogging.jpg',
      content_type: 'image/jpg'
    ).signed_id

    Article.create(title: 'New title', text: 'This is my second post', image: image, author_id: author.id, category_ids: [c.id])
  end
  context 'when no user is provided' do
    it 'returns error' do
      u = User.last
      v = Vote.new(user_id: u.id)
      v.valid?
      expect(v.errors.empty?).to be(false)
    end
  end

  context 'when no article is provided' do
    it 'does not save' do
      a = Article.last
      v = Vote.new(article_id: a.id)
      v.save
      expect(v.persisted?).to be(false)
    end
  end

  context 'when user and article are provided' do
    it 'saves the vote' do
      a = Article.last
      u = User.last
      v = Vote.new(user_id: u.id, article_id: a.id)
      v.save
      expect(v.persisted?).to be(true)
    end
  end
end