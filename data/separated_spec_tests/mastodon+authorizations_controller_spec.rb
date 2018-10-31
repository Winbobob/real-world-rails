# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Oauth::AuthorizationsController, type: :controller do
  render_views

  let(:app) { Doorkeeper::Application.create!(name: 'test', redirect_uri: 'http://localhost/', scopes: 'read') }

  describe 'GET #new' do
    subject do
      get :new, params: { client_id: app.uid, response_type: 'code', redirect_uri: 'http://localhost/', scope: 'read' }
    end

    shared_examples 'stores location for user' do
      it 'stores location for user' 

    end

    context 'when signed in' do
      let!(:user) { Fabricate(:user) }

      before do
        sign_in user, scope: :user
      end

      it 'returns http success' 


      it 'gives options to authorize and deny' 


      include_examples 'stores location for user'

      context 'when app is already authorized' do
        before do
          Doorkeeper::AccessToken.find_or_create_for(
            app,
            user.id,
            app.scopes,
            Doorkeeper.configuration.access_token_expires_in,
            Doorkeeper.configuration.refresh_token_enabled?
          )
        end

        it 'redirects to callback' 


        it 'does not redirect to callback with force_login=true' 

      end
    end

    context 'when not signed in' do
      it 'redirects' 


      include_examples 'stores location for user'
    end
  end
end

