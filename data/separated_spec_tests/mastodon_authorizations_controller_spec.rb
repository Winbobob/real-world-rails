# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Oauth::AuthorizationsController, type: :controller do
  render_views

  let(:app) { Doorkeeper::Application.create!(name: 'test', redirect_uri: 'http://localhost/') }

  describe 'GET #new' do
    subject do
      get :new, params: { client_id: app.uid, response_type: 'code', redirect_uri: 'http://localhost/' }
    end

    shared_examples 'stores location for user' do
      it 'stores location for user' 

    end

    context 'when signed in' do
      before do
        sign_in Fabricate(:user), scope: :user
      end

      it 'returns http success' 


      it 'gives options to authorize and deny' 


      include_examples 'stores location for user'
    end

    context 'when not signed in' do
      it 'redirects' 


      include_examples 'stores location for user'
    end
  end
end

