#
# Copyright (C) 2012 Instructure, Inc.
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

describe PseudonymsController, type: :request do
  before :once do
    course_with_student(:active_all => true)
    account_admin_user
    @account = @user.account
  end

  describe "pseudonym listing" do
    before do
      @account_path = "/api/v1/accounts/#{@account.id}/logins"
      @account_path_options = { :controller => 'pseudonyms', :action => 'index', :format => 'json', :account_id => @account.id.to_param }
      @user_path = "/api/v1/users/#{@student.id}/logins"
      @user_path_options = { :controller => 'pseudonyms', :action => 'index', :format => 'json', :user_id => @student.id.to_param }
    end

    context "An authorized user with a valid query" do
      it "should return a list of pseudonyms" 


      it "should return multiple pseudonyms if they exist" 


      it "should paginate results" 


      it "should return all pseudonyms for a user" 


      it "should not included deleted pseudonyms" 

    end

    context "An authorized user with an empty query" do
      it "should return an empty array" 

    end

    context "An unauthorized user" do
      before :once do
        @user = user_with_pseudonym
      end

      it "should return 401 unauthorized when listing account pseudonyms" 


      it "should return 401 unauthorized when listing user pseudonyms" 

    end
  end

  describe "pseudonym creation" do
    before do
      @path = "/api/v1/accounts/#{@account.id}/logins"
      @path_options = { :controller => 'pseudonyms', :action => 'create', :format => 'json', :account_id => @account.id.to_param }
    end

    context "an authorized user" do
      it "should create a new pseudonym" 


      it "should return 400 if account_id is not a root account" 


      it "should return 400 on duplicate pseudonyms" 


      it "should return 400 when nothing is passed" 


      it "returns 401 when trying to set a password on a non-Canvas login" 

    end

    context "an unauthorized user" do
      it "should return 401" 

    end

    it "should not allow user to add their own pseudonym to an arbitrary account" 

  end

  describe "pseudonym updates" do
    before :once do
      @student.pseudonyms.create!(:unique_id => 'student@example.com')
      @admin.pseudonyms.create!(:unique_id => 'admin@example.com')
      @teacher.pseudonyms.create!(:unique_id => 'teacher@example.com')
      @path = "/api/v1/accounts/#{@account.id}/logins/#{@student.pseudonym.id}"
      @path_options = { :controller => 'pseudonyms', :format => 'json', :action => 'update', :account_id => @account.id.to_param, :id => @student.pseudonym.id.to_param }
      a = Account.find(Account.default.id)
      a.settings[:admins_can_change_passwords] = true
      a.save!
    end

    context "an authorized user" do
      it "should be able to update a pseudonym" 


      it "should return 400 if the unique_id already exists" 


      it "should return 200 if a user's sis id is updated to its current value" 


      it "should return 200 if changing only sis id" 


      it "should allow changing sis id even if password setting is disabled" 


      it "should not allow updating a deleted pseudonym" 

    end

    context "an unauthorized user" do
      it "should return 401" 

    end
  end

  describe "pseudonym deletion" do
    before :once do
      @student.pseudonyms.create!(:unique_id => 'student@example.com')
      @path = "/api/v1/users/#{@student.id}/logins/#{@student.pseudonym.id}"
      @path_options = { :controller => 'pseudonyms',
        :action => 'destroy', :format => 'json',
        :user_id => @student.id.to_param, :id => @student.pseudonym.id.to_param }
    end

    context "an authorized user" do
      it "should be able to delete a pseudonym" 


      it "should receive an error when trying to delete the user's last pseudonym" 


      it "should not allow re-deleting a login that has already been deleted" 

    end

    context "an unauthorized user" do
      it "should return 401" 

    end
  end
end

