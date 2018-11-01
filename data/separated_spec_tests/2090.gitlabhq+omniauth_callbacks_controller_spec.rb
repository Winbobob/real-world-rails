require 'spec_helper'

describe Ldap::OmniauthCallbacksController do
  include_context 'Ldap::OmniauthCallbacksController'

  it 'allows sign in' 


  it 'respects remember me checkbox' 


  context 'with 2FA' do
    let(:user) { create(:omniauth_user, :two_factor_via_otp, extern_uid: uid, provider: provider) }

    it 'passes remember_me to the Devise view' 

  end

  context 'access denied' do
    let(:valid_login?) { false }

    it 'warns the user' 


    it "doesn't authenticate user" 

  end

  context 'sign up' do
    let(:user) { double(email: 'new@example.com') }

    before do
      stub_omniauth_setting(block_auto_created_users: false)
    end

    it 'is allowed' 

  end
end

