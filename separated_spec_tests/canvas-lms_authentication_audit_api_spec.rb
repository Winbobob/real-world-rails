#
# Copyright (C) 2013 - 2014 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../cassandra_spec_helper')

describe "AuthenticationAudit API", type: :request do
  context "not configured" do
    before do
      allow(Canvas::Cassandra::DatabaseBuilder).to receive(:configured?).with('auditors').and_return(false)
      site_admin_user(user: user_with_pseudonym(account: Account.site_admin))
    end

    it "should 404" 

  end

  context "configured" do
    include_examples "cassandra audit logs"

    before do
      Setting.set('enable_page_views', 'cassandra')
      @request_id = SecureRandom.uuid
      allow(RequestContextGenerator).to receive_messages( :request_id => @request_id )

      @viewing_user = site_admin_user(user: user_with_pseudonym(account: Account.site_admin))
      @account = Account.default
      @custom_role = custom_account_role('CustomAdmin', :account => @account)
      @custom_sa_role = custom_account_role('CustomAdmin', :account => Account.site_admin)
      user_with_pseudonym(active_all: true)

      @page_view = PageView.new
      @page_view.user = @viewing_user
      @page_view.request_id = @request_id
      @page_view.remote_ip = '10.10.10.10'
      @page_view.created_at = Time.now
      @page_view.updated_at = Time.now
      @page_view.save!

      @event = Auditors::Authentication.record(@pseudonym, 'login')
    end

    def fetch_for_context(context, options={})
      type = context.class.to_s.downcase unless type = options.delete(:type)
      id = context.id.to_s

      arguments = { controller: 'authentication_audit_api', action: "for_#{type}", :"#{type}_id" => id, format: 'json' }
      query_string = []

      if per_page = options.delete(:per_page)
        arguments[:per_page] = per_page.to_s
        query_string << "per_page=#{arguments[:per_page]}"
      end

      if start_time = options.delete(:start_time)
        arguments[:start_time] = start_time.iso8601
        query_string << "start_time=#{arguments[:start_time]}"
      end

      if end_time = options.delete(:end_time)
        arguments[:end_time] = end_time.iso8601
        query_string << "end_time=#{arguments[:end_time]}"
      end

      path = "/api/v1/audit/authentication/#{type.pluralize}/#{id}"
      path += "?" + query_string.join('&') if query_string.present?
      api_call_as_user(@viewing_user, :get, path, arguments, {}, {}, options.slice(:expected_status))
    end

    def expect_event_for_context(context, event, options={})
      json = options.delete(:json)
      json ||= fetch_for_context(context, options)
      expect(json['events'].map{ |e| [e['id'], e['event_type']] })
                    .to include([event.id, event.event_type])
      json
    end

    def forbid_event_for_context(context, event, options={})
      json = options.delete(:json)
      json ||= fetch_for_context(context, options)
      expect(json['events'].map{ |e| [e['id'], e['event_type']] })
                    .not_to include([event.id, event.event_type])
      json
    end

    describe "formatting" do
      before do
        @json = fetch_for_context(@user)
      end

      it "should have correct root keys" 


      it "should have a formatted links key" 


      it "should have a formatted linked key" 


      describe "events collection" do
        before do
          @json = @json['events']
        end

        it "should be formatted as an array of AuthenticationEvent objects" 

      end

      describe "logins collection" do
        before do
          @json = @json['linked']['logins']
        end

        it "should be formatted as an array of Pseudonym objects" 

      end

      describe "accounts collection" do
        before do
          @json = @json['linked']['accounts']
        end

        it "should be formatted as an array of Account objects" 

      end

      describe "users collection" do
        before do
          @json = @json['linked']['users']
        end

        it "should be formatted as an array of User objects" 

      end

      describe "page_views collection" do
        before do
          @json = @json['linked']['page_views']
        end

        it "should be formatted as an array of page_view objects" 

      end
    end

    context "nominal cases" do
      it "should include events at login endpoint" 


      it "should include events at account endpoint" 


      it "should include events at user endpoint" 

    end

    context "with a second account (same user)" do
      before do
        @account = account_model
        user_with_pseudonym(user: @user, account: @account, active_all: true)
      end

      it "should not include cross-account events at login endpoint" 


      it "should not include cross-account events at account endpoint" 


      it "should include cross-account events at user endpoint" 

    end

    context "with a second user (same account)" do
      before do
        user_with_pseudonym(active_all: true)
      end

      it "should not include cross-user events at login endpoint" 


      it "should include cross-user events at account endpoint" 


      it "should not include cross-user events at user endpoint" 

    end

    describe "start_time and end_time" do
      before do
        @event2 = @pseudonym.shard.activate do
          record = Auditors::Authentication::Record.new(
            'id' => SecureRandom.uuid,
            'created_at' => 1.day.ago,
            'pseudonym' => @pseudonym,
            'event_type' => 'logout')
          Auditors::Authentication::Stream.insert(record)
        end
      end

      it "should recognize :start_time for logins" 


      it "should recognize :newest for logins" 


      it "should recognize :start_time for accounts" 


      it "should recognize :newest for accounts" 


      it "should recognize :start_time for users" 


      it "should recognize :newest for users" 

    end

    context "deleted entities" do
      it "should 404 for inactive logins" 


      it "should 404 for inactive accounts" 


      it "should 404 for inactive users" 

    end

    describe "permissions" do
      before do
        @user, @viewing_user = @user, user_model
      end

      it "should not allow other account models" 


      context "no permission on account" do
        it "should not authorize the login endpoint" 


        it "should not authorize the account endpoint" 


        it "should not authorize the user endpoint" 

      end

      context "with :view_statistics permission on account" do
        before do
          @user, _ = @user, account_admin_user_with_role_changes(
            :account => @account, :user => @viewing_user,
            :role => @custom_role,
            :role_changes => {:view_statistics => true})
        end

        it "should authorize the login endpoint" 


        it "should authorize the account endpoint" 


        it "should authorize the user endpoint" 

      end

      context "with :manage_user_logins permission on account" do
        before do
          @user, _ = @user, account_admin_user_with_role_changes(
            :account => @account, :user => @viewing_user,
            :role => @custom_role,
            :role_changes => {:manage_user_logins => true})
        end

        it "should authorize the login endpoint" 


        it "should authorize the account endpoint" 


        it "should authorize the user endpoint" 

      end

      context "with :view_statistics permission on site admin account" do
        before do
          @user, _ = @user, account_admin_user_with_role_changes(
            :account => Account.site_admin, :user => @viewing_user,
            :role => @custom_sa_role,
            :role_changes => {:view_statistics => true})
        end

        it "should authorize the login endpoint" 


        it "should authorize the account endpoint" 


        it "should authorize the user endpoint" 

      end

      context "with :manage_user_logins permission on site admin account" do
        before do
          @user, _ = @user, account_admin_user_with_role_changes(
            :account => Account.site_admin, :user => @viewing_user,
            :role => @custom_sa_role,
            :role_changes => {:manage_user_logins => true})
        end

        it "should authorize the login endpoint" 


        it "should authorize the account endpoint" 


        it "should authorize the user endpoint" 

      end

      describe "per-account permissions when fetching by user" do
        before do
          @account = account_model
          user_with_pseudonym(user: @user, account: @account, active_all: true)
          custom_role = custom_account_role('CustomAdmin', :account => @account)
          @user, _ = @user, account_admin_user_with_role_changes(
            :account => @account, :user => @viewing_user,
            :role => custom_role,
            :role_changes => {:manage_user_logins => true})
        end

        context "without permission on the second account" do
          it "should not include cross-account events at user endpoint" 

        end

        context "with permission on the site admin account" do
          before do
            @user, _ = @user, account_admin_user_with_role_changes(
              :account => Account.site_admin, :user => @viewing_user,
              :role => @custom_sa_role,
              :role_changes => {:manage_user_logins => true})
          end

          it "should include cross-account events at user endpoint" 

        end

        context "when viewing self" do
          before do
            @viewing_user = @user
          end

          it "should include cross-account events at user endpoint" 

        end
      end
    end

    describe "per-account with sharding when fetching by user" do
      specs_require_sharding

      before do
        @shard2.activate do
          @account = account_model
          user_with_pseudonym(user: @user, account: @account, active_all: true)
          @event2 = Auditors::Authentication.record(@pseudonym, 'logout')
        end
      end

      it "should see events on both shards" 


      context "with permission on only a subset of accounts" do
        before do
          @user, @viewing_user = @user, @shard2.activate{ user_model }
          @user, _ = @user, @shard2.activate do
            custom_role = custom_account_role("CustomAdmin", :account => @account)
            account_admin_user_with_role_changes(
              :account => @account, :user => @viewing_user,
              :role => custom_role,
              :role_changes => {:manage_user_logins => true})
          end
        end

        it "should include events from visible accounts" 


        it "should not include events from non-visible accounts" 

      end
    end

    describe "pagination" do
      before do
        # 3 events total
        Auditors::Authentication.record(@pseudonym, 'logout')
        Auditors::Authentication.record(@pseudonym, 'login')
        @json = fetch_for_context(@user, :per_page => 2)
      end

      it "should only return one page of results" 


      it "should have pagination headers" 

    end
  end
end

