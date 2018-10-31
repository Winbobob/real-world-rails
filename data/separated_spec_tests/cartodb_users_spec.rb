# encoding: utf-8

require 'ostruct'
require_relative '../../acceptance_helper'
require_relative '../../factories/organizations_contexts'
require 'carto/user_authenticator'
require 'helpers/account_types_helper'

feature "Superadmin's users API" do
  include Carto::UserAuthenticator
  include AccountTypesHelper

  background do
    Capybara.current_driver = :rack_test
    @new_user = new_user(password: "this_is_a_password")
    @user_atts = @new_user.values
  end

  before(:all) do
    @account_type = create_account_type_fg('FREE')
    @account_type_juliet = create_account_type_fg('Juliet')
  end

  after(:all) do
    @account_type.destroy if @account_type
    @account_type_juliet.destroy if @account_type_juliet
  end

  scenario "Http auth is needed" do
    post_json superadmin_users_path, format: "json" do |response|
      response.status.should == 401
    end
  end

  scenario "user create fail" do
    @user_atts[:email] = nil

    post_json superadmin_users_path, { user: @user_atts }, superadmin_headers do |response|
      response.status.should == 422
      response.body[:errors][:email].should be_present
      response.body[:errors][:email].should include("is not present")
    end
  end

  scenario "user create with password success" do
    @user_atts.delete(:crypted_password)
    @user_atts.delete(:salt)
    @user_atts.merge!(password: "this_is_a_password")

    CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
    post_json superadmin_users_path, { user: @user_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:email].should == @user_atts[:email]
      response.body[:username].should == @user_atts[:username]
      response.body.should_not have_key(:crypted_password)
      response.body.should_not have_key(:salt)

      # Double check that the user has been created properly
      user = ::User.filter(email: @user_atts[:email]).first
      user.should be_present
      user.id.should == response.body[:id]
      authenticate(user.username, "this_is_a_password").should == user
    end
    ::User.where(username: @user_atts[:username]).first.destroy
  end

  scenario "user create with crypted_password and salt success" do
    CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
    post_json superadmin_users_path, { user: @user_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:email].should == @user_atts[:email]
      response.body[:username].should == @user_atts[:username]
      response.body.should_not have_key(:crypted_password)
      response.body.should_not have_key(:salt)

      # Double check that the user has been created properly
      user = ::User.filter(email: @user_atts[:email]).first
      user.should be_present
      user.id.should == response.body[:id]
      authenticate(user.username, "this_is_a_password").should == user
    end
    ::User.where(username: @user_atts[:username]).first.destroy
  end

  scenario "user create default account settings" do
    @user_atts[:private_tables_enabled] = false
    @user_atts[:sync_tables_enabled] = false
    @user_atts[:map_view_quota] = 80
    t = Time.now
    @user_atts[:upgraded_at] = t

    CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
    post_json superadmin_users_path, { user: @user_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:quota_in_bytes].should == 104857600
      response.body[:table_quota].should == 5
      response.body[:account_type].should == 'FREE'
      response.body[:private_tables_enabled].should == false
      response.body[:sync_tables_enabled].should == false
      response.body[:map_view_quota].should == 80

      # Double check that the user has been created properly
      user = ::User.filter(email: @user_atts[:email]).first
      user.quota_in_bytes.should == 104857600
      user.table_quota.should == 5
      user.account_type.should == 'FREE'
      user.private_tables_enabled.should == false
      user.upgraded_at.should.to_s == t.to_s
    end
    ::User.where(username: @user_atts[:username]).first.destroy
  end

  scenario "user create with rate limits" do
    t = Time.now
    @user_atts[:upgraded_at] = t
    rate_limits = FactoryGirl.create(:rate_limits)
    @user_atts[:rate_limit] = rate_limits.api_attributes

    CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
    post_json superadmin_users_path, { user: @user_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:rate_limit_id].should_not be_nil

      # Double check that the user has been created properly
      user = ::User.filter(email: @user_atts[:email]).first
      user.rate_limit.api_attributes.should eq @user_atts[:rate_limit]
    end
    ::User.where(username: @user_atts[:username]).first.destroy
    rate_limits.destroy
  end

  scenario "user create non-default account settings" do
    @user_atts[:quota_in_bytes] = 2000
    @user_atts[:table_quota]    = 20
    @user_atts[:account_type]   = 'Juliet'
    @user_atts[:private_tables_enabled] = true
    @user_atts[:sync_tables_enabled] = true
    @user_atts[:map_view_block_price] = 15
    @user_atts[:geocoding_quota] = 15
    @user_atts[:geocoding_block_price] = 2
    @user_atts[:here_isolines_quota] = 100
    @user_atts[:here_isolines_block_price] = 5
    @user_atts[:obs_snapshot_quota] = 100
    @user_atts[:obs_snapshot_block_price] = 5
    @user_atts[:obs_general_quota] = 100
    @user_atts[:obs_general_block_price] = 5
    @user_atts[:notification] = 'Test'

    CartoDB::UserModule::DBService.any_instance.stubs(:enable_remote_db_user).returns(true)
    post_json superadmin_users_path, { user: @user_atts }, superadmin_headers do |response|
      response.status.should == 201
      response.body[:quota_in_bytes].should == 2000
      response.body[:table_quota].should == 20
      response.body[:account_type].should == 'Juliet'
      response.body[:private_tables_enabled].should == true
      response.body[:sync_tables_enabled].should == true
      response.body[:sync_tables_enabled].should == true
      response.body[:map_view_block_price].should == 15
      response.body[:geocoding_quota].should == 15
      response.body[:geocoding_block_price].should == 2
      response.body[:here_isolines_quota].should == 100
      response.body[:here_isolines_block_price].should == 5
      response.body[:obs_snapshot_quota].should == 100
      response.body[:obs_snapshot_block_price].should == 5
      response.body[:obs_general_quota].should == 100
      response.body[:obs_general_block_price].should == 5
      response.body[:notification].should == 'Test'

      # Double check that the user has been created properly
      user = ::User.filter(email: @user_atts[:email]).first
      user.quota_in_bytes.should == 2000
      user.table_quota.should == 20
      user.account_type.should == 'Juliet'
      user.private_tables_enabled.should == true
      user.sync_tables_enabled.should == true
      user.map_view_block_price.should == 15
      user.geocoding_quota.should == 15
      user.geocoding_block_price.should == 2
      user.here_isolines_quota.should == 100
      user.here_isolines_block_price.should == 5
      user.obs_snapshot_quota.should == 100
      user.obs_snapshot_block_price.should == 5
      user.obs_general_quota.should == 100
      user.obs_general_block_price.should == 5
      user.notification.should == 'Test'
    end
    ::User.where(username: @user_atts[:username]).first.destroy
  end

  scenario "update user account details" do
    user = create_user
    t = Time.now
    @update_atts = { quota_in_bytes: 2000,
                     table_quota: 20,
                     max_layers: 10,
                     user_timeout: 100000,
                     database_timeout: 200000,
                     account_type: 'Juliet',
                     private_tables_enabled: true,
                     sync_tables_enabled: true,
                     upgraded_at: t,
                     map_view_block_price: 200,
                     geocoding_quota: 230,
                     geocoding_block_price: 5,
                     here_isolines_quota: 250,
                     here_isolines_block_price: 10,
                     obs_snapshot_quota: 250,
                     obs_snapshot_block_price: 10,
                     obs_general_quota: 250,
                     obs_general_block_price: 10,
                     notification: 'Test',
                     available_for_hire: true,
                     disqus_shortname: 'abc',
                     builder_enabled: true }

    # test to true
    put_json superadmin_user_path(user), { user: @update_atts }, superadmin_headers do |response|
      response.status.should == 204
    end
    user = ::User[user.id]
    user.quota_in_bytes.should == 2000
    user.table_quota.should == 20
    user.account_type.should == 'Juliet'
    user.private_tables_enabled.should == true
    user.sync_tables_enabled.should == true
    user.max_layers.should == 10
    user.database_timeout.should == 200000
    user.user_timeout.should == 100000
    user.upgraded_at.to_s.should == t.to_s
    user.map_view_block_price.should == 200
    user.geocoding_quota.should == 230
    user.geocoding_block_price.should == 5
    user.here_isolines_quota.should == 250
    user.here_isolines_block_price.should == 10
    user.obs_snapshot_quota.should == 250
    user.obs_snapshot_block_price.should == 10
    user.obs_general_quota.should == 250
    user.obs_general_block_price.should == 10
    user.notification.should == 'Test'
    user.disqus_shortname.should == 'abc'
    user.available_for_hire.should == true
    user.builder_enabled.should == true

    # then test back to false
    put_json superadmin_user_path(user), { user: {
      private_tables_enabled: false,
      builder_enabled: false }
    }, superadmin_headers do |response|
      response.status.should == 204
    end
    user = ::User[user.id]
    user.private_tables_enabled.should == false
    user.map_view_block_price.should == 200
    user.geocoding_quota.should == 230
    user.geocoding_block_price.should == 5
    user.here_isolines_quota.should == 250
    user.here_isolines_block_price.should == 10
    user.obs_snapshot_quota.should == 250
    user.obs_snapshot_block_price.should == 10
    user.obs_general_quota.should == 250
    user.obs_general_block_price.should == 10
    user.notification.should == 'Test'
    user.builder_enabled.should == false

    user.destroy
  end

  scenario "user update fail" do
    user = create_user

    put_json superadmin_user_path(user), { user: { email: "" } }, superadmin_headers do |response|
      response.status.should == 422
    end

    user.destroy
  end

  scenario "user update success" do
    user = create_user
    put_json superadmin_user_path(user),
             { user: { email: "newmail@test.com", map_view_quota: 80 } },
             superadmin_headers do |response|
      response.status.should == 204
    end
    user = ::User[user.id]
    user.email.should == "newmail@test.com"
    user.map_view_quota.should == 80

    user.destroy
  end

  scenario "update success with new organization" do
    pending "Organizations handling has been refactored and needs new specs"
    user = create_user
    @update_atts = {
      quota_in_bytes: 2000,
      organization_attributes: { name: 'wadus', seats: 25, quota_in_bytes: 40000 }
    }

    put_json superadmin_user_path(user), { user: @update_atts }, superadmin_headers do |response|
      response.status.should eq 204
    end
    user = ::User[user.id]
    user.quota_in_bytes.should eq 2000
    user.organization.name.should eq 'wadus'
    user.organization.seats.should eq 25
    user.organization.quota_in_bytes.should eq 40000

    @update_atts = {
      quota_in_bytes: 2001,
      organization_attributes: { name: 'wadus', seats: 26 }
    }
    put_json superadmin_user_path(user), { user: @update_atts }, superadmin_headers do |response|
      response.status.should eq 204
    end
    user = ::User[user.id]
    user.quota_in_bytes.should eq 2001
    user.organization.name.should eq 'wadus'
    user.organization.seats.should eq 26
    user.organization.quota_in_bytes.should eq 40000

    user.destroy
  end

  scenario "user delete success" do
    user = create_user
    delete_json superadmin_user_path(user), {}, superadmin_headers do |response|
      response.status.should == 204
    end
    ::User[user.id].should be_nil
  end

  scenario "user dump success" do
    user = create_user
    dump_url = %r{#{user.database_host}:[0-9]+/scripts/db_dump}
    json_data = { database: user.database_name, username: user.username }
    response_body = {
      retcode: 0,
      return_values: {
        local_file: '/tmp/foo.sql.gz',
        remote_file: 's3://foo-bucket/backups/foo.sql.gz'
      }
    }
    Typhoeus.stub(dump_url,
                  method: :post
                 )
      .and_return(
        Typhoeus::Response.new(code: 200, body: response_body.to_json)
      )

    get_json "/superadmin/users/#{user.id}/dump", {}, superadmin_headers do |response|
      response.status.should == 200
      response.body['retcode'] == 0
    end
    user.destroy
  end

  scenario "user dump fail" do
    user = create_user
    dump_url = %r{#{user.database_host}:[0-9]+/scripts/db_dump}
    json_data = { database: user.database_name, username: user.username }
    Typhoeus.stub(dump_url,
                  method: :post
                 )
      .and_return(
        Typhoeus::Response.new(code: 200, body: '{"retcode": 111}')
      )

    get_json "/superadmin/users/#{user.id}/dump", {}, superadmin_headers do |response|
      response.status.should == 400
      response.body['retcode'] != 0
    end
    user.destroy
  end

  scenario "user dump fail retcode" do
    user = create_user
    dump_url = %r{#{user.database_host}:[0-9]+/scripts/db_dump}
    json_data = { database: user.database_name, username: user.username }
    Typhoeus.stub(dump_url,
                  method: :post
                 )
      .and_return(
        Typhoeus::Response.new(code: 500, body: '{"retcode": 0}')
      )

    get_json "/superadmin/users/#{user.id}/dump", {}, superadmin_headers do |response|
      response.status.should == 400
    end
    user.destroy
  end

  scenario "user get info success" do
    user = create_user
    get_json superadmin_user_path(user), {}, superadmin_headers do |response|
      response.status.should == 200
      response.body[:id].should == user.id
    end

    get_json superadmin_user_path(user.id), {}, superadmin_headers do |response|
      response.status.should == 200
      response.body[:id].should == user.id
    end

    get_json superadmin_user_path(user.username), {}, superadmin_headers do |response|
      response.status.should == 200
      response.body[:id].should == user.id
    end

    user.destroy
  end

  scenario "user get info fail" do
    get_json superadmin_user_path('7b77546f-79cb-4662-9439-9ebafd9627cb'), {}, superadmin_headers do |response|
      response.status.should == 404
    end

    get_json superadmin_user_path('nonexistinguser'), {}, superadmin_headers do |response|
      response.status.should == 404
    end
  end

  describe "GET /superadmin/users" do
    before do
      @user  = create_user
      @user2 = create_user
    end

    after do
      @user.destroy
      @user2.destroy
    end

    it "gets all users" 


    it "gets overquota users" 


    it "gets cached db_size_in_bytes_change_users and returns username and db_size_in_bytes_change" 


    it "doesn't get organization users" 

  end

  describe '#update' do
    it 'should remove user feature_flag relation' 


    it 'should create user feature_flag relation' 


    it 'should create new rate limit if user does not have' 


    it 'should update existing user rate limit' 

  end

  describe '#destroy' do
    it 'should destroy user' 


    it 'should destroy user feature flag relations' 


    it 'should destroy rate_limit' 

  end

  describe 'with organization' do
    include_context 'organization with users helper'

    def update_and_verify(update_attrs)
      put_json superadmin_user_path(@org_user_1), { user: update_attrs }, superadmin_headers do |response|
        response.status.should eq 204
      end
      @org_user_1.reload
      update_attrs.keys.each do |att|
        @org_user_1.send(att).should eq update_attrs[att]
      end
    end

    it 'should update users' 

  end

  describe '#data_imports' do
    before(:each) do
      @user = create_user
    end

    after(:each) do
      @user.destroy
    end

    it 'filters results if param status is present' 


    it 'paginates results' 


    it 'returns all the data imports if no pagination params are present' 


    it 'validates order param' 

  end
end

