require 'spec_helper'

describe 'Signup' do
  include TermsHelper

  let(:new_user) { build_stubbed(:user) }

  describe 'username validation', :js do
    before do
      visit root_path
      click_link 'Register'
    end

    it 'does not show an error border if the username is available' 


    it 'does not show an error border if the username contains dots (.)' 


    it 'shows an error border if the username already exists' 


    it 'shows an  error border if the username contains special characters' 

  end

  context 'with no errors' do
    context "when sending confirmation email" do
      before do
        stub_application_setting(send_user_confirmation_email: true)
      end

      it 'creates the user account and sends a confirmation email' 

    end

    context "when sigining up with different cased emails" do
      it "creates the user successfully" 

    end

    context "when not sending confirmation email" do
      before do
        stub_application_setting(send_user_confirmation_email: false)
      end

      it 'creates the user account and goes to dashboard' 

    end
  end

  context 'with errors' do
    it "displays the errors" 


    it 'does not redisplay the password' 

  end

  context 'when terms are enforced' do
    before do
      enforce_terms
    end

    it 'asks the user to accept terms before going to the dashboard' 

  end
end

