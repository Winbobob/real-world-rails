require 'rails_helper'

describe Api::V1::Apps::CredentialsController do
  render_views

  let(:token) { Fabricate(:accessible_access_token, scopes: 'read', application: Fabricate(:application)) }

  context 'with an oauth token' do
    before do
      allow(controller).to receive(:doorkeeper_token) { token }
    end

    describe 'GET #show' do
      before do
        get :show
      end

      it 'returns http success' 


      it 'does not contain client credentials' 

    end
  end

  context 'without an oauth token' do
    before do
      allow(controller).to receive(:doorkeeper_token) { nil }
    end

    describe 'GET #show' do
      it 'returns http unauthorized' 

    end
  end
end
