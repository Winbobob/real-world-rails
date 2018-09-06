require 'spec_helper'

describe IntegrationsController do
  describe 'create' do
    context 'when there is no user' do
      it 'creates an integration' 

    end

    describe 'when there is a user' do
      let(:user) { FactoryGirl.create(:user) }
      before :each do
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      end

      context 'when user is already signed in' do
        before do
          set_current_user(user)
        end
        it 'skips' 

      end

      it 'creates a new integration given a refresh token and access token' 

    end
  end

  describe 'failure' do
    it 'renders sessions new with a flash' 

  end
end

