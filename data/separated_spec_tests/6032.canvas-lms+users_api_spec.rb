#
# Copyright (C) 2011 - 2013 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../file_uploads_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../cassandra_spec_helper')

class TestUserApi
  include Api::V1::User
  attr_accessor :services_enabled, :context, :current_user, :params, :request
  def service_enabled?(service); @services_enabled.include? service; end

  def avatar_image_url(*args); "avatar_image_url(#{args.first})"; end

  def course_student_grades_url(course_id, user_id); ""; end

  def course_user_url(course_id, user_id); ""; end

  def initialize
    @domain_root_account = Account.default
    @params = {}
    @request = OpenStruct.new
  end
end

describe Api::V1::User do
  before :once do
    @admin = account_admin_user
    course_with_student(:user => user_with_pseudonym(:name => 'Student', :username => 'pvuser@example.com'))
    @student = @user
    @student.pseudonym.update_attribute(:sis_user_id, 'sis-user-id')
    @user = @admin
    Account.default.tap { |a| a.enable_service(:avatars) }.save
    user_with_pseudonym(:user => @user)
  end

  before :each do
    @test_api = TestUserApi.new
    @test_api.services_enabled = []
    @test_api.request.protocol = 'http'
  end

  context 'user_json' do
    it 'should support optionally providing the avatar if avatars are enabled' 


    it 'only loads pseudonyms for the user once, even if there are multiple enrollments' 


    it 'should support optionally including group_ids' 


    it 'should use the correct SIS pseudonym' 


    it 'should show SIS data to sub account admins' 


    it 'should show SIS data to teachers only in courses they are teachers in' 


    it 'should show SIS data to teachers in groups in their courses' 


    it 'should use the SIS pseudonym instead of another pseudonym' 


    it 'should use an sis pseudonym from another account if necessary' 


    it 'should use the correct pseudonym' 


    it "requires :view_user_logins to return login_id" 


    context "include[]=email" do
      before :once do
        @user = User.create!(:name => 'User')
        @user.pseudonyms.create!(:unique_id => 'abc', :account => Account.default)
        @user.communication_channels.create(:path => 'abc@example.com').confirm!
      end

      it "includes email if requested" 


      it "does not include email without :read_email_addresses permission" 

    end

    context "computed scores" do
      before :once do
        @enrollment.scores.create!
        assignment_group = @course.assignment_groups.create!
        @enrollment.find_score(course_score: true).
          update!(current_score: 95.0, final_score: 85.0, unposted_current_score: 90.0, unposted_final_score: 87.0)
        @enrollment.find_score(assignment_group_id: assignment_group).
          update!(current_score: 50.0, final_score: 40.0, unposted_current_score: 55.0, unposted_final_score: 45.0)
        @student1 = @student
        @student1_enrollment = @enrollment
        @student2 = course_with_student(:course => @course).user
      end

      before :each do
        @course.grading_standard_enabled = true
        @course.save!
      end

      it "should return posted course scores as admin" 


      it "should not return unposted course scores as a student" 


      it "should not return course scores as another student" 

    end

    def test_context(mock_context, context_to_pass)
      expect(mock_context).to receive(:account).and_return(mock_context)
      expect(mock_context).to receive(:global_id).and_return(42).twice
      expect(mock_context).to receive(:grants_any_right?).with(@admin, :manage_students, :read_sis).and_return(true)
      expect(mock_context).to receive(:grants_right?).with(@admin, {}, :view_user_logins).and_return(true)
      json = if context_to_pass
        @test_api.user_json(@student, @admin, {}, [], context_to_pass)
      else
        @test_api.user_json(@student, @admin, {}, [])
      end
      expect(json).to eq({
        "name"=>"Student",
        "sortable_name"=>"Student",
        "id"=>@student.id,
        'created_at' => @student.created_at.iso8601,
        "short_name"=>"Student",
        "sis_user_id"=>"sis-user-id",
        "integration_id" => nil,
        "sis_import_id"=>@student.pseudonym.sis_batch_id,
        "login_id" => "pvuser@example.com"
      })
    end

    it 'should support manually passing the context' 


    it 'should support loading the context as a member var' 

  end

  context 'user_json_is_admin?' do

    it 'should support manually passing the current user' 


    it 'should support loading the current user as a member var' 


    it 'should support loading multiple different things (via args)' 


    it 'should support loading multiple different things (via member vars)' 


  end

