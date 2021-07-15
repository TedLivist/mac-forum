require 'rails_helper'

describe 'Sign up', type: :system do
  describe 'Creating new user' do
    before :each do
      visit new_user_registration_path
    end
    context 'when no username is provided' do
      it 'returns username error' do
        fill_in 'Email', with: 'no_user@vv.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        click_button 'Sign up'
        expect(page).to have_content("Username can't be blank")
      end
    end

    context 'when login is click' do
      it 'redirects to login page' do
        click_link 'Log in'
        expect(page).to have_content('Forgot your password')
      end
    end
  end
end