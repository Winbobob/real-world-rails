require 'spec_helper'

describe Gitlab::Auth::UserAuthFinders do
  include described_class

  let(:user) { create(:user) }
  let(:env) do
    {
      'rack.input' => ''
    }
  end
  let(:request) { Rack::Request.new(env)}

  def set_param(key, value)
    request.update_param(key, value)
  end

  describe '#find_user_from_warden' do
    context 'with CSRF token' do
      before do
        allow(Gitlab::RequestForgeryProtection).to receive(:verified?).and_return(true)
      end

      context 'with invalid credentials' do
        it 'returns nil' 

      end

      context 'with valid credentials' do
        it 'returns the user' 

      end
    end

    context 'without CSRF token' do
      it 'returns nil' 

    end
  end

  describe '#find_user_from_feed_token' do
    context 'when the request format is atom' do
      before do
        env['HTTP_ACCEPT'] = 'application/atom+xml'
      end

      context 'when feed_token param is provided' do
        it 'returns user if valid feed_token' 


        it 'returns nil if feed_token is blank' 


        it 'returns exception if invalid feed_token' 

      end

      context 'when rss_token param is provided' do
        it 'returns user if valid rssd_token' 


        it 'returns nil if rss_token is blank' 


        it 'returns exception if invalid rss_token' 

      end
    end

    context 'when the request format is not atom' do
      it 'returns nil' 

    end

    context 'when the request format is empty' do
      it 'the method call does not modify the original value' 

    end
  end

  describe '#find_user_from_access_token' do
    let(:personal_access_token) { create(:personal_access_token, user: user) }

    it 'returns nil if no access_token present' 


    context 'when validate_access_token! returns valid' do
      it 'returns user' 


      it 'returns exception if token has no user' 

    end
  end

  describe '#find_personal_access_token' do
    let(:personal_access_token) { create(:personal_access_token, user: user) }

    context 'passed as header' do
      it 'returns token if valid personal_access_token' 

    end

    context 'passed as param' do
      it 'returns token if valid personal_access_token' 

    end

    it 'returns nil if no personal_access_token' 


    it 'returns exception if invalid personal_access_token' 

  end

  describe '#find_oauth_access_token' do
    let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'https://app.com', owner: user) }
    let(:token) { Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: user.id, scopes: 'api') }

    context 'passed as header' do
      it 'returns token if valid oauth_access_token' 

    end

    context 'passed as param' do
      it 'returns user if valid oauth_access_token' 

    end

    it 'returns nil if no oauth_access_token' 


    it 'returns exception if invalid oauth_access_token' 

  end

  describe '#validate_access_token!' do
    let(:personal_access_token) { create(:personal_access_token, user: user) }

    it 'returns nil if no access_token present' 


    context 'token is not valid' do
      before do
        allow_any_instance_of(described_class).to receive(:access_token).and_return(personal_access_token)
      end

      it 'returns Gitlab::Auth::ExpiredError if token expired' 


      it 'returns Gitlab::Auth::RevokedError if token revoked' 


      it 'returns Gitlab::Auth::InsufficientScopeError if invalid token scope' 

    end
  end
end

