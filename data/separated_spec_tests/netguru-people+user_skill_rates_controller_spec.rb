require 'spec_helper'

describe UserSkillRatesController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    allow_any_instance_of(UserSkillRatesController).to receive(:sync_skill_rate_with_salesforce)
  end

  describe '#index' do
    let(:skill_category_backend) { create(:skill_category, name: 'backend') }
    let(:skill_category_frontend) { create(:skill_category, name: 'frontend') }
    let(:skill_backend) { create(:skill, skill_category: skill_category_backend) }
    let(:skill_frontend) { create(:skill, skill_category: skill_category_frontend) }
    let!(:user_skill_rate_backend) { create(:user_skill_rate, user: user, skill: skill_backend ) }
    let!(:user_skill_rate_frontend) { create(:user_skill_rate, user: user, skill: skill_frontend ) }

    subject { get :index }

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes user skill rates grouped by category' 


    it 'renders index view' 

  end

  describe '#update' do
    subject do
      put :update, id: user_skill_rate.id, user_skill_rate: params, format: :json
    end

    let(:params) {
      {
        id: user_skill_rate.id,
        note: 'def',
        rate: 1,
        favorite: true
      }
    }

    context 'when user_skill_rate is current_user' do
      let(:user_skill_rate) do
        create(:user_skill_rate, note: 'abc', rate: 0, favorite: false, user: user)
      end

      it 'updates note on user rate skill' 


      it 'updates favorite on user rate skill' 


      it 'updates favorite on user favorite skill' 


      it 'responds successfully with an HTTP 204 status code' 

    end

    context 'when user_skill_rate is not current_user' do
      let(:different_user) { create(:user) }
      let(:user_skill_rate) do
        create(:user_skill_rate, note: 'abc', rate: 0, favorite: false, user: different_user)
      end

      it 'responds with 302' 

    end
  end
  end

