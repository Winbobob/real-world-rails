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

require File.expand_path(File.dirname(__FILE__) + '/../common')
require_relative '../grades/pages/gradebook_page'
require_relative 'pages/student_context_tray_page'

describe "admin avatars" do
  include_context "in-process server selenium tests"

  before (:each) do
    course_with_admin_logged_in
    Account.default.enable_service(:avatars)
    Account.default.settings[:avatars] = 'enabled_pending'
    Account.default.save!
  end

  def create_avatar_state(avatar_state="submitted", avatar_image_url="http://www.example.com")
    user = User.last
    user.avatar_image_url = avatar_image_url
    user.save!
    user.avatar_state = avatar_state
    user.save!
    get "/accounts/#{Account.default.id}/avatars"
    user
  end

  def verify_avatar_state(user, opts={})
    if (opts.empty?)
      expect(f("#submitted_profile")).to include_text "Submitted 1"
      f("#submitted_profile").click
    else
      expect(f(opts.keys[0])).to include_text(opts.values[0])
      f(opts.keys[0]).click
    end
    expect(f("#avatars .name")).to include_text user.name
    expect(f(".avatar")).to have_attribute('style', /http/)
  end

  def lock_avatar(user, element)
    element.click
    f(".links .lock_avatar_link").click
    driver.switch_to.alert.accept
    wait_for_ajax_requests
    expect(f(".links .unlock_avatar_link")).to be_displayed
    user.reload
    expect(user.avatar_state).to eq :locked
    user
  end

  it "should verify that the profile pictures is submitted " 


  it "should verify that the profile pictures is reported " 


  it "should verify that the profile picture is approved, re-reported " 


  it "should verify that all profile pictures are displayed " 


  it "should lock the avatar state " 


  it "should unlock the avatar state " 


  it "should approve un-approved avatar" 

  it "should delete the avatar" 


  context "student tray in original gradebook" do
    include StudentContextTray

    before(:each) do
      preload_graphql_schema
      @account = Account.default
      @account.enable_feature!(:student_context_cards)
      @student = student_in_course.user
      @student.avatar_image_url = "http://www.example.com"
      Gradebook.visit_gradebook(@course)
      Gradebook.student_name_link(@student.id).click
    end

    it "should display student avatar in tray", priority: "1", test_id: 3299466 do
      wait_for_student_tray

      expect(student_avatar_link).to be_displayed
    end
  end
end

