require 'spec_helper'

describe Profiles::TwoFactorAuthsController do
  before do
    # `user` should be defined within the action-specific describe blocks
    sign_in(user)

    allow(subject).to receive(:current_user).and_return(user)
  end

  describe 'GET show' do
    let(:user) { create(:user) }

    it 'generates otp_secret for user' 


    it 'assigns qr_code' 

  end

  describe 'POST create' do
    let(:user) { create(:user) }
    let(:pin)  { 'pin-code' }

    def go
      post :create, pin_code: pin
    end

    context 'with valid pin' do
      before do
        expect(user).to receive(:validate_and_consume_otp!).with(pin).and_return(true)
      end

      it 'enables 2fa for the user' 


      it 'presents plaintext codes for the user to save' 


      it 'renders create' 

    end

    context 'with invalid pin' do
      before do
        expect(user).to receive(:validate_and_consume_otp!).with(pin).and_return(false)
      end

      it 'assigns error' 


      it 'assigns qr_code' 


      it 'renders show' 

    end
  end

  describe 'POST codes' do
    let(:user) { create(:user, :two_factor) }

    it 'presents plaintext codes for the user to save' 


    it 'persists the generated codes' 

  end

  describe 'DELETE destroy' do
    let(:user) { create(:user, :two_factor) }

    it 'disables two factor' 


    it 'redirects to profile_account_path' 

  end
end