end

describe "Users API", type: :request do
  def avatar_url(id)
    "http://www.example.com/images/users/#{User.avatar_key(id)}?fallback=http%3A%2F%2Fwww.example.com%2Fimages%2Fmessages%2Favatar-50.png"
  end

  before :once do
    @admin = account_admin_user
    course_with_student(:user => user_with_pseudonym(:name => 'Student', :username => 'pvuser@example.com', :active_user => true))
    @student.pseudonym.update_attribute(:sis_user_id, 'sis-user-id')
    @user = @admin
    Account.default.tap { |a| a.enable_service(:avatars) }.save
    user_with_pseudonym(:user => @user)
  end

  it "shouldn't return disallowed avatars" 


  shared_examples_for "page view api" do
    describe "page view api" do
      before do
        @timestamp = Time.zone.at(1.day.ago.to_i)
        page_view_model(:user => @student, :created_at => @timestamp - 1.day)
        page_view_model(:user => @student, :created_at => @timestamp + 1.day)
        page_view_model(:user => @student, :created_at => @timestamp, developer_key: DeveloperKey.default)
      end

      it "should return page view history" 


      it "should recognize start_time parameter" 


      it "should recognize end_time parameter" 

    end
  end

  include_examples "page view api"

  describe "cassandra page views" do
    before do
      # can't use :once'd @student, since cassandra doesn't reset
      student_in_course(:course => @course, :user => user_with_pseudonym(:name => 'Student', :username => 'pvuser2@example.com', :active_user => true))
      @user = @admin
    end
    include_examples "cassandra page views"
    include_examples "page view api"
  end

  it "shouldn't find users in other root accounts by sis id" 


  it "should allow id of 'self'" 


  describe "api_show" do
    before :each do
      @other_user = User.create!(:name => "user name")
      email = "email@somewhere.org"
      @other_user.pseudonyms.create!(:unique_id => email, :account => Account.default) { |p| p.sis_user_id = email }
      Account.default.tap { |a| a.disable_service(:avatars) }.save
    end

    it "should retrieve user details as an admin user" 


    it "should retrieve limited user details as self" 


    it "should retrieve the right permissions" 


    it "should retrieve the right avatar permissions" 


    it "requires :read_roster or :manage_user_logins permission from the account" 

  end

  describe "user account listing" do
    it "should return users for an account" 


    it "should limit the maximum number of users returned" 


    it "should return unauthorized for users without permissions" 


    it "returns an error when search_term is fewer than 3 characters" 


    it "returns a list of users filtered by search_term" 


    it "doesn't kersplode when filtering by role and sorting" 


    it "includes last login info" 


    it "does return a next header on the last page" 

  end

  describe "user account creation" do
    def create_user_skip_cc_confirm(admin_user)
      json = api_call(:post, "/api/v1/accounts/#{admin_user.account.id}/users",
                      { :controller => 'users', :action => 'create', :format => 'json', :account_id => admin_user.account.id.to_s },
                      {
                          :user => {
                              :name          => "Test User",
                              :short_name    => "Test",
                              :sortable_name => "User, T.",
                              :time_zone     => "Mountain Time (US & Canada)",
                              :locale        => 'en'
                          },
                          :pseudonym => {
                              :unique_id         => "test@example.com",
                              :password          => "password123",
                              :sis_user_id       => "12345",
                              :send_confirmation => 0
                          },
                          :communication_channel => {
                              :type => "sms",
                              :address => '8018888888',
                              :skip_confirmation => 1
                          }
                      }
      )
      users = User.where(name: "Test User").to_a
      expect(users.length).to eql 1
      user = users.first
      expect(user.sms_channel.workflow_state).to eq 'active'
    end

    context 'as a site admin' do
      before :once do
        @site_admin = user_with_pseudonym
        Account.site_admin.account_users.create!(user: @site_admin)
      end

      context 'using force_validations param' do
        it "validates with force_validations set to true" 


        it "does not validate when force_validations is not set to true" 

      end

      it "should allow site admins to create users" 


      it "accepts a valid destination param" 


      it "ignores a destination with a mismatched host" 


      it "ignores a destination with an unrecognized path" 


      context "sis reactivation" do
        it "should allow reactivating deleting users using sis_user_id" 


        it "should raise an error trying to reactivate an active section" 


        it "should carry on if there's no section to reactivate" 

      end

      it "should catch invalid dates before passing to the database" 


      it "should allow site admins to create users and auto-validate communication channel" 


      context "sharding" do
        specs_require_sharding
        it "should allow creating users on cross-shard accounts" 

      end

      it "respects authentication_provider_id" 

    end

    context 'as an account admin' do
      it "should allow account admins to create users and auto-validate communication channel" 

    end

    context "as a non-administrator" do
      before :once do
        user_factory(active_all: true)
      end

      it "should not let you create a user if self_registration is off" 


      it "should require an email pseudonym" 


      it "should require acceptance of the terms" 


      it "should let you create a user if you pass all the validations" 

    end

    it "should send a confirmation if send_confirmation is set to 1" 


    it "should return a 400 error if the request doesn't include a unique id" 


    it "should set user's email address via communication_channel[address]" 


    context "as an anonymous user" do
      before :each do
        user_factory(active_all: true)
        @user = nil
      end

      it "should not let you create a user if self_registration is off" 


      it "should require an email pseudonym" 


      it "should require acceptance of the terms" 


      it "should let you create a user if you pass all the validations" 


      it "should return a 400 error if the request doesn't include a unique id" 


      it "should set user's email address via communication_channel[address]" 

    end
  end

  describe "user account updates" do
    before :once do
      # an outer before sets this
      @student.pseudonym.update_attribute(:sis_user_id, nil)

      @admin = account_admin_user
      course_with_student(:user => user_with_pseudonym(:name => 'Student', :username => 'student@example.com'))
      @student = @user
      @student.pseudonym.update_attribute(:sis_user_id, 'sis-user-id')
      @user = @admin
      @path = "/api/v1/users/#{@student.id}"
      @path_options = { :controller => 'users', :action => 'update', :format => 'json', :id => @student.id.to_param }
      user_with_pseudonym(:user => @user, :username => 'admin@example.com')
    end
    context "an admin user" do
      it "should be able to update a user" 


      it "should be able to update email alone" 


      it "should catch invalid dates" 


      it "should allow updating without any params" 


      it "should update the user's avatar with a token" 


      it "should re-lock the avatar after being updated by an admin" 


      it "should not allow the user's avatar to be set to an external url" 


      it "should be able to update a name without changing sortable name if sent together" 

    end

    context "non-account-admin user" do
      before :once do
        user_with_pseudonym name: "Earnest Lambert Watkins"
        course_with_teacher user: @user, active_all: true
      end

      context "with users_can_edit_name enabled" do
        before :once do
          @course.root_account.settings = { users_can_edit_name: true }
          @course.root_account.save!
        end

        it "should allow user to rename self" 

      end

      context "with users_can_edit_name disabled" do
        before :once do
          @course.root_account.settings = { users_can_edit_name: false }
          @course.root_account.save!
        end

        it "should not allow user to rename self" 

      end
    end

    context "an unauthorized user" do
      it "should receive a 401" 

    end
  end

  describe "user settings" do
    before :once do
      course_with_student(active_all: true)
      account_admin_user
    end

    let(:path) { "/api/v1/users/#{@student.to_param}/settings" }
    let(:path_options) {
      { controller: 'users', action: 'settings', format: 'json',
        id: @student.to_param }
    }

    context "an admin user" do
      it "should be able to view other users' settings" 


      it "should be able to update other users' settings" 

    end

    context "a student" do
      before do
        @user = @student
      end

      it "should be able to view its own settings" 


      it "should be able to update its own settings" 


      it "should receive 401 if updating another user's settings" 

    end
  end

  describe "user custom_data" do
    let(:namespace_a) { 'com.awesome-developer.mobile' }
    let(:namespace_b) { 'org.charitable-developer.generosity' }
    let(:scope) { 'nice/scope' }
    let(:scope2) { 'something-different' }
    let(:path) { "/api/v1/users/#{@student.to_param}/custom_data/#{scope}" }
    let(:path2) { "/api/v1/users/#{@student.to_param}/custom_data/#{scope2}" }
    let(:path_opts_put) { {controller: 'custom_data',
                              action: 'set_data',
                              format: 'json',
                              user_id: @student.to_param,
                              scope: scope} }
    let(:path_opts_get) { path_opts_put.merge({action: 'get_data'}) }
    let(:path_opts_del) { path_opts_put.merge({action: 'delete_data'}) }
    let(:path_opts_put2) { path_opts_put.merge({scope: scope2}) }
    let(:path_opts_get2) { path_opts_put2.merge({action: 'get_data'}) }

    it "scopes storage by namespace and a *scope glob" 


    it "turns JSON hashes into scopes" 


    it "is deleteable" 


    context "without a namespace" do
      it "responds 400 to GET" 


      it "responds 400 to PUT" 


      it "responds 400 to DELETE" 

    end

    context "PUT" do
      it "responds 409 when the requested scope is invalid" 

    end
  end

  describe "removing user from account" do
    before :once do
      @admin = account_admin_user
      course_with_student(:user => user_with_pseudonym(:name => 'Student', :username => 'student@example.com'))
      @student = @user
      @user = @admin
      @path = "/api/v1/accounts/#{Account.default.id}/users/#{@student.id}"
      @path_options = { :controller => 'accounts', :action => 'remove_user',
        :format => 'json', :user_id => @student.to_param,
        :account_id => Account.default.to_param }
    end

    context "a user with permissions" do
      it "should be able to delete a user" 


      it "should be able to delete a user by SIS ID" 


      it 'should be able to delete itself' 

    end

    context 'an unauthorized user' do
      it "should receive a 401" 

    end

    context 'a non-admin user' do
      it 'should not be able to delete itself' 

    end
  end

  context "user files" do
    before :each do
      @context = @user
    end

    include_examples "file uploads api with folders"
    include_examples "file uploads api with quotas"

    def preflight(preflight_params, opts = {})
      api_call(:post, "/api/v1/users/self/files",
        { :controller => "users", :action => "create_file", :format => "json", :user_id => 'self', },
        preflight_params,
        {},
        opts)
    end

    def has_query_exemption?
      false
    end

    def context
      @user
    end

    it "should not allow uploading to other users" 

  end

  describe "user merge and split" do
    before :once do
      @account = Account.default
      @user1 = user_with_managed_pseudonym(
        active_all: true, account: @account, name: 'Jony Ive',
        username: 'jony@apple.com', sis_user_id: 'user_sis_id_01'
      )
      @user2 = user_with_managed_pseudonym(
        active_all: true, name: 'Steve Jobs', account: @account,
        username: 'steve@apple.com', sis_user_id: 'user_sis_id_02'
      )
      @user = account_admin_user(account: @account)
    end

    it "should merge and split users" 


    it "should merge and split users cross accounts" 


    it "should fail to merge users cross accounts without permissions" 


    it "should fail to split users that have not been merged" 

  end

  describe 'Custom Colors' do
    before :each do
      @a = Account.default
      @u = user_factory(active_all: true)
      @a.account_users.create!(user: @u)
    end

    describe 'GET custom colors' do
      before :each do
        @user.preferences[:custom_colors] = {
          "user_#{@user.id}" => "efefef",
          "course_3" => "ababab"
        }
        @user.save!
      end

      it "should return an empty object if nothing is stored" 


      it "should return all custom colors for the user" 


      it "should return the color for a context when requested" 

    end

    describe 'PUT custom colors' do
      it "should not allow creating entries for entities that do not exist" 


      it "should not allow creating entries for entities the user doesn't have read access to" 


      it "should throw a bad request if a color isn't provided" 


      it "should throw a bad request if an invalid hexcode is provided" 


      it "should add an entry for entities the user has access to" 

    end
  end

  describe "dashboard positions" do
    before :each do
      @a = Account.default
      @u = user_factory(active_all: true)
      @a.account_users.create!(user: @u)
    end

    describe "GET dashboard positions" do
      before :each do
        @user.preferences[:dashboard_positions] = {
          "course_1" => 3,
          "course_2" => 1,
          "course_3" => 2
        }
        @user.save!
      end

      it "should return dashboard postions for a user" 


      it "should return an empty if the user has no ordering set" 

    end

    describe "PUT dashboard positions" do
      it "should allow setting dashboard positions" 


      it "should not allow creating entries for entities that do not exist" 


      it "should not allow creating entries for entities that the user doesn't have read access to" 


      it "should not allow setting positions to strings" 


    end
  end

  describe "New User Tutorial Collapsed Status" do
    before :once do
      @a = Account.default
      @u = user_factory(active_all: true)
      @a.account_users.create!(user: @u)
    end

    describe "GET new user tutorial statuses" do
      before :once do
        @user.preferences[:new_user_tutorial_statuses] = {
          "home" => true,
          "modules" => false,
        }
        @user.save!
      end

      it "should return new user tutorial collapsed statuses for a user" 


      it "should return empty if the user has no preference set" 

    end

    describe "PUT new user tutorial status" do
      it "should allow setting new user tutorial status" 


      it "should reject setting status for pages that are not whitelisted" 


    end
  end

  describe 'missing submissions' do
    before :once do
      course_with_student(active_all: true)
      @observer = user_factory(active_all: true, active_state: 'active')
      @observer.as_observer_observation_links.create do |uo|
        uo.user_id = @student.id
      end
      @user = @observer
      due_date = 2.days.ago
      2.times do
        @course.assignments.create!(due_at: due_date, workflow_state: 'published', submission_types: "online_text_entry")
      end
      @path = "/api/v1/users/#{@student.id}/missing_submissions"
      @params = {controller: "users", action: "missing_submissions", user_id: @student.id, format: "json"}
    end

    it "should return unsubmitted assignments due in the past" 


    it "should return assignments in order of the submission time for the user" 


    it "paginates properly when multiple submissions have the same cached_due_date" 


    it "should not return locked assignments if filter is set to 'submittable'" 


    it "should return course information if requested" 


    it "should not return submitted assignments due in the past" 


    it "should not return assignments that don't expect a submission" 


    it "should show assignments past their due dates because of overrides" 


    it "should not show assignments past their due dates if the user is not assigned" 


    it "should not show deleted assignments" 


    it "should not show unpublished assignments" 

  end

  describe 'POST pandata_events_token' do
    let(:fake_secrets){
      {
        "url" => "https://example.com/pandata/events",
        "ios-key" => "IOS_key",
        "ios-secret" => "LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1JSGJBZ0VCQkVFemZx\nZStiTjhEN2VRY0tKa3hHSlJpd0dqaHE0eXBsdFJ3aXNMUkx6ZXpBSmQ4QTlL\nRTdNY2YKbkorK0ptNGpwcjNUaFpybHRyN2dXQ2VJWWdvZDZPSmhzS0FIQmdV\ncmdRUUFJNkdCaVFPQmhnQUVBSmV5NCszeAp0UGlja2h1RFQ3QWFsTW1BWVdz\neU5IMnlEejRxRjhCamhHZzgwVkE2QWJPMHQ2YVE4TGQyaktMVEFrU1U5SFFW\nClkrMlVVeUp0Q3FTWEg4dVlBTEI0ZmFwbGhwVWNoQ1pSa3pMMXcrZzVDUUJY\nMlhFS25PdXJabU5ieEVSRzJneGoKb3hsbmxub0pwQjR5YUkvbWNpWkJOYlVz\nL0hTSGJtRzRFUFVxeVViQgotLS0tLUVORCBFQyBQUklWQVRFIEtFWS0tLS0t\nCg==\n",
        "android-key" => "ANDROID_key",
        "android-secret" => "surrendernoworpreparetofight"
      }
    }

    before do
      allow(Canvas::DynamicSettings).to receive(:find).
        with(any_args).and_call_original
      allow(Canvas::DynamicSettings).to receive(:find).
        with('events', service: 'pandata').and_return(fake_secrets)
    end

    it 'returns token and expiration' 


    it 'returns bad_request for incorrect app keys' 


    it 'returns forbidden if the tokens key is not authorized' 

  end
end

