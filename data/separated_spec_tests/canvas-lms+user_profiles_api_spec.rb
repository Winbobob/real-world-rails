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

# FIXME: don't copy paste
class TestUserApi
  include Api::V1::UserProfile
  attr_accessor :services_enabled, :context, :current_user
  def service_enabled?(service); @services_enabled.include? service; end

  def avatar_image_url(user_id); "avatar_image_url(#{user_id})"; end

  def initialize
    @domain_root_account = Account.default
  end
end

def default_avatar_url
  "http://www.example.com/images/messages/avatar-50.png"
end

describe "User Profile API", type: :request do
  before :once do
    @admin = account_admin_user
    @admin_lti_user_id = Lti::Asset.opaque_identifier_for(@admin)
    course_with_student(:user => user_with_pseudonym(:name => 'Student', :username => 'pvuser@example.com'))
    @student.pseudonym.update_attribute(:sis_user_id, 'sis-user-id')
    Lti::Asset.opaque_identifier_for(@student)
    @user = @admin
    Account.default.tap { |a| a.enable_service(:avatars) }.save
    user_with_pseudonym(:user => @user)
  end

  it "should return another user's avatars, if allowed" 


  it "should return user info for users with no pseudonym" 


  it "should return this user's profile" 


  it 'should return the correct locale if not using the system default' 


  it "should return this user's profile (non-admin)" 


  it "respects :read_email_addresses permission" 


  it "should return this user's avatars, if allowed" 


  it "shouldn't return disallowed profiles" 


  context "user_services" do
    before :once do
      @student.user_services.create! :service => 'skype', :service_user_name => 'user', :service_user_id => 'user', :visible => false
      @student.user_services.create! :service => 'twitter', :service_user_name => 'user', :service_user_id => 'user', :visible => true
    end

    it "should return user_services, if requested" 


    it "should only return visible services for other users" 


    it "should return profile links, if requested" 

  end
end

