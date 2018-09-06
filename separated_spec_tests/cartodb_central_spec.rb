require 'spec_helper'
require_relative '../../lib/cartodb/central'

def config
  Cartodb.config[:cartodb_central_api].present? ? Cartodb.config[:cartodb_central_api].deep_symbolize_keys : nil
end

def config_present?
  config.present? && config[:username].present? && config[:password].present?
end

def assert_headers_and_auth(request)
  request.options[:headers]["Content-Type"].should == "application/json"
  request.options[:userpwd].should == "#{ config[:username] }:#{ config[:password] }"
end

describe Cartodb::Central do

  before(:all) do
    if config_present?
      @organization = create_organization_with_users(name: 'test-org')
      @user = @organization.users.first
      @user.username = 'user1'
      @user.save
      @cartodb_central_client = Cartodb::Central.new
      @org_path = "/api/organizations/#{ @organization.name }"
      @users_path = "#{ @org_path }/users"
      @user_path = "#{ @users_path }/#{ @user.username }"
    end
  end

  after(:all) do
    bypass_named_maps
    @user && @user.destroy
  end

  describe "Central synchronization client" do

    before(:each) do
      pending "Central API credentials not present in app_config.yml" unless config_present?
    end

    describe "Organization users" do
      it "gets all users from an organization" 


      it "gets an organization user" 


      it "creates an organization user" 


      it "updates an organization user" 


      it "deletes an organization user" 

    end

    describe "Organizations" do
      it "updates an organization" 

    end

  end

end

