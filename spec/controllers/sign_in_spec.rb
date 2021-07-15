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
        sleep(2)
        expect(page).to have_content("Invalid Username or password")
      end
    end
  end
end