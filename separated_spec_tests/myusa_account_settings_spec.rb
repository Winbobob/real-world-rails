require 'feature_helper'

describe 'Account Settings' do
  let(:account_settings_page) { AccountSettingsPage.new }
  let(:home_page) { HomePage.new }
  let(:mobile_confirmation_page) { MobileConfirmationPage.new }
  let(:sms_page) { TwoFactor::SmsPage.new}
  # let(:profile_page) { ProfilePage.new }

  describe 'visiting account settings page' do
    before :each do
      login(user)
      account_settings_page.load
    end

    context 'two factor is not configured' do
      let(:user) { FactoryGirl.create(:user) }

      it 'can access settings page' 

    end

    context 'two-factor is configured' do
      let(:user) { FactoryGirl.create(:user, :with_2fa) }

      it 'two-factor authentication is required' 

    end
  end

  describe '2FA Settings', sms: true do
    let(:mobile_number) { '8005553455' }

    def receive_code
      open_last_text_message_for(mobile_number)
      expect(current_text_message.body).to match(/Your MyUSA verification code is \d{6}/)
      current_text_message.body.match /\d{6}/
    end

    before :each do
      login(user, two_factor: two_factor)
      account_settings_page.load
    end

    shared_examples 'mobile recovery entry' do
      it 'can start two factor configure flow' 


      it 'can configure 2fa' 

    end

    context 'two-factor authentication is not configured' do
      let(:user) { FactoryGirl.create(:user) }
      let(:two_factor) { false }

      it 'enable link is present' 


      include_examples 'mobile recovery entry'
    end

    context 'two-factor authentication is configured' do
      let(:user) { FactoryGirl.create(:user, mobile_number: mobile_number) }
      let(:two_factor) { true }

      it 'configure link is present' 


      include_examples 'mobile recovery entry'
    end
  end

  describe 'Account Removal' do
    let(:user) { FactoryGirl.create(:user, :with_2fa) }
    let(:email) { user.email }
    before do
      login(user, two_factor: true)
      account_settings_page.load
      account_settings_page.delete_account.email.set email
      account_settings_page.delete_account.submit.click
    end

    context 'the incorrect email is entered' do
      let(:email) { 'wrong@example.com' }

      it 'displayes message when invalid email is entered' 

    end

    context 'the correct email is entered' do
      it 'deletes the account when the correct email is entered' 

    end
  end

end

