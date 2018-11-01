#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "users" do
  include_context "in-process server selenium tests"

  context "logins" do
    it "should allow setting passwords for new pseudonyms" 

  end

  context "page views" do

    before (:each) do
      course_with_admin_logged_in
      @student = student_in_course.user
      Setting.set('enable_page_views', 'db')
    end

    it "should validate a basic page view" 


    it "should validate page view with a participation" 


    it "should validate a page view url" 


    it "should validate all page views were loaded" 

  end

  context "admin merge" do
    def setup_user_merge(from_user, into_user)
      get "/users/#{from_user.id}/admin_merge"
      f('#manual_user_id').send_keys(into_user.id)
      expect_new_page_load { f('button[type="submit"]').click }
    end

    def reload_users(users)
      users.each { |user| user.reload }
    end

    def submit_merge
      expect_new_page_load { f('#prepare_to_merge').click }
      expect_new_page_load { f('button[type="submit"]').click }
    end

    def validate_login_info(user_id)
      expect(f('#login_information')).to include_text(user_id)
    end

    before (:each) do
      @student_1_id = 'student1@example.com'
      @student_2_id = 'student2@example.com'

      course_with_admin_logged_in
      @student_1 = User.create!(:name => 'Student One')
      @student_1.register!
      @student_1.pseudonyms.create!(:unique_id => @student_1_id, :password => 'asdfasdf', :password_confirmation => 'asdfasdf')
      @course.enroll_user(@student_1).accept!

      @student_2 = User.create!(:name => 'Student Two')
      @student_2.register!
      @student_2.pseudonyms.create!(:unique_id => @student_2_id, :password => 'asdfasdf', :password_confirmation => 'asdfasdf')
      @course.enroll_user(@student_2).accept!
      @users = [@student_1, @student_2]
    end

    it "should merge user a with user b" 


    it "should merge user b with user a" 


    it "should validate switching the users to merge" 


    it "should cancel a merge and validate both users still exist" 


    it "should show an error if the user id entered is the current users" 


    it "should show an error if invalid text is entered in the id box" 


    it "should show an error if the user id doesnt exist" 

  end

  context "registration" do
    before :each do
      Account.default.canvas_authentication_provider.update_attribute(:self_registration, true)
    end

    it "should not require terms if globally not configured to do so" 


    it "should not require terms if account not configured to do so" 


    it "should require terms if configured to do so" 


    it "should register a student with a join code" 


    it "should register a teacher" 


    it "should register an observer" 

  end

  context "masquerading" do
    it "should masquerade as a user", priority: "1", test_id: 134743 do
      site_admin_logged_in(:name => 'The Admin')
      user_with_pseudonym(:active_user => true, :name => 'The Student')

      masquerade_url = "/users/#{@user.id}/masquerade"
      get masquerade_url
      f('a[href="' + masquerade_url + '"]').click
      expect(displayed_username).to include('The Student')

      bar = f('#masquerade_bar')
      expect(bar).to include_text 'You are currently acting as'
      bar.find_element(:css, '.stop_masquerading').click
      expect(displayed_username).to eq('The Admin')
    end
  end
end

