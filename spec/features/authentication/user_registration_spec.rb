require 'rails_helper'
require 'support/stubs/facebook_omniauth.rb'

RSpec.describe 'New user registration' do
  context 'as an unregistered user using facebook auth' do
    scenario 'with valid credentials' do
      stub_facebook_auth

      visit root_path

      expect(current_path).to eq(new_session_path)

      click_on 'Sign in with Facebook'

      expect(current_path).to eq(new_account_path)
      expect(User.count).to eq(1)
    end
  end
end
