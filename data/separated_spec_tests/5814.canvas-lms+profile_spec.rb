# encoding: utf-8
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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "profile" do
  include_context "in-process server selenium tests"

  def click_edit
    f('.edit_settings_link').click
    edit_form = f('#update_profile_form')
    expect(edit_form).to be_displayed
    edit_form
  end

  def add_skype_service
    f('#unregistered_service_skype > a').click
    skype_dialog = f('#unregistered_service_skype_dialog')
    skype_dialog.find_element(:id, 'skype_user_service_user_name').send_keys("jakesorce")
    wait_for_new_page_load { submit_dialog(skype_dialog, '.btn') }
    expect(f('#registered_services')).to include_text("Skype")
  end

  def generate_access_token(purpose = 'testing', close_dialog = false)
    generate_access_token_with_expiration(nil, purpose)
    if close_dialog
      close_visible_dialog
    end
  end

  def generate_access_token_with_expiration(date, purpose = 'testing')
    f('.add_access_token_link').click
    access_token_form = f('#access_token_form')
    access_token_form.find_element(:id, 'access_token_purpose').send_keys(purpose)
    access_token_form.find_element(:id, 'access_token_expires_at').send_keys(date) unless date.nil?
    submit_dialog_form(access_token_form)
    wait_for_ajax_requests
    details_dialog = f('#token_details_dialog')
    expect(details_dialog).to be_displayed
  end

  def log_in_to_settings
    user_with_pseudonym({active_user: true})
    create_session(@pseudonym)
    get '/profile/settings'
  end

  def change_password(old_password, new_password)
    edit_form = click_edit
    edit_form.find_element(:id, 'change_password_checkbox').click
    edit_form.find_element(:id, 'old_password').send_keys(old_password)
    edit_form.find_element(:id, 'pseudonym_password').send_keys(new_password)
    edit_form.find_element(:id, 'pseudonym_password_confirmation').send_keys(new_password)
    wait_for_new_page_load { submit_form(edit_form) }
  end

  it "should give error - wrong old password" 


  it "should change the password" 


  it "rejects passwords longer than 255 characters", priority: "2", test_id: 840136 do
    log_in_to_settings
    change_password('asdfasdf', SecureRandom.hex(128))
    errorboxes = ff('.error_text')
    expect(errorboxes.any? { |errorbox| errorbox.text =~ /Can't exceed 255 characters/ }).to be_truthy
  end

  it "rejects passwords shorter than 8 characters", priority: "2", test_id: 1055503 do
    log_in_to_settings
    change_password('asdfasdf', SecureRandom.hex(2))
    errorboxes = ff('.error_text')
    expect(errorboxes.any? { |errorbox| errorbox.text =~ /Must be at least 8 characters/ }).to be_truthy
  end

  context "non password tests" do

    before(:each) do
      course_with_teacher_logged_in
    end

    def add_email_link
      f('#right-side .add_email_link').click
    end

    it "should add a new email address on profile settings page" 


    it "should change default email address" 


    it "should edit full name" 


    it "should edit display name and validate" 


    it "should change the language" 


    it "should change the language even if you can't update your name" 


    it "should add another contact method - sms" 


    it "should register a service" 


    it "should delete a service" 


    it "should toggle user services visibility" 


    it "should generate a new access token without an expiration", priority: "2", test_id: 588918 do
      get "/profile/settings"
      generate_access_token('testing', true)
      # some jquery replaces the expiration which makes it hard to select until refresh
      driver.navigate.refresh
      expect(f('.access_token .expires')).to include_text('never')
    end

    it "should generate a new access token with an expiration", priority: "2", test_id: 588919 do
      Timecop.freeze do
        get "/profile/settings"
        generate_access_token_with_expiration(format_date_for_view(2.days.from_now, :medium))
        close_visible_dialog
        # some jquery replaces the 'never' with the expiration which makes it hard to select until refresh
        driver.navigate.refresh
      end
      expect(f('.access_token .expires')).to include_text(format_time_for_view(2.days.from_now.midnight))
    end

    it "should regenerate a new access token", priority: "2", test_id: 588920 do
      skip_if_safari(:alert)
      get "/profile/settings"
      generate_access_token
      token = f('.visible_token').text
      f('.regenerate_token').click
      expect(driver.switch_to.alert).not_to be_nil
      driver.switch_to.alert.accept
      wait_for_ajaximations
      new_token = f('.visible_token').text
      expect(token).not_to eql(new_token)
    end

    it "should test canceling creating a new access token" 


    it "should view the details of an access token" 


    it "should delete an access token", priority: "2", test_id: 588921 do
      skip_if_safari(:alert)
      get "/profile/settings"
      generate_access_token('testing', true)
      # had to use :visible because it was failing saying element wasn't visible
      fj("#access_tokens .delete_key_link:visible").click
      expect(driver.switch_to.alert).not_to be_nil
      driver.switch_to.alert.accept
      wait_for_ajaximations
      expect(f('#access_tokens')).not_to be_displayed
      check_element_has_focus f(".add_access_token_link")
    end

    it "should set focus to the previous access token when deleting and multiple exist" 

  end

  context "services test" do
    before(:each) do
      course_with_teacher_logged_in
    end

    it "should link back to profile/settings in oauth callbacks" 

  end

  describe "profile pictures local tests" do
    before do
      local_storage!
    end

    it "should save admin profile pics setting", priority: "1", test_id: 68933 do
      site_admin_logged_in
      get "/accounts/#{Account.default.id}/settings"
      f('#account_services_avatars').click
      f('.Button.Button--primary[type="submit"]').click
      wait_for_ajaximations
      expect(is_checked('#account_services_avatars')).to be_truthy
    end

    # TODO: reimplement per CNVS-29610, but make sure we're testing at the right level
    it "should successfully upload profile pictures"

    it "should allow users to choose an avatar from their profile page" 

  end

  describe "profile pictures s3 tests" do
    # TODO: reimplement per CNVS-29611, but make sure we're testing at the right level
    it "should successfully upload profile pictures"
  end

  describe "avatar reporting" do
    before :each do
      Account.default.enable_service(:avatars)
      Account.default.settings[:avatars] = 'enabled_pending'
      Account.default.save!

      course_with_student_logged_in(:active_all => true)
      @other_student = user_factory
      @other_student.avatar_state = "submitted"
      @other_student.save!
      student_in_course(:course => @course, :user => @other_student, :active_all => true)
    end

    it "should be able to report inappropriate pictures without profiles enabled" 


    it "should be able to report inappropriate pictures with profiles enabled" 

  end
end

