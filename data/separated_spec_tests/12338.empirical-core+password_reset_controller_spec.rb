require 'rails_helper'

describe PasswordResetController do
  describe '#index' do
    let(:new_user)  { double(:user) }

    before do
      allow(User).to receive(:new) { new_user }
    end

    it 'should set a new user' 

  end

  describe '#create' do
    context 'when user exists' do
      let!(:user) { create(:user) }
      let(:mailer) { double(:mailer, deliver_now!: true) }

      before do
        allow(UserMailer).to receive(:password_reset_email) { mailer }
      end

      it 'should refresh the token, send the password reset mailer and redirect to index path' 

    end

    context 'when user does not exist' do
      it 'should render the index page and show error' 

    end
  end

  describe '#show' do
    context 'when user exists' do
      let!(:user) { create(:user) }

      before do
        user.refresh_token!
      end

      it 'should set the user' 

    end

    context 'when user does not exists' do
      it 'should redirect to password reset index' 

    end
  end

  describe '#update' do
    before do
      @user = create(:user)
      @user.refresh_token!
    end

    context 'when passwords match' do
      it 'should update the sign the user in and redirect to profile path' 

    end

    context 'when passwords do not match' do
      it 'should set the flash error and render show' 

    end
  end
end

