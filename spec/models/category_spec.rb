require 'rails_helper'

describe 'Category', type: :model do
  context 'when no name is provided' do
    it 'does not save' do
      c = Category.new(priority: :low)
      c.save
      expect(c.persisted?).to be(false)
    end

    context 'when no priority is provided' do
      it 'does not save' do
        c = Category.new(name: "Fernando")
        expect(c.valid?).to be(false)
      end
    end
  end
end