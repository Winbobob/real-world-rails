require 'spec_helper'

describe 'Sign in' do
  let!(:identity) { create :identity }
  let!(:member) { create :member, email: identity.email, activated: true }

  it 'allows a user to sign in with email, password' 


  it 'prevents a user to sign if his account is disabled' 


  it "sends notification email after user sign in" 


  context 'when a user has 2-step verification setup and after signing in with email, password' do
    let!(:member) { create :member, email: identity.email }
    let!(:two_factor) { member.app_two_factor }

    before { two_factor.refresh! }

    it 'if he tries to perform 2-step verification after session expires, should redirect user back to login step with error message', js: true do
      pending

      signin identity
      clear_cookie

      fill_in 'two_factor_otp', with: two_factor.now
      click_on I18n.t('helpers.submit.two_factor.create')

      expect(current_path).to eq(signin_path)
      expect(page).to have_content(t('verify.two_factors.create.timeout'))
    end
  end

  it 'display captcha after too many failed attempts' 


end

