# encoding: utf-8

require_relative '../../../spec_helper'
require_relative '../../../../app/controllers/carto/api/organizations_controller'
require 'helpers/unique_names_helper'

describe Carto::Api::OrganizationUsersController do
  include_context 'organization with users helper'
  include UniqueNamesHelper
  include Rack::Test::Methods
  include Warden::Test::Helpers

  def soft_limits(user)
    [
      user.soft_geocoding_limit,
      user.soft_twitter_datasource_limit,
      user.soft_here_isolines_limit,
      user.soft_obs_snapshot_limit,
      user.soft_obs_general_limit
    ]
  end

  def set_soft_limits(user, soft_limits)
    user.soft_geocoding_limit = soft_limits[0]
    user.soft_twitter_datasource_limit = soft_limits[1]
    user.soft_here_isolines_limit = soft_limits[2]
    user.soft_obs_snapshot_limit = soft_limits[3]
    user.soft_obs_general_limit = soft_limits[4]
  end

  def replace_soft_limits(user, soft_limits)
    old_soft_limits = soft_limits(user)
    set_soft_limits(user, soft_limits)
    user.save
    old_soft_limits
  end

  def user_params_soft_limits(username, soft_limit, with_password: false)
    user_params(username,
                soft_geocoding_limit: soft_limit,
                soft_twitter_datasource_limit: soft_limit,
                soft_here_isolines_limit: soft_limit,
                soft_obs_snapshot_limit: soft_limit,
                soft_obs_general_limit: soft_limit,
                with_password: with_password)
  end

  def user_params(username = nil,
                  with_password: false,
                  soft_geocoding_limit: false,
                  soft_twitter_datasource_limit: nil,
                  soft_here_isolines_limit: nil,
                  soft_obs_snapshot_limit: nil,
                  soft_obs_general_limit: nil,
                  viewer: nil,
                  org_admin: nil,
                  email: "#{username}@carto.com",
                  force_password_change: false)

    params = {
      password: '2{Patrañas}',
      quota_in_bytes: 1024
    }
    unless username.nil?
      params[:username] = username
      params[:email] = email
    end
    params[:soft_geocoding_limit] = soft_geocoding_limit unless soft_geocoding_limit.nil?
    params[:soft_twitter_datasource_limit] = soft_twitter_datasource_limit unless soft_twitter_datasource_limit.nil?
    params[:soft_here_isolines_limit] = soft_here_isolines_limit unless soft_here_isolines_limit.nil?
    params[:soft_obs_snapshot_limit] = soft_obs_snapshot_limit unless soft_obs_snapshot_limit.nil?
    params[:soft_obs_general_limit] = soft_obs_general_limit unless soft_obs_general_limit.nil?
    params[:viewer] = viewer if viewer
    params[:org_admin] = org_admin if org_admin
    params[:force_password_change] = force_password_change

    params.except!(:password) unless with_password
    params
  end

  def verify_soft_limits(user, value)
    user.soft_geocoding_limit.should eq value
    user.soft_twitter_datasource_limit.should eq value
    user.soft_here_isolines_limit.should eq value
    user.soft_obs_snapshot_limit.should eq value
    user.soft_obs_general_limit.should eq value
  end

  before(:all) do
    @org_user_2.org_admin = true
    @org_user_2.save
  end

  before(:each) do
    ::User.any_instance.stubs(:validate_credentials_not_taken_in_central).returns(true)
    ::User.any_instance.stubs(:create_in_central).returns(true)
    ::User.any_instance.stubs(:update_in_central).returns(true)
    ::User.any_instance.stubs(:delete_in_central).returns(true)
    ::User.any_instance.stubs(:load_common_data).returns(true)
    ::User.any_instance.stubs(:reload_avatar).returns(true)
  end

  before(:each) do
    @old_soft_limits = soft_limits(@organization.owner)
    @old_whitelisted_email_domains = @organization.whitelisted_email_domains
  end

  after(:each) do
    set_soft_limits(@organization.owner, @old_soft_limits)
    @organization.owner.save

    @organization.whitelisted_email_domains = @old_whitelisted_email_domains
    @organization.save
  end

  describe 'user creation' do
    it 'returns 401 for non authorized calls' 


    it 'returns 401 for non authorized users' 


    it 'accepts org owners' 


    it 'accepts org admins' 


    it 'returns 410 if email is not present' 


    it 'returns 410 if username is not present' 


    it 'returns 410 if password is not present' 


    it 'correctly creates a user' 


    it 'does not take email whitelisting into account for user creation' 


    it 'assigns soft_geocoding_limit to false by default' 


    it 'can create viewers' 


    it 'creates non-admin builders by default' 


    it 'can create organization admins' 


    it 'admins cannot create other organization admins' 


    it 'can enable soft geocoding_limit, twitter_datasource_limit, here_isolines_limit, obs_snapshot_limit and obs_general_limit if owner has them' 


    it 'can disable soft geocoding_limit, twitter_datasource_limit, here_isolines_limit, obs_snapshot_limit and obs_general_limit if owner has them' 


    it 'cannot enable soft geocoding_limit, twitter_datasource_limit, here_isolines_limit, obs_snapshot_limit or obs_general_limit if owner has not them' 


    describe 'with password expiration' do
      before(:all) do
        @organization.password_expiration_in_d = 10
        @organization.save
      end

      after(:all) do
        @organization.password_expiration_in_d = nil
        @organization.save
      end

      it 'can create users with expired passwords' 

    end
  end

  describe 'user update' do
    it 'returns 401 for non authorized calls' 


    it 'returns 401 for non authorized users' 


    it 'accepts org owners' 


    it 'accepts org admins' 


    it 'org admins cannot update other admins' 


    it 'org admins cannot convert other users into admins' 


    it 'should do nothing if no update params are provided' 


    it 'should update password' 


    it 'fails to update password if the same as old_password' 


    it 'should update email' 


    it 'should update viewer' 


    it 'should update org_admin' 


    it 'should reject viewers who are also admins' 


    it 'should update quota_in_bytes' 


    it 'should not update soft_geocoding_limit if owner has not it' 


    it 'should update soft_geocoding_limit' 


    it 'should do full update' 


    it 'can enable soft geocoding_limit, twitter_datasource_limit, here_isolines_limit, obs_snapshot_limit and obs_general_limit if owner has them' 


    it 'can disable soft geocoding_limit, twitter_datasource_limit, here_isolines_limit, obs_snapshot_limit and obs_general_limit if owner has them' 


    it 'cannot enable soft geocoding_limit, twitter_datasource_limit, here_isolines_limit, obs_snapshot_limit and obs_general_limit if owner has not them' 


    it 'should not update if it cannot update in central' 


    it 'should validate password before updating in Central' 


    it 'should validate before updating in Central' 

  end

  describe 'user deletion' do
    it 'returns 401 for non authorized calls' 


    it 'returns 401 for non authorized users' 


    it 'should delete users as owner' 


    it 'should delete users with unregistered tables if force parameter is present' 


    it 'should fail trying to delete users with unregistered tables and no force parameter present' 


    it 'should delete users as admin' 


    it 'should not delete other admins as admin' 


    it 'should not allow to delete the org owner' 


    describe 'with Central' do
      before(:each) do
        ::User.any_instance.unstub(:delete_in_central)
        Cartodb::Central.stubs(:sync_data_with_cartodb_central?).returns(true)
        @organization.reload
        @user_to_be_deleted = @organization.non_owner_users.first
      end

      def mock_delete_request(code)
        response_mock = mock
        response_mock.stubs(:code).returns(code)
        response_mock.stubs(:body).returns('{"errors": []}')
        Carto::Http::Request.any_instance.stubs(:run).returns(response_mock)
      end

      it 'should delete users in Central' 


      it 'should delete users missing from Central' 


      it 'should not delete users from Central that failed to delete in the box' 

    end
  end

  describe 'user show' do
    it 'returns 401 for non authorized calls' 


    it 'returns 401 for non authorized users' 


    it 'should return 404 for non existing users' 


    it 'should show existing users' 

  end

  describe 'user list' do
    it 'returns 401 for non authorized calls' 


    it 'returns 401 for non authorized users' 


    it 'should list users' 

  end
end

