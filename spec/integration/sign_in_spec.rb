require 'rails_helper'

describe 'Sign in', type: :system do
  describe 'Creating new user' do
    before :each do
      visit new_user_session_path
    end
    context 'when no username is provided' do
      it 'returns username error' do
        fill_in 'Password', with: '123456'
        click_button 'Log in'
        expect(page).to have_content('Invalid Username or password')
      end
    end

    context 'user details are correct' do
      it 'logs user in' do
        User.create(username: 'user', email: 'user@vv.com', password: '123456', password_confirmation: '123456')
        visit new_user_session_path
        fill_in 'Username', with: 'user'
        fill_in 'Password', with: '123456'
        click_button 'Log in'
        expect(page).to have_content('Signed in successfully.')
      end
    end
  end
end
