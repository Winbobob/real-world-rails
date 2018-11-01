require 'spec_helper'

describe Api::V3::UserSkillRatesController do
  describe 'GET #index' do

    subject { get :index, params }

    let(:skill_category) { create(:skill_category, name: 'backend') }
    let(:skill) { create(:skill, skill_category: skill_category) }
    let(:user_skill_rate) do
      create(:user_skill_rate, user: user, skill: skill )
    end
    let!(:user_skill_rate_content) do
      create(:user_skill_rate_content, user_skill_rate: user_skill_rate )
    end
    let(:user) { create(:user) }
    let(:token) { AppConfig.api_token }
    let(:params) do
      {
        token: token,
        category: 'backend',
        user_id: user.id
      }
    end

    before { subject }

    context 'when user_id is in params' do
      it { expect(response.status).to eq(200) }

      it 'returns correct values' 

    end

    context 'when user_id is missing in params' do
      let(:params) do
        {
          token: token,
          user_id: nil
        }
      end
      let(:expected_response) do
        { "error" => "Sorry, such user doesn't exist." }
      end

      it { expect(response.status).to eq(404) }
      it { expect(json_response).to eq(expected_response) }
    end
  end
end

