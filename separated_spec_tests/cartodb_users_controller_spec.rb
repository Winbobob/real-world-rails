# encoding: utf-8

require_relative '../../spec_helper_min'
require_relative '../../support/factories/users'

describe Admin::UsersController do
  include Rack::Test::Methods
  include Warden::Test::Helpers
  include CartoDB::Factories

  before(:all) do
    @user = create_user(password: 'abcdefgh')
  end

  after(:all) do
    @user.destroy
  end

  before(:each) do
    # Reload user, cannot use reload because it does not reload password fields
    @user = ::User[@user.id]
    host! "#{@user.username}.localhost.lan"
    login_as(@user, scope: @user.username)
  end

  describe '#delete' do
    let(:password) { 'abcdefgh' }
    before(:all) do
      @user2 = create_user(password: password)
      @saml_organization = FactoryGirl.create(:saml_organization)
      @saml_user = create_user(password: password, organization_id: @saml_organization.id)
      @saml_user.reload
    end

    after(:all) do
      @saml_organization.destroy_cascade
    end

    it 'requires password' 


    it 'does not require password for SAML organizations' 


    it 'deletes if password match' 

  end

  describe '#update' do
    describe '#account' do
      it 'updates password' 


      it 'updates email' 


      it 'does not update account if communication with Central fails' 


      it 'validates before updating in Central' 

    end

    describe '#profile' do
      it 'updates profile' 


      it 'does not update profile if communication with Central fails' 

    end
  end
end

