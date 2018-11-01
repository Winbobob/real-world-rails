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

describe "admin settings tab" do
  include_context "in-process server selenium tests"
  before :once do
    account_admin_user
  end

  before :each do
    user_session(@admin)
  end

  def get_default_services
    default_services = []
    service_hash = Account.default.allowed_services_hash
    service_hash.each do |k, v|
      default_services.push k if v[:expose_to_ui] &&
        (!v[:expose_to_ui_proc] || v[:expose_to_ui_proc].call(@user, Account.default))
    end
    default_services
  end

  def state_checker checker, check_state
    if (checker)
      expect(check_state).to be_truthy
    else
      expect(check_state).to be_falsey
    end
  end

  def check_box_verifier (css_selectors, features, checker = true)
    is_symbol = false

    css_selectors = [css_selectors] unless (css_selectors.is_a? Array)

    if features.is_a? Symbol
      is_symbol = true
      if features == :all_selectors
        features = get_default_services
      end
    end
    if ((features.is_a? Array) && !checker)
      default_selectors = []
      features.each do |feature|
        check_state = Account.default.service_enabled?(feature)
        state_checker checker, !check_state
        default_selectors.push("#account_services_#{feature}")
      end
      css_selectors = default_selectors
    end
    css_selectors.each do |selector|
      check_state = is_checked(selector)
      state_checker !checker, check_state
      f(selector).click
    end
    click_submit
    if (is_symbol == false)
      check_state = Account.default.service_enabled?(features[:allowed_services])
      state_checker checker, check_state
    else
      if (features.is_a? Array)
        default_selectors = []
        features.each do |feature|
          check_state = Account.default.service_enabled?(feature)
          state_checker checker, check_state
          default_selectors.push("#account_services_#{feature}")
        end
        if (checker)
          default_selectors += css_selectors
        end
        css_selectors = default_selectors
      else
        check_state = Account.default.settings[features]
        state_checker checker, check_state
      end
    end
    css_selectors.each do |selector|
      check_state = is_checked(selector)
      state_checker checker, check_state
    end
  end

  def click_submit
    move_to_click("#account_settings button[type=submit]")
    wait_for_ajax_requests
  end

  def go_to_feature_options(account_id)
    get "/accounts/#{account_id}/settings"
    f("#tab-features-link").click
    wait_for_ajaximations
  end

  context "account settings" do
    before :each do
      get "/accounts/#{Account.default.id}/settings"
    end

    it "should change the default time zone to Lima" 


    describe "allow self-enrollment" do
      def enrollment_helper (value='')
        if (value == '')
          f("#account_settings_self_enrollment option[value='']").click
        else
          f("#account_settings_self_enrollment option[value=#{value}]").click
        end
        click_submit
        expect(Account.default[:settings][:self_enrollment]).to eq value.presence
        expect(f("#account_settings_self_enrollment")).to have_value value
      end

      it "should select never for self-enrollment" 


      it "should select self-enrollment for any courses" 


      it "should select self-enrollment for manually-created courses" 

    end

    it "should click on don't let teachers rename their courses" 


    it "should uncheck 'students can opt-in to receiving scores in email notifications' " 


    it "should set trusted referers for account" 

  end

  context "quiz ip address filter" do
    before :each do
      get "/accounts/#{Account.default.id}/settings"
    end

    def add_quiz_filter name ="www.canvas.instructure.com", value="192.168.217.1/24"
      fj("#ip_filters .name[value='']:visible").send_keys name
      fj("#ip_filters .value[value='']:visible").send_keys value
      click_submit
      filter_hash = {name => value}
      expect(Account.default.settings[:ip_filters]).to include filter_hash
      expect(fj("#ip_filters .name[value='#{name}']")).to be_displayed
      expect(fj("#ip_filters .value[value='#{value}']")).to be_displayed
      filter_hash
    end

    def create_quiz_filter(name="www.canvas.instructure.com", value="192.168.217.1/24")
      Account.default.tap do |a|
        a.settings[:ip_filters] ||= []
        a.settings[:ip_filters] << {name => value}
        a.save!
      end
    end

    it "should click on the quiz help link" 


    it "should add a quiz filter" 


    it "should add another quiz filter" 


    it "should edit a quiz filter" 


    it "should delete a quiz filter" 

  end

  context "features" do
    before :each do
      get "/accounts/#{Account.default.id}/settings"
    end

    it "should check 'open registration'" 


    it "should uncheck users can edit display name' and check it again" 


    describe "equella settings" do

      def add_equella_feature
        equella_url = "http://oer.equella.com/signon.do"
        f("#account_settings_equella_endpoint").send_keys(equella_url)
        f("#account_settings_equella_teaser").send_keys("equella feature")
        click_submit
        expect(Account.default.settings[:equella_endpoint]).to eq equella_url
        expect(Account.default.settings[:equella_teaser]).to eq "equella feature"
        expect(f("#account_settings_equella_endpoint")).to have_value equella_url
        expect(f("#account_settings_equella_teaser")).to have_value "equella feature"
      end

      before(:each) do
        f("#enable_equella").click
      end

      it "should add an equella feature" 


      it "should edit an equella feature" 


      it "should delete an equella feature" 

    end
  end

  context "enabled web services" do
    before :each do
      get "/accounts/#{Account.default.id}/settings"
    end

    it "should click on the google help dialog" 


    it "should unclick and then click on skype" 


    it "should unclick and then click on delicious" 


    it "should unclick and click on google docs previews" 


    it "should click on user avatars" 


    it "should disable all web services" 


    it "should enable all web services" 


    it "should enable and disable a plugin service (setting)" 


    it "should enable and disable a plugin service (service)" 

  end

  context "who can create new courses" do
    before :each do
      get "/accounts/#{Account.default.id}/settings"
    end

    it "should check on teachers" 


    it "should check on users with no enrollments" 


    it "should check on students" 

  end

  context "custom help links" do
    before :once do
      Setting.set('show_feedback_link', 'true')
    end

    def set_checkbox(checkbox, checked)
      selector = "##{checkbox['id']}"
      checkbox.click if is_checked(selector) != checked
    end

    it "should set custom help link text and icon" 


    it "should not delete all of the pre-existing custom help links if notifications tab is submitted" 


    it "should preserve the default help links if the account hasn't been configured with the new ui yet" 


    it "adds a custom link" 


    it "edits a custom link" 


    it "edits a default link" 

  end

  context "external integration keys" do
    let!(:key_value) { '42' }
    before(:once) do
      ExternalIntegrationKey.key_type :external_key0, label: 'External Key 0', rights: { read: proc { true }, write: true }
      ExternalIntegrationKey.key_type :external_key1, label: proc { 'External Key 1' }, rights: { read: true, write: false }
      ExternalIntegrationKey.key_type :external_key2, label: 'External Key 2', rights: { read: proc { false }, write: false }
    end

    it "should not display external integration keys if no key types exist" 


    it "should not display external integration keys if no rights are granted" 


    it "should display keys with the correct rights" 


    it "should update writable keys" 

  end

  it "shows all feature flags that are expected to be visible" 

end

