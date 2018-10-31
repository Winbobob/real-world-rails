require 'spec_helper'

describe RegistrationsController do
  describe '#create' do
    let(:user_params) { { user: { name: 'new_user', username: 'new_username', email: 'new@user.com', password: 'Any_password' } } }

    context 'email confirmation' do
      around do |example|
        perform_enqueued_jobs do
          example.run
        end
      end

      context 'when send_user_confirmation_email is false' do
        it 'signs the user in' 

      end

      context 'when send_user_confirmation_email is true' do
        it 'does not authenticate user and sends confirmation email' 

      end

      context 'when signup_enabled? is false' do
        it 'redirects to sign_in' 

      end
    end

    context 'when reCAPTCHA is enabled' do
      before do
        stub_application_setting(recaptcha_enabled: true)
      end

      it 'displays an error when the reCAPTCHA is not solved' 


      it 'redirects to the dashboard when the recaptcha is solved' 

    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
    end

    def expect_failure(message)
      expect(flash[:alert]).to eq(message)
      expect(response.status).to eq(303)
      expect(response).to redirect_to profile_account_path
    end

    def expect_password_failure
      expect_failure('Invalid password')
    end

    def expect_username_failure
      expect_failure('Invalid username')
    end

    def expect_success
      expect(flash[:notice]).to eq 'Account scheduled for removal.'
      expect(response.status).to eq(303)
      expect(response).to redirect_to new_user_session_path
    end

    context 'user requires password confirmation' do
      it 'fails if password confirmation is not provided' 


      it 'fails if password confirmation is wrong' 


      it 'succeeds if password is confirmed' 

    end

    context 'user does not require password confirmation' do
      before do
        stub_application_setting(password_authentication_enabled_for_web: false)
        stub_application_setting(password_authentication_enabled_for_git: false)
      end

      it 'fails if username confirmation is not provided' 


      it 'fails if username confirmation is wrong' 


      it 'succeeds if username is confirmed' 

    end
  end
end

