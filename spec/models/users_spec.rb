require 'rails_helper'

describe 'User', type: :feature do
  describe '#create user' do
    context 'when username field is empty' do
      it 'does not save' do
        u = User.new(username: "", email: "user_1@vv.com", password: "123456", password_confirmation: "123456")
        u.save
        expect(u.persisted?).to be(false)
      end
    end

    context 'when email field is empty' do
      it 'returns errors' do
        u = User.new(username: "Ferdinand", email: "", password: "123456", password_confirmation: "123456")
        u.valid?
        expect(u.errors.empty?).to be(false)
      end
    end

    context 'when password fields do not match' do
      it 'returns errors' do
        u = User.new(username: "Ferdinand", email: "user_2@vv.com", password: "123456", password_confirmation: "13456")
        u.valid?
        expect(u.errors.empty?).to be(false)
      end

      it 'does not save' do
        u = User.new(username: "Ferdinand", email: "user_3@vv.com", password: "123456", password_confirmation: "12346")
        u.save
        expect(u.persisted?).to be(false)
      end
    end

    context 'when all fields are valid' do
      it 'saves' do
        u = User.new(username: "Ferdinand", email: "lol@vv.com", password: "123456", password_confirmation: "123456")
        u.save
        expect(u.persisted?).to be(true)
      end
    end
  end
end