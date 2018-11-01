require 'spec_helper'

describe OmniauthCallbacksController do
  before(:all) { OmniAuth.config.test_mode = true }

  describe '#google_oauth2' do
    let(:callback) { get :google_oauth2 }
    let(:internal_domain) { AppConfig.emails.internal }

    before do
      OmniAuth.config.add_mock(
        :google_oauth2, {
          info: {
            first_name: 'Jan',
            last_name: 'Kowalski',
            email: "jan@#{internal_domain}"
          },
          extra: { raw_info: { hd: internal_domain } },
          credentials: {
            oauth_token: 123,
            refresh_token: 456,
            oauth_expires_at: Time.now + 1.hour
          }
        }
      )
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
      allow_any_instance_of(Apiguru::ListUsers).to receive(:call).and_return []
    end

    context 'user is internal' do
      it 'signs up user' 


      it 'signs in user' 


      it 'redirects to root path' 

    end

    context 'user is not internal' do
      before do
        request.env['omniauth.auth'][:extra][:raw_info][:hd] = 'another_example.com'
      end

      it "doesn't signs up user" 


      it "doesn't signs in user" 


      it 'redirects to root path' 

    end
  end

  describe '#github' do
    let(:callback) { get :github }
    let(:user) { create(:user, gh_nick: nil) }

    before do
      OmniAuth.config.add_mock(:github, { info: { nickname: 'xyz' } })
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    end

    context 'user has signed up' do
      before { sign_in user }

      it 'updates github nickname' 


      it 'redirects to root path' 

    end

    context 'user has not signed up' do
      it 'not updates github nickname' 

    end
  end
end

