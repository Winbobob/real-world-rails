require 'spec_helper'

describe Api::V2::SkillsController do
  describe 'GET #index' do
    let(:token) { AppConfig.api_token }
    let!(:skill1) { create(:skill, name: 'ruby') }
    let!(:skill2) { create(:skill, name: 'rails') }

    context 'without api token' do
      it 'returns response status 403' 

    end

    context 'with api token' do
      before { get :index, token: token }

      it { expect(response.status).to eq(200) }
      it { expect(json_response.length).to eq(2) }
    end
  end
end

