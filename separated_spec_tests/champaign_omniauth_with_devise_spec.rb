# frozen_string_literal: true
require 'rails_helper'

describe 'Omniauth with Devise' do
  def login_with_google(email = 'cesar@example.com')
    login_with_oauth2(:google_oauth2,       uid:      '12345',
                                            provider: 'google_oauth2',
                                            info: {
                                              email: email
                                            })
  end

  subject(:user) { User.first }

  context 'new user' do
    before(:each) { login_with_google }

    it 'creates account' 

  end

  context 'existing user' do
    let!(:existing_user) { User.create(email: 'cesar@example.com', password: 'password', password_confirmation: 'password') }

    it 'updates accounts' 

  end

  context 'not whitelisted' do
    it 'redirects home' 

  end
end

