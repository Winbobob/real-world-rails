require 'spec_helper_min'
require 'support/helpers'

describe Carto::Api::Public::UsersController do
  include Warden::Test::Helpers
  include HelperMethods

  before(:all) do
    @user = FactoryGirl.create(:valid_user)
    @org = FactoryGirl.create(:organization_with_users)
    @org_user = FactoryGirl.create(:valid_user, name: 'wa', last_name: 'dus', organization: @org)
  end

  before(:each) do
    host! "#{@user.username}.localhost.lan"
  end

  after(:all) do
    @user.destroy
    @org_user.destroy
    @org.destroy
  end

  describe '#me_public' do
    it 'works with master api_key' 


    it 'works with regular api_key' 


    it 'return 401 without api_key' 


    it 'return 401 with cookie auth' 


    it 'returns user public profile with user:profile grants' 


    it 'does not return user public profile without user:profile grants' 

  end
end

