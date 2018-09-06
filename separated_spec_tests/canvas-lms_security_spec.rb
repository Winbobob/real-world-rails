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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

require 'nokogiri'

describe "security" do

  describe "session fixation" do
    it "should change the cookie session id after logging in" 

  end

  describe "permissions" do
    # if we end up moving the permissions cache to memcache, this test won't be
    # valid anymore and we need some more extensive tests for actual cache
    # invalidation. right now, though, this is the only really valid way to
    # test that we're actually flushing on every request.
    it "should flush the role_override caches on every request" 

  end

  describe 'session cookies' do
    it "should always set the primary cookie to session expiration" 


    it "should not return pseudonym_credentials when not remember_me" 

  end

  it "should not prepend login json responses with protection" 


  it "should prepend GET JSON responses with protection" 


  it "should not prepend GET JSON responses to Accept application/json requests with protection" 


  it "should not prepend non-GET JSON responses with protection" 


  describe "remember me" do
    before do
      @u = user_with_pseudonym :active_all => true,
                              :username => "nobody@example.com",
                              :password => "asdfasdf"
      @u.save!
      @p = @u.pseudonym
      https!
    end

    it "should not remember me when the wrong token is given" 


    it "should login via persistence token when no session exists" 


    it "should not allow login via the same valid token twice" 


    it "should generate a new valid token when a token is used" 


    it "should generate and return a token when remember_me is checked" 


    it "should destroy the token both user agent and server side on logout" 


    it "should allow multiple remember_me tokens for the same user" 


    it "should not login if the pseudonym is deleted" 


    it "should not login if the pseudonym.persistence_token gets changed (pw change)" 


    context "sharding" do
      specs_require_sharding

      it "should work for an out-of-shard user" 

    end
  end

  if Canvas.redis_enabled?
    describe "max login attempts" do
      before do
        Setting.set('login_attempts_total', '2')
        Setting.set('login_attempts_per_ip', '1')
        u = user_with_pseudonym :active_user => true,
          :username => "nobody@example.com",
          :password => "asdfasdf"
        u.save!
      end

      def bad_login(ip)
        post "/login/canvas",
          params: { "pseudonym_session[unique_id]" => "nobody@example.com", "pseudonym_session[password]" => "failboat" },
          headers: { "REMOTE_ADDR" => ip }
        follow_redirect! while response.redirect?
      end

      it "should be limited for the same ip" 


      it "should have a higher limit for other ips" 


      it "should not block other users with the same ip" 


      it "should apply limitations correctly for cross-account logins" 

    end
  end

  it "should only allow user list username resolution if the current user has appropriate rights" 


  describe "user masquerading" do
    before(:each) do
      course_with_teacher
      @teacher = @user

      student_in_course
      @student = @user
      user_with_pseudonym :user => @student, :username => 'student@example.com', :password => 'password'
      @student_pseudonym = @pseudonym

      account_admin_user :account => Account.site_admin
      @admin = @user
      user_with_pseudonym :user => @admin, :username => 'admin@example.com', :password => 'password'
    end

    it "should require confirmation for becoming a user" 


    it "should not allow as_user_id for normal requests" 


    it "should not allow non-admins to become other people" 


    it "should record real user in page_views" 


    it "should remember the destination with an intervening auth" 

  end

  it "should not allow logins to safefiles domains" 


  describe "admin permissions" do
    before(:each) do
      @role = custom_account_role('Limited Admin', :account => Account.site_admin)
      account_admin_user(:account => Account.site_admin, :role => @role)
      user_session(@admin)
    end

    def add_permission(permission)
      Account.site_admin.role_overrides.create!(:permission => permission.to_s,
        :role => @role,
        :enabled => true)
    end

    def remove_permission(permission, role)
      Account.default.role_overrides.create!(:permission => permission.to_s,
              :role => role,
              :enabled => false)
    end

    describe "site admin" do
      it "role_overrides" 

    end

    describe 'root account' do
      it "read_roster" 


      it "read_course_list" 


      it "view_statistics" 


      it "manage_user_notes" 


      it "view_jobs" 

    end

    describe 'course' do
      before (:each) do
        course_factory(active_all: true)
        Account.default.update_attribute(:settings, { :no_enrollments_can_create_courses => false })
      end

      it 'read_as_admin' 


      it 'read_roster' 


      it "manage_students" 


      it 'view_all_grades' 


      it 'read_course_content' 


      it 'manage_content' 


      it 'read_reports' 


      it 'manage_sections' 


      it 'change_course_state' 


      it 'view_statistics' 

    end
  end
end

