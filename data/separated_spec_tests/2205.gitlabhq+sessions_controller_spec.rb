require 'spec_helper'

describe SessionsController do
  include DeviseHelpers

  describe '#new' do
    before do
      set_devise_mapping(context: @request)
    end

    context 'when auto sign-in is enabled' do
      before do
        stub_omniauth_setting(auto_sign_in_with_provider: :saml)
        allow(controller).to receive(:omniauth_authorize_path).with(:user, :saml)
          .and_return('/saml')
      end

      context 'and no auto_sign_in param is passed' do
        it 'redirects to :omniauth_authorize_path' 

      end

      context 'and auto_sign_in=false param is passed' do
        it 'responds with 200' 

      end
    end
  end

  describe '#create' do
    before do
      set_devise_mapping(context: @request)
    end

    context 'when using standard authentications' do
      context 'invalid password' do
        it 'does not authenticate user' 

      end

      context 'when using valid password', :clean_gitlab_redis_shared_state do
        let(:user) { create(:user) }
        let(:user_params) { { login: user.username, password: user.password } }

        it 'authenticates user correctly' 


        it 'creates an audit log record' 


        include_examples 'user login request with unique ip limit', 302 do
          def request
            post(:create, user: user_params)
            expect(subject.current_user).to eq user
            subject.sign_out user
          end
        end

        it 'updates the user activity' 

      end

      context 'when reCAPTCHA is enabled' do
        let(:user) { create(:user) }
        let(:user_params) { { login: user.username, password: user.password } }

        before do
          stub_application_setting(recaptcha_enabled: true)
          request.headers[described_class::CAPTCHA_HEADER] = 1
        end

        it 'displays an error when the reCAPTCHA is not solved' 


        it 'successfully logs in a user when reCAPTCHA is solved' 

      end
    end

    context 'when using two-factor authentication via OTP' do
      let(:user) { create(:user, :two_factor) }

      def authenticate_2fa(user_params)
        post(:create, { user: user_params }, { otp_user_id: user.id })
      end

      context 'remember_me field' do
        it 'sets a remember_user_token cookie when enabled' 


        it 'does nothing when disabled' 

      end

      ##
      # See #14900 issue
      #
      context 'when authenticating with login and OTP of another user' do
        context 'when another user has 2FA enabled' do
          let(:another_user) { create(:user, :two_factor) }

          context 'when OTP is valid for another user' do
            it 'does not authenticate' 

          end

          context 'when OTP is invalid for another user' do
            it 'does not authenticate' 

          end

          context 'when authenticating with OTP' do
            context 'when OTP is valid' do
              it 'authenticates correctly' 

            end

            context 'when OTP is invalid' do
              before do
                authenticate_2fa(otp_attempt: 'invalid')
              end

              it 'does not authenticate' 


              it 'warns about invalid OTP code' 

            end
          end

          context 'when the user is on their last attempt' do
            before do
              user.update(failed_attempts: User.maximum_attempts.pred)
            end

            context 'when OTP is valid' do
              it 'authenticates correctly' 

            end

            context 'when OTP is invalid' do
              before do
                authenticate_2fa(otp_attempt: 'invalid')
              end

              it 'does not authenticate' 


              it 'warns about invalid login' 


              it 'locks the user' 


              it 'keeps the user locked on future login attempts' 

            end
          end

          context 'when another user does not have 2FA enabled' do
            let(:another_user) { create(:user) }

            it 'does not leak that 2FA is disabled for another user' 

          end
        end
      end

      it "creates an audit log record" 

    end

    context 'when using two-factor authentication via U2F device' do
      let(:user) { create(:user, :two_factor) }

      def authenticate_2fa_u2f(user_params)
        post(:create, { user: user_params }, { otp_user_id: user.id })
      end

      context 'remember_me field' do
        it 'sets a remember_user_token cookie when enabled' 


        it 'does nothing when disabled' 

      end

      it "creates an audit log record" 

    end
  end

  describe "#new" do
    before do
      set_devise_mapping(context: @request)
    end

    it "redirects correctly for referer on same host with params" 

  end
end

