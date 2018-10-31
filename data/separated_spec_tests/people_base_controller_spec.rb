require 'spec_helper'

describe Api::V3::BaseController do
  render_views

  controller(described_class) do
    def index
      render text: 'nothing'
    end
  end

  describe '#authenticate_api' do

    context 'when token is specified' do
      context 'with valid token' do
        it 'will not call render' 

      end

      context 'with invalid token' do
        it 'calls render with 403 status' 

      end
    end

    context 'when token is not specified' do
      let(:user) { create(:user) }
      context 'when current_user exists' do
        before { sign_in(user) }

        it 'will not call render' 

      end

      context 'when current_user does not exist' do
        before do
          request.headers["X-Email"] = email
          request.headers["X-Api-Token"] = api_token
          get :index
        end
        let(:user) { create(:user) }
        let(:api_token) { user.api_token }
        let(:email) { user.email }

        context 'when api_token and email are correct' do
          it { expect(response.status).to eq(200) }
        end

        context 'when api_token and email are incorrect' do
          let(:api_token) { 'incorrect' }
          it { expect(response.status).to eq(403) }
        end
      end
    end
  end
end

