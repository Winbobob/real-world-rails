require 'spec_helper'

describe Api::V3::TeamsController do
  describe 'GET #index' do
    subject { get :index, params }

    let(:token) { AppConfig.api_token }
    let(:params) { { token: token } }

    let!(:team_1) { create(:team) }
    let!(:team_2) { create(:team) }

    before { subject }
    it { expect(response.status).to eq(200) }

    it 'returns correct values' 

  end
end

