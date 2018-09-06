require 'spec_helper'

describe Gitlab::Auth::LDAP::Authentication do
  let(:dn)       { 'uid=John Smith, ou=People, dc=example, dc=com' }
  let(:user)     { create(:omniauth_user, extern_uid: Gitlab::Auth::LDAP::Person.normalize_dn(dn)) }
  let(:login)    { 'john' }
  let(:password) { 'password' }

  describe 'login' do
    before do
      allow(Gitlab::Auth::LDAP::Config).to receive(:enabled?).and_return(true)
    end

    it "finds the user if authentication is successful" 


    it "is false if the user does not exist" 


    it "is false if authentication fails" 


    it "fails if ldap is disabled" 


    it "fails if no login is supplied" 


    it "fails if no password is supplied" 

  end
end

