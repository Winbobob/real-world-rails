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

  end

  context 'Google Oauth2' do
    before do
      SiteSetting.enable_google_oauth2_logins = true
    end

    context "without an `omniauth.auth` env" do
      it "should return a 404" 

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

