require 'spec_helper'
require 'raven/transports/dummy'
require_relative '../../../config/initializers/sentry'

describe API::Helpers do
  include API::APIGuard::HelperMethods
  include described_class
  include SentryHelper
  include TermsHelper

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:key) { create(:key, user: user) }

  let(:csrf_token) { SecureRandom.base64(ActionController::RequestForgeryProtection::AUTHENTICITY_TOKEN_LENGTH) }
  let(:env) do
    {
      'rack.input' => '',
      'rack.session' => {
        _csrf_token: csrf_token
      },
      'REQUEST_METHOD' => 'GET',
      'CONTENT_TYPE' => 'text/plain;charset=utf-8'
    }
  end
  let(:header) { }
  let(:request) { Grape::Request.new(env)}
  let(:params) { request.params }

  before do
    allow_any_instance_of(self.class).to receive(:options).and_return({})
  end

  def warden_authenticate_returns(value)
    warden = double("warden", authenticate: value)
    env['warden'] = warden
  end

  def error!(message, status, header)
    raise Exception.new("#{status} - #{message}")
  end

  def set_param(key, value)
    request.update_param(key, value)
  end

  describe ".current_user" do
    subject { current_user }

    describe "Warden authentication", :allow_forgery_protection do
      context "with invalid credentials" do
        context "GET request" do
          before do
            env['REQUEST_METHOD'] = 'GET'
          end

          it { is_expected.to be_nil }
        end
      end

      context "with valid credentials" do
        before do
          warden_authenticate_returns user
        end

        context "GET request" do
          before do
            env['REQUEST_METHOD'] = 'GET'
          end

          it { is_expected.to eq(user) }

          it 'sets the environment with data of the current user' 

        end

        context "HEAD request" do
          before do
            env['REQUEST_METHOD'] = 'HEAD'
          end

          it { is_expected.to eq(user) }
        end

        context "PUT request" do
          before do
            env['REQUEST_METHOD'] = 'PUT'
          end

          context 'without CSRF token' do
            it { is_expected.to be_nil }
          end

          context 'with CSRF token' do
            before do
              env['HTTP_X_CSRF_TOKEN'] = csrf_token
            end

            it { is_expected.to eq(user) }
          end
        end

        context "POST request" do
          before do
            env['REQUEST_METHOD'] = 'POST'
          end

          context 'without CSRF token' do
            it { is_expected.to be_nil }
          end

          context 'with CSRF token' do
            before do
              env['HTTP_X_CSRF_TOKEN'] = csrf_token
            end

            it { is_expected.to eq(user) }
          end
        end

        context "DELETE request" do
          before do
            env['REQUEST_METHOD'] = 'DELETE'
          end

          context 'without CSRF token' do
            it { is_expected.to be_nil }
          end

          context 'with CSRF token' do
            before do
              env['HTTP_X_CSRF_TOKEN'] = csrf_token
            end

            it { is_expected.to eq(user) }
          end
        end
      end
    end

    describe "when authenticating using a user's personal access tokens" do
      let(:personal_access_token) { create(:personal_access_token, user: user) }

      it "returns a 401 response for an invalid token" 


      it "returns a 403 response for a user without access" 


      it 'returns a 403 response for a user who is blocked' 


      context 'when terms are enforced' do
        before do
          enforce_terms
          env[Gitlab::Auth::UserAuthFinders::PRIVATE_TOKEN_HEADER] = personal_access_token.token
        end

        it 'returns a 403 when a user has not accepted the terms' 


        it 'sets the current user when the user accepted the terms' 

      end

      it "sets current_user" 


      it "does not allow tokens without the appropriate scope" 


      it 'does not allow revoked tokens' 


      it 'does not allow expired tokens' 

    end
  end

  describe '.handle_api_exception' do
    before do
      allow_any_instance_of(self.class).to receive(:sentry_enabled?).and_return(true)
      allow_any_instance_of(self.class).to receive(:rack_response)
    end

    it 'does not report a MethodNotAllowed exception to Sentry' 


    it 'does report RuntimeError to Sentry' 


    context 'with a personal access token given' do
      let(:token) { create(:personal_access_token, scopes: ['api'], user: user) }

      # Regression test for https://gitlab.com/gitlab-org/gitlab-ce/issues/38571
      it 'does not raise an additional exception because of missing `request`' 

    end

    context 'extra information' do
      # Sentry events are an array of the form [auth_header, data, options]
      let(:event_data) { Raven.client.transport.events.first[1] }

      before do
        stub_application_setting(
          sentry_enabled: true,
          sentry_dsn: "dummy://12345:67890@sentry.localdomain/sentry/42"
        )
        configure_sentry
        Raven.client.configuration.encoding = 'json'
      end

      it 'sends the params, excluding confidential values' 

    end
  end

  describe '.authenticate_non_get!' do
    %w[HEAD GET].each do |method_name|
      context "method is #{method_name}" do
        before do
          expect_any_instance_of(self.class).to receive(:route).and_return(double(request_method: method_name))
        end

        it 'does not raise an error' 

      end
    end

    %w[POST PUT PATCH DELETE].each do |method_name|
      context "method is #{method_name}" do
        before do
          expect_any_instance_of(self.class).to receive(:route).and_return(double(request_method: method_name))
        end

        it 'calls authenticate!' 

      end
    end
  end

  describe '.authenticate!' do
    context 'current_user is nil' do
      before do
        expect_any_instance_of(self.class).to receive(:current_user).and_return(nil)
      end

      it 'returns a 401 response' 

    end

    context 'current_user is present' do
      let(:user) { build(:user) }

      before do
        expect_any_instance_of(self.class).to receive(:current_user).and_return(user)
      end

      it 'does not raise an error' 

    end
  end

  context 'sudo' do
    shared_examples 'successful sudo' do
      it 'sets current_user' 


      it 'sets sudo?' 

    end

    shared_examples 'sudo' do
      context 'when admin' do
        before do
          token.user = admin
          token.save!
        end

        context 'when token has sudo scope' do
          before do
            token.scopes = %w[sudo]
            token.save!
          end

          context 'when user exists' do
            context 'when using header' do
              context 'when providing username' do
                before do
                  env[API::Helpers::SUDO_HEADER] = user.username
                end

                it_behaves_like 'successful sudo'
              end

              context 'when providing username (case insensitive)' do
                before do
                  env[API::Helpers::SUDO_HEADER] = user.username.upcase
                end

                it_behaves_like 'successful sudo'
              end

              context 'when providing user ID' do
                before do
                  env[API::Helpers::SUDO_HEADER] = user.id.to_s
                end

                it_behaves_like 'successful sudo'
              end
            end

            context 'when using param' do
              context 'when providing username' do
                before do
                  set_param(API::Helpers::SUDO_PARAM, user.username)
                end

                it_behaves_like 'successful sudo'
              end

              context 'when providing username (case insensitive)' do
                before do
                  set_param(API::Helpers::SUDO_PARAM, user.username.upcase)
                end

                it_behaves_like 'successful sudo'
              end

              context 'when providing user ID' do
                before do
                  set_param(API::Helpers::SUDO_PARAM, user.id.to_s)
                end

                it_behaves_like 'successful sudo'
              end
            end
          end

          context 'when user does not exist' do
            before do
              set_param(API::Helpers::SUDO_PARAM, 'nonexistent')
            end

            it 'raises an error' 

          end
        end

        context 'when token does not have sudo scope' do
          before do
            token.scopes = %w[api]
            token.save!

            set_param(API::Helpers::SUDO_PARAM, user.id.to_s)
          end

          it 'raises an error' 

        end
      end

      context 'when not admin' do
        before do
          token.user = user
          token.save!

          set_param(API::Helpers::SUDO_PARAM, user.id.to_s)
        end

        it 'raises an error' 

      end
    end

    context 'using an OAuth token' do
      let(:token) { create(:oauth_access_token) }

      before do
        env['HTTP_AUTHORIZATION'] = "Bearer #{token.token}"
      end

      it_behaves_like 'sudo'
    end

    context 'using a personal access token' do
      let(:token) { create(:personal_access_token) }

      context 'passed as param' do
        before do
          set_param(Gitlab::Auth::UserAuthFinders::PRIVATE_TOKEN_PARAM, token.token)
        end

        it_behaves_like 'sudo'
      end

      context 'passed as header' do
        before do
          env[Gitlab::Auth::UserAuthFinders::PRIVATE_TOKEN_HEADER] = token.token
        end

        it_behaves_like 'sudo'
      end
    end

    context 'using warden authentication' do
      before do
        warden_authenticate_returns admin
        env[API::Helpers::SUDO_HEADER] = user.username
      end

      it 'raises an error' 

    end
  end
end

