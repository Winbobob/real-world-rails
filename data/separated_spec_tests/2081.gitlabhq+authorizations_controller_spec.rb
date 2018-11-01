require 'spec_helper'

describe Oauth::AuthorizationsController do
  let(:user) { create(:user) }
  let!(:application) { create(:oauth_application, scopes: 'api read_user', redirect_uri: 'http://example.com') }
  let(:params) do
    {
      response_type: "code",
      client_id: application.uid,
      redirect_uri: application.redirect_uri,
      state: 'state'
    }
  end

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    context 'without valid params' do
      it 'returns 200 code and renders error view' 

    end

    context 'with valid params' do
      render_views

      it 'returns 200 code and renders view' 


      it 'deletes session.user_return_to and redirects when skip authorization' 


      context 'when there is already an access token for the application' do
        context 'when the request scope matches any of the created token scopes' do
          before do
            scopes = Doorkeeper::OAuth::Scopes.from_string('api')

            allow(Doorkeeper.configuration).to receive(:scopes).and_return(scopes)

            create :oauth_access_token, application: application, resource_owner_id: user.id, scopes: scopes
          end

          it 'authorizes the request and redirects' 

        end
      end
    end
  end
end

