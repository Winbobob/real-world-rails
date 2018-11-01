# coding: utf-8
#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe ApplicationHelper do
  include ERB::Util

  alias_method :content_tag_without_nil_return, :content_tag

  context "folders_as_options" do
    before(:once) do
      course_model
      @f = Folder.create!(:name => 'f', :context => @course)
      @f_1 = Folder.create!(:name => 'f_1', :parent_folder => @f, :context => @course)
      @f_2 = Folder.create!(:name => 'f_2', :parent_folder => @f, :context => @course)
      @f_2_1 = Folder.create!(:name => 'f_2_1', :parent_folder => @f_2, :context => @course)
      @f_2_1_1 = Folder.create!(:name => 'f_2_1_1', :parent_folder => @f_2_1, :context => @course)
      @all_folders = [ @f, @f_1, @f_2, @f_2_1, @f_2_1_1 ]
    end

    it "should work work recursively" 


    it "should limit depth" 


    it "should work without supplying all folders" 

  end

  it "show_user_create_course_button should work" 


  describe "tomorrow_at_midnight" do
    it "should always return a time in the future" 

  end

  describe "Time Display Helpers" do
    before :each do
      @zone = Time.zone
      Time.zone = "Alaska"
    end

    after :each do
      Time.zone = @zone
    end

    around do |example|
      Timecop.freeze(Time.zone.local(2013,3,13,9,12), &example)
    end

    describe '#context_sensitive_datetime_title' do
      it "produces a string showing the local time and the course time" 


      it "only prints the text if just_text option passed" 


      it "uses the simple title if theres no timezone difference" 


      it 'uses the simple title for nil context' 


      it 'crosses date boundaries appropriately' 

    end

    describe '#friendly_datetime' do
      let(:context) { double(time_zone: ActiveSupport::TimeZone["America/Denver"]) }

      it 'spits out a friendly time tag' 


      it 'builds a whole time tag with a useful title showing the timezone offset if theres a context' 


      it 'can produce an alternate tag type' 


      it 'produces no tooltip for a nil datetime' 

    end
  end

  describe "accessible date formats" do
    it "generates a date format for use throughout the app" 


    it "wraps a prompt around the format for Screenreader users" 


    it "produces a date-only format" 


    it "produces a time-only format" 


    it "throws an argument error for a foolish format" 

  end

  describe "custom css/js includes" do

    def set_up_subaccounts
      @domain_root_account.settings[:global_includes] = true
      @domain_root_account.settings[:sub_account_includes] = true
      @domain_root_account.create_brand_config!({
        css_overrides: 'https://example.com/root/account.css',
        js_overrides: 'https://example.com/root/account.js'
      })
      @domain_root_account.save!

      @child_account = account_model(root_account: @domain_root_account, name: 'child account')
      bc = @child_account.build_brand_config({
        css_overrides: 'https://example.com/child/account.css',
        js_overrides: 'https://example.com/child/account.js'
      })
      bc.parent = @domain_root_account.brand_config
      bc.save!
      @child_account.save!

      @grandchild_account = @child_account.sub_accounts.create!(name: 'grandchild account')
      bc = @grandchild_account.build_brand_config({
        css_overrides: 'https://example.com/grandchild/account.css',
        js_overrides: 'https://example.com/grandchild/account.js'
      })
      bc.parent = @child_account.brand_config
      bc.save!
      @grandchild_account.save!
    end

    describe "include_account_css" do

      before :once do
        @site_admin = Account.site_admin
        @domain_root_account = Account.default
        @domain_root_account.settings = @domain_root_account.settings.merge(global_includes: true)
        @domain_root_account.save!
      end

      context "with no custom css" do
        it "should be empty" 

      end

      context "with custom css" do
        it "should include account css" 


        it "should include site_admin css even if there is no active brand" 



        it "should not include anything if param is set to 0" 

      end

      context "sub-accounts" do
        before { set_up_subaccounts }

        it "should include sub-account css when viewing the subaccount or any course or group in it" 


        it "should not include sub-account css when root account is context" 


        it "should use include sub-account css, if sub-account is lowest common account context" 


        it "should work using common_account_chain starting from lowest common account context with enrollments" 


        it "should fall-back to @domain_root_account's branding if I'm logged in but not enrolled in anything" 


        it "should load custom css even for high contrast users" 


      end
    end

    describe "include_account_js" do
      before :once do
        @site_admin = Account.site_admin
        @domain_root_account = Account.default
        @domain_root_account.settings = @domain_root_account.settings.merge(global_includes: true)
        @domain_root_account.save!
      end

      context "with no custom js" do
        it "should be empty" 

      end

      context "with custom js" do
        it "should include account javascript" 


        it "should include site_admin javascript even if there is no active brand" 


        context "sub-accounts" do
          before { set_up_subaccounts }

          it "should just include domain root account's when there is no context or @current_user" 


          it "should load custom js even for high contrast users" 


          it "should include granchild, child, and root when viewing the grandchild or any course or group in it" 

        end
      end
    end
  end

  describe "help link" do
    before :once do
      Setting.set('show_feedback_link', 'true')
    end

    it "should configure the help link to display the dialog by default" 


    it "should override default help link with the configured support url" 


    it "should return the configured icon" 


    it "should return the configured help link name" 

  end

  describe "collection_cache_key" do
    it "should generate a cache key, changing when an element cache_key changes" 

  end

  context "dashboard_url" do
    before :once do
      @domain_root_account = Account.default
    end

    it "returns a regular canvas dashboard url" 


    context "with a custom dashboard_url on the account" do
      before :each do
        @domain_root_account.settings[:dashboard_url] = "http://foo.bar"
      end

      it "returns the custom dashboard_url" 


      context "with login_success=1" do
        it "returns a regular canvas dashboard url" 

      end

      context "with become_user_id=1" do
        it "returns a regular canvas dashboard url for masquerading" 

      end

      context "with a user logged in" do
        before :each do
          @current_user = user_factory
        end

        it "returns the custom dashboard_url with the current user's id" 

      end
    end
  end

  context "include_custom_meta_tags" do
    it "should be nil if @meta_tags is not defined" 


    it "should include tags if present" 


    it "should html_safe-ify them" 

  end

  describe "editor_buttons" do
    it "should return hash of tools if in group" 


    it "should return hash of tools if in course" 


    it "should not include tools from the domain_root_account for users" 

  end

  describe "UI path checking" do
    describe "#active_path?" do
      context "when the request path is the course show page" do
        let(:request){ double('request', :fullpath => '/courses/2')}

        it "returns true for paths that match" 


        it "returns false for paths that don't match" 


        it "returns false for paths that don't start the same" 

      end

      context "when the request path is the account external tools path" do
        let(:request){ double('request', :fullpath => '/accounts/2/external_tools/27')}

        before :each do
          @context = Account.default
          allow(controller).to receive(:controller_name).and_return('external_tools')
        end

        it "it doesn't return true for '/accounts'" 

      end

      context "when the request path is the course external tools path" do
        let(:request){ double('request', :fullpath => '/courses/2/external_tools/27')}

        before :each do
          @context = Account.default.courses.create!
          allow(controller).to receive(:controller_name).and_return('external_tools')
        end

        it "returns true for '/courses'" 

      end
    end
  end

  describe "js_base_url" do
    it "returns an immutable string" 

  end

  describe 'brand_config_for_account' do
    it "handles not having @domain_root_account set" 

  end

  describe "active_brand_config" do

    it "returns nil if user prefers high contrast" 


    it "returns 'K12 Theme' by default for a k12 school" 


    it "returns 'K12 Theme' if a k12 school has chosen 'canvas default' in Theme Editor" 


  end


  describe "include_head_js" do
    before do
      allow(helper).to receive(:js_bundles).and_return([[:some_bundle], [:some_plugin_bundle, :some_plugin], [:another_bundle, nil]])
    end

    it "creates the correct javascript tags" 

  end

  describe "include_js_bundles" do
    before do
      allow(helper).to receive(:js_bundles).and_return([[:some_bundle], [:some_plugin_bundle, :some_plugin], [:another_bundle, nil]])
    end
    it "creates the correct javascript tags" 

  end

  describe "map_groups_for_planner" do
    context "with planner enabled" do
      before(:each) do
        @account = Account.default
        @account.enable_feature! :student_planner
      end

      it "returns the list of groups the user belongs to" 

    end
  end

  describe "tutorials_enabled?" do
    before(:each) do
      @domain_root_account = Account.default
    end
    context "with new_users_tutorial feature flag enabled" do
      before(:each) do
        @domain_root_account.enable_feature! :new_user_tutorial
        @current_user = User.create!
      end

      it "returns true if the user has the flag enabled" 


      it "returns false if the user has the flag disabled" 

    end
  end

  describe "planner_enabled?" do
    before(:each) do
      @domain_root_account = Account.default
    end

    context "with student_planner feature flag enabled" do
      before(:each) do
        @domain_root_account.enable_feature! :student_planner
      end

      it "returns false when a user has no student enrollments" 


      it "returns true when there is at least one student enrollment" 


      it "returns true for past student enrollments" 


       it "returns true for invited student enrollments" 
      it "returns true for future student enrollments" 


      it "returns false with no user" 

    end

    context "with student_planner feature flag disabled" do
      it "returns false" 

    end
  end

  describe "file_access_user" do
    context "not on the files domain" do
      before :each do
        @files_domain = false
      end

      it "should return @current_user" 

    end

    context "on the files domain" do
      before :each do
        @files_domain = true
      end

      it "should return access user from session" 


      it "should return nil if not set" 

    end
  end

  describe "file_access_real_user" do
    context "not on the files domain" do
      before :each do
        @files_domain = false
      end

      let(:logged_in_user) { user_model }

      it "should return logged_in_user" 

    end

    context "on the files domain" do
      before :each do
        @files_domain = true
      end

      it "should return real access user from session" 


      it "should return access user from session if real access user not set" 


      it "should return real access user over access user if both set" 


      it "should return nil if neither set" 

    end
  end

  describe "file_access_developer_key" do
    context "not on the files domain" do
      before :each do
        @files_domain = false
      end

      it "should return token's developer_key with @access_token set" 


      it "should return nil without @access_token set" 

    end

    context "on the files domain" do
      before :each do
        @files_domain = true
      end

      it "should return developer key from session" 


      it "should return nil if developer key in session not set" 

    end
  end

  describe "file_access_root_account" do
    context "not on the files domain" do
      before :each do
        @domain_root_account = Account.default
        @files_domain = false
      end

      it "should return @domain_root_account" 

    end

    context "on the files domain" do
      before :each do
        @files_domain = true
      end

      it "should return root account from session" 


      it "should return nil if root account in session not set" 

    end
  end

  describe "file_access_oauth_host" do
    let(:host) { "test.host" }

    context "not on the files domain" do
      let(:request) { double("request", host_with_port: host) }
      let(:logged_in_user) { user_model }

      before :each do
        @files_domain = false
      end

      it "should return the request's host" 

    end

    context "on the files domain" do
      let(:logged_in_user) { user_model }

      before :each do
        @files_domain = true
      end

      it "should return the host from the session" 


      it "should return nil if no host in the session" 

    end
  end

  describe "file_authenticator" do
    before :each do
      @domain_root_account = Account.default
    end

    context "not on the files domain, logged in" do
      before :each do
        @files_domain = false
        @current_user = user_model
      end

      let(:logged_in_user) { user_model }
      let(:current_host) { 'non-files-domain' }
      let(:request) { double('request', host_with_port: current_host) }

      it "creates an authenticator for the logged in user" 


      it "creates an authenticator with the acting user" 


      it "creates an authenticator for the current host" 


      it "creates an authenticator aware of the access token if present" 


      it "creates an authenticator aware of the root account" 

    end

    context "not on the files domain, not logged in" do
      before :each do
        @files_domain = false
        @current_user = nil
      end

      let(:logged_in_user) { nil }
      let(:current_host) { 'non-files-domain' }
      let(:request) { double('request', host_with_port: current_host) }

      it "creates a public authenticator" 

    end

    context "on the files domain with access user" do
      let(:access_user) { user_model }
      let(:real_access_user) { user_model }
      let(:developer_key) { DeveloperKey.create! }
      let(:original_host) { 'non-files-domain' }

      before :each do
        @files_domain = true
        session['file_access_user_id'] = access_user.id
        session['file_access_real_user_id'] = real_access_user.id
        session['file_access_root_account_id'] = Account.default.id
        session['file_access_developer_key_id'] = developer_key.id
        session['file_access_oauth_host'] = original_host
      end

      let(:logged_in_user) { nil }
      let(:current_host) { 'files-domain' }
      let(:request) { double('request', host_with_port: current_host) }

      it "creates an authenticator for the real access user" 


      it "creates an authenticator with the acting access user" 


      it "creates an authenticator with a fake access token for the developer key from the session" 


      it "creates an authenticator with the root account from the session" 


      it "creates an authenticator with the original host from the session" 

    end

    context "on the files domain without access user" do
      before :each do
        @files_domain = true
        session['file_access_user_id'] = nil
        session['file_access_real_user_id'] = nil
      end

      let(:logged_in_user) { nil }
      let(:current_host) { 'files-domain' }
      let(:request) { double('request', host_with_port: current_host) }

      it "creates a public authenticator" 

    end
  end

  describe "#alt_text_for_login_logo" do
    before :each do
      @domain_root_account = Account.default
    end

    it "returns the default value when there is no custom login logo" 


    it "returns the account short name when the logo is custom" 

  end
end

