# encoding: utf-8

require_relative '../../spec_helper_min'

describe Admin::OrganizationUsersController do
  include_context 'organization with users helper'
  include Rack::Test::Methods
  include Warden::Test::Helpers

  before(:each) do
    host! "#{@organization.name}.localhost.lan"
  end

  let(:username) { unique_name('user') }

  let(:user_params) do
    {
      username: username,
      email: "#{username}@org.com",
      password: 'user-1',
      password_confirmation: 'user-1',
      quota_in_bytes: 1000,
      twitter_datasource_enabled: false
    }
  end

  describe 'security' do
    before(:all) do
      @org_user_2.org_admin = true
      @org_user_2.save

      @owner = @org_user_owner
      @admin = @org_user_2
      @user = @org_user_1
    end

    before(:each) do
      User.any_instance.stubs(:validate_credentials_not_taken_in_central).returns(true)
      User.any_instance.stubs(:create_in_central).returns(true)
      User.any_instance.stubs(:update_in_central).returns(true)
      User.any_instance.stubs(:delete_in_central).returns(true)
      User.any_instance.stubs(:load_common_data).returns(true)
      User.any_instance.stubs(:reload_avatar).returns(true)
    end

    describe '#show' do
      it 'returns 404 for non admin users' 


      it 'returns 200 for admin users' 


      it 'returns 200 for owner' 

    end

    describe '#new' do
      it 'returns 404 for non admin users' 


      it 'returns 200 for admin users' 


      it 'returns 200 for owner' 

    end

    describe '#create' do
      after(:each) do
        Carto::User.find_by_username(user_params[:username]).try(:destroy)
      end

      it 'returns 404 for non admin users' 


      it 'returns 200 for admin users trying to create an admin' 


      it 'returns 403 for admin users trying to create an admin if wrong password_confirmation' 


      it 'returns 302 for admin users trying to create a non-admin' 


      it 'returns 302 for owner' 

    end

    describe '#edit' do
      it 'returns 404 for non admin users' 


      it 'returns 403 for admin users trying to edit an admin' 


      it 'returns 200 for admin users trying to edit a non-admin' 


      it 'returns 200 for admin users trying to edit themselves' 


      it 'returns 200 for owner' 

    end

    describe '#update' do
      it 'returns 404 for non admin users' 


      it 'returns 403 for admin users trying to edit an admin' 


      it 'returns 200 with error for admin users trying to convert a user into an admin' 


      it 'returns 403 if wrong password_confirmation' 


      it 'returns 302 for admin users trying to edit a non-admin' 


      it 'returns 302 for admin users trying to edit themselves' 


      it 'returns 302 for owner' 

    end

    describe '#destroy' do
      it 'returns 404 for non admin users' 


      it 'returns 403 for admin users trying to destroy an admin' 


      it 'returns 302 for admin users trying to destroy a non-admin' 


      it 'returns error if wrong password_confirmation' 


      it 'returns 302 for owner' 

    end
  end

  describe 'owner behaviour' do
    before(:each) do
      User.any_instance.stubs(:update_in_central).returns(true)
      User.any_instance.stubs(:create_in_central).returns(true)
      login_as(@org_user_owner, scope: @org_user_owner.username)
    end

    describe '#new' do
      it 'quota defaults to organization default' 


      it 'quota defaults to remaining quota if the assigned default goes overquota' 

    end

    describe '#show' do
      it 'returns 200 for organization owner users' 

    end

    describe '#create' do
      it 'creates users' 

    end

    describe 'existing user operations' do
      before(:each) do
        @existing_user = FactoryGirl.create(:carto_user, organization: @carto_organization, password: 'abcdefgh')
      end

      describe '#update' do
        after(:each) do
          ::User[@existing_user.id].destroy
        end

        it 'updates users' 


        it 'does not update users in case of Central failure' 


        it 'validates before updating in Central' 


        it 'cannot update password if it does not change old_password' 

      end

      describe '#destroy' do
        it 'deletes users' 

      end
    end

    describe 'soft limits' do
      before(:each) do
        User.any_instance.stubs(:load_common_data).returns(true)
      end

      def soft_limit_values(value = nil,
                            soft_geocoding_limit: nil,
                            soft_here_isolines_limit: nil,
                            soft_obs_snapshot_limit: nil,
                            soft_obs_general_limit: nil,
                            soft_twitter_datasource_limit: nil)
        values = Hash.new(value)
        values[:soft_geocoding_limit] = soft_geocoding_limit unless soft_geocoding_limit.nil?
        values[:soft_here_isolines_limit] = soft_here_isolines_limit unless soft_here_isolines_limit.nil?
        values[:soft_obs_snapshot_limit] = soft_obs_snapshot_limit unless soft_obs_snapshot_limit.nil?
        values[:soft_obs_general_limit] = soft_obs_general_limit unless soft_obs_general_limit.nil?
        values[:soft_twitter_datasource_limit] = soft_twitter_datasource_limit unless soft_twitter_datasource_limit.nil?
        values
      end

      def update_soft_limits(user, value,
                             soft_geocoding_limit: nil,
                             soft_here_isolines_limit: nil,
                             soft_obs_snapshot_limit: nil,
                             soft_obs_general_limit: nil,
                             soft_twitter_datasource_limit: nil)

        values = soft_limit_values(value,
                                   soft_geocoding_limit: soft_geocoding_limit,
                                   soft_here_isolines_limit: soft_here_isolines_limit,
                                   soft_obs_snapshot_limit: soft_obs_snapshot_limit,
                                   soft_obs_general_limit: soft_obs_general_limit,
                                   soft_twitter_datasource_limit: soft_twitter_datasource_limit)

        old_limits = {
          soft_geocoding_limit: user.soft_geocoding_limit,
          soft_here_isolines_limit: user.soft_here_isolines_limit,
          soft_obs_snapshot_limit: user.soft_obs_snapshot_limit,
          soft_obs_general_limit: user.soft_obs_general_limit,
          soft_twitter_datasource_limit: user.soft_twitter_datasource_limit
        }

        user.soft_geocoding_limit = values[:soft_geocoding_limit]
        user.soft_here_isolines_limit = values[:soft_here_isolines_limit]
        user.soft_obs_snapshot_limit = values[:soft_obs_snapshot_limit]
        user.soft_obs_general_limit = values[:soft_obs_general_limit]
        user.soft_twitter_datasource_limit = values[:soft_twitter_datasource_limit]
        user.save
        user.reload

        old_limits
      end

      def check_soft_limits(user, value)
        values = soft_limit_values(value)

        user.soft_geocoding_limit.should eq values[:soft_geocoding_limit]
        user.soft_here_isolines_limit.should eq values[:soft_here_isolines_limit]
        user.soft_obs_snapshot_limit.should eq values[:soft_obs_snapshot_limit]
        user.soft_obs_general_limit.should eq values[:soft_obs_general_limit]
        user.soft_twitter_datasource_limit.should eq values[:soft_twitter_datasource_limit]
      end

      def soft_limits_params(value)
        values = soft_limit_values(value)
        {
          soft_geocoding_limit: values[:soft_geocoding_limit],
          soft_here_isolines_limit: values[:soft_here_isolines_limit],
          soft_obs_snapshot_limit: values[:soft_obs_snapshot_limit],
          soft_obs_general_limit: values[:soft_obs_general_limit],
          soft_twitter_datasource_limit: values[:soft_twitter_datasource_limit]
        }
      end

      describe '#create' do
        after(:each) do
          @user.destroy if @user
        end

        it 'owner cannot enable soft limits if he has not' 


        it 'owner cannot enable geocoding limit if he has not' 


        # This test is needed now that soft limits toggles become disabled if owner can't assign
        it 'by default soft limits are disabled' 


        it 'owner can enable soft limits if he has' 

      end

      describe 'update' do
        after(:each) do
          ::User[@existing_user.id].destroy if @existing_user
        end

        it 'owner cannot enable soft limits if he has not' 


        it 'owner can enable soft limits if he has' 


        it 'owner can disable soft limits if he has' 

      end

    end
  end
end

