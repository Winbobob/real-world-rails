require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController do
  let(:user) { Fabricate(:user) }

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] = nil
    OmniAuth.config.test_mode = false
  end

  describe ".find_authenticator" do
    it "fails if a provider is disabled" 


    it "fails for unknown" 


    it "finds an authenticator when enabled" 


    context "with a plugin-contributed auth provider" do

      let :provider do
        provider = Auth::AuthProvider.new
        provider.authenticator = Class.new(Auth::Authenticator) do
          def name
            'ubuntu'
          end

          def enabled?
            SiteSetting.ubuntu_login_enabled
          end
        end.new

        provider.enabled_setting = "ubuntu_login_enabled"
        provider
      end

      before do
        DiscoursePluginRegistry.register_auth_provider(provider)
      end

      after do
        DiscoursePluginRegistry.reset!
      end

      it "finds an authenticator when enabled" 


      it "fails if an authenticator is disabled" 

    end
  end

  context 'Google Oauth2' do
    before do
      SiteSetting.enable_google_oauth2_logins = true
    end

    context "without an `omniauth.auth` env" do
      it "should return a 404" 

    end

    describe 'when user not found' do
      let(:email) { "somename@gmail.com" }
      before do
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: 'google_oauth2',
          uid: '123545',
          info: OmniAuth::AuthHash::InfoHash.new(
            email: email,
            name: 'Some name'
          ),
          extra: {
            raw_info: OmniAuth::AuthHash.new(
              email_verified: true,
              email: email,
              family_name: 'Huh',
              given_name: "Some name",
              gender: 'male',
              name: "Some name Huh",
            )
          },
        )

        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      end

      it 'should return the right response' 


      it 'should include destination url in response' 

    end

    describe 'when user has been verified' do
      before do
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: 'google_oauth2',
          uid: '123545',
          info: OmniAuth::AuthHash::InfoHash.new(
            email: user.email,
            name: 'Some name'
          ),
          extra: {
            raw_info: OmniAuth::AuthHash.new(
              email_verified: true,
              email: user.email,
              family_name: 'Huh',
              given_name: user.name,
              gender: 'male',
              name: "#{user.name} Huh",
            )
          },
        )

        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      end

      it 'should return the right response' 


      it "should confirm email even when the tokens are expired" 


      it "should activate/unstage staged user" 


      context 'when user has second factor enabled' do
        before do
          user.create_totp(enabled: true)
        end

        it 'should return the right response' 

      end

      context 'when sso_payload cookie exist' do
        before do
          SiteSetting.enable_sso_provider = true
          SiteSetting.sso_secret = "topsecret"

          @sso = SingleSignOn.new
          @sso.nonce = "mynonce"
          @sso.sso_secret = SiteSetting.sso_secret
          @sso.return_sso_url = "http://somewhere.over.rainbow/sso"
          cookies[:sso_payload] = @sso.payload

          GoogleUserInfo.create!(google_user_id: '12345', user: user)

          OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
            provider: 'google_oauth2',
            uid: '12345',
            info: OmniAuth::AuthHash::InfoHash.new(
              email: 'someother_email@test.com',
              name: 'Some name'
            ),
            extra: {
              raw_info: OmniAuth::AuthHash.new(
                email_verified: true,
                email: 'someother_email@test.com',
                family_name: 'Huh',
                given_name: user.name,
                gender: 'male',
                name: "#{user.name} Huh",
              )
            },
          )

          Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
        end

        it 'should return the right response' 

      end

      context 'when user has not verified his email' do
        before do
          GoogleUserInfo.create!(google_user_id: '12345', user: user)
          user.update!(active: false)

          OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
            provider: 'google_oauth2',
            uid: '12345',
            info: OmniAuth::AuthHash::InfoHash.new(
              email: 'someother_email@test.com',
              name: 'Some name'
            ),
            extra: {
              raw_info: OmniAuth::AuthHash.new(
                email_verified: true,
                email: 'someother_email@test.com',
                family_name: 'Huh',
                given_name: user.name,
                gender: 'male',
                name: "#{user.name} Huh",
              )
            },
          )

          Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
        end

        it 'should return the right response' 

      end
    end

    context 'after changing email' do
      require_dependency 'email_updater'

      def login(identity)
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: 'google_oauth2',
          uid: "123545#{identity[:username]}",
          info: OmniAuth::AuthHash::InfoHash.new(
            email: identity[:email],
            name: 'Some name'
          ),
          extra: {
            raw_info: OmniAuth::AuthHash.new(
              email_verified: true,
              email: identity[:email],
              family_name: 'Huh',
              given_name: identity[:name],
              gender: 'male',
              name: "#{identity[:name]} Huh",
            )
          },
        )

        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        get "/auth/google_oauth2/callback.json"
        expect(response.status).to eq(200)
        JSON.parse(response.body)
      end

      it 'activates the correct email' 

    end
  end
end

