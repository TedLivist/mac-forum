require 'rails_helper'

describe 'Article', type: :feature do
  describe 'Creating article' do
    context 'when no title is provided' do
      it 'does not save' do
        a = Article.new(title: '', text: 'Active Record Connection Adapter', author_id: 2)
        expect(a.valid?).to be(false)
      end
    end

    context 'when no text is provided' do
      it 'returns a specific error message' do
        a = Article.new(title: 'New title', text: '', author_id: 2)
        a.valid?
        expect(a.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end