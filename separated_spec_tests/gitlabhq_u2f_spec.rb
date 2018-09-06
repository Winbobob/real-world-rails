require 'spec_helper'

feature 'Using U2F (Universal 2nd Factor) Devices for Authentication', :js do
  def manage_two_factor_authentication
    click_on 'Manage two-factor authentication'
    expect(page).to have_content("Setup new U2F device")
    wait_for_requests
  end

  def register_u2f_device(u2f_device = nil, name: 'My device')
    u2f_device ||= FakeU2fDevice.new(page, name)
    u2f_device.respond_to_u2f_registration
    click_on 'Setup new U2F device'
    expect(page).to have_content('Your device was successfully set up')
    fill_in "Pick a name", with: name
    click_on 'Register U2F device'
    u2f_device
  end

  describe "registration" do
    let(:user) { create(:user) }

    before do
      gitlab_sign_in(user)
      user.update_attribute(:otp_required_for_login, true)
    end

    describe 'when 2FA via OTP is disabled' do
      before do
        user.update_attribute(:otp_required_for_login, false)
      end

      it 'does not allow registering a new device' 

    end

    describe 'when 2FA via OTP is enabled' do
      it 'allows registering a new device with a name' 


      it 'allows registering more than one device' 


      it 'allows deleting a device' 

    end

    it 'allows the same device to be registered for multiple users' 


    context "when there are form errors" do
      it "doesn't register the device if there are errors" 


      it "allows retrying registration" 

    end
  end

  describe "authentication" do
    let(:user) { create(:user) }

    before do
      # Register and logout
      gitlab_sign_in(user)
      user.update_attribute(:otp_required_for_login, true)
      visit profile_account_path
      manage_two_factor_authentication
      @u2f_device = register_u2f_device
      gitlab_sign_out
    end

    describe "when 2FA via OTP is disabled" do
      it "allows logging in with the U2F device" 

    end

    describe "when 2FA via OTP is enabled" do
      it "allows logging in with the U2F device" 

    end

    describe "when a given U2F device has already been registered by another user" do
      describe "but not the current user" do
        it "does not allow logging in with that particular device" 

      end

      describe "and also the current user" do
        it "allows logging in with that particular device" 

      end
    end

    describe "when a given U2F device has not been registered" do
      it "does not allow logging in with that particular device" 

    end

    describe "when more than one device has been registered by the same user" do
      it "allows logging in with either device" 

    end

    describe "when two-factor authentication is disabled" do
      let(:user) { create(:user) }

      before do
        user = gitlab_sign_in(:user)
        user.update_attribute(:otp_required_for_login, true)
        visit profile_account_path
        manage_two_factor_authentication
        expect(page).to have_content("Your U2F device needs to be set up.")
        register_u2f_device
      end

      it "deletes u2f registrations" 

    end
  end

  describe 'fallback code authentication' do
    let(:user) { create(:user) }

    def assert_fallback_ui(page)
      expect(page).to have_button('Verify code')
      expect(page).to have_css('#user_otp_attempt')
      expect(page).not_to have_link('Sign in via 2FA code')
      expect(page).not_to have_css('#js-authenticate-u2f')
    end

    before do
      # Register and logout
      gitlab_sign_in(user)
      user.update_attribute(:otp_required_for_login, true)
      visit profile_account_path
    end

    describe 'when no u2f device is registered' do
      before do
        gitlab_sign_out
        gitlab_sign_in(user)
      end

      it 'shows the fallback otp code UI' 

    end

    describe 'when a u2f device is registered' do
      before do
        manage_two_factor_authentication
        @u2f_device = register_u2f_device
        gitlab_sign_out
        gitlab_sign_in(user)
      end

      it 'provides a button that shows the fallback otp code UI' 

    end
  end
end

