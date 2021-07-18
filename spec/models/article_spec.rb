require 'rails_helper'

describe 'Article', type: :model do
  before :each do
    Category.create(name: "West", priority: :high)
    User.create(username: "user_name", email: "xcv@vv.com", password: "123456", password_confirmation: "123456")
  end
  describe 'Creating article' do
    
    context 'when no title is provided' do
      it 'does not save' do
        c = Category.last
        u = User.last
        a = Article.new(title: '', text: 'Active Record Connection Adapter', author_id: u.id, category_ids: c.id)
        expect(a.valid?).to be(false)
      end
    end

    context 'when no text is provided' do
      it 'returns a specific error message' do
        u = User.last
        c = Category.last
        a = Article.new(title: 'New title', text: '', author_id: u.id, category_ids: c.id)
        a.valid?
        expect(a.errors.full_messages).to include("Text can't be blank")
      end
    end

    context 'when no image is provided' do
      it 'does not save' do
        c = Category.last
        a = Article.new(title: 'New title', text: 'This is my second post', author_id: 2, category_ids: c.id)
        a.save
        expect(a.persisted?).to be(false)
      end
    end

    context 'when all details are provided' do
      it 'saves' do
        c = Category.last
        u = User.last
        
        file = Rails.root.join('app', 'assets', 'images', 'blogging.jpg')
        image = ActiveStorage::Blob.create_after_upload!(
          io: File.open(file, 'rb'),
          filename: 'blogging.jpg',
          content_type: 'image/jpg'
        ).signed_id

        a = Article.new(title: 'New title', text: 'This is my second post', image: image, author_id: u.id, category_ids: [c.id])
        a.save
        expect(a.persisted?).to be(true)
      end
    end
    
  end
end