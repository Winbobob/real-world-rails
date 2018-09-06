require 'spec_helper'

describe PasswordsController do
  describe '#check_password_authentication_available' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context 'when password authentication is disabled for the web interface and Git' do
      it 'prevents a password reset' 

    end

    context 'when reset email belongs to an ldap user' do
      let(:user) { create(:omniauth_user, provider: 'ldapmain', email: 'ldapuser@gitlab.com') }

      it 'prevents a password reset' 

    end
  end
end

