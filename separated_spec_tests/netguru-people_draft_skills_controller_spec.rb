require 'spec_helper'

describe DraftSkillsController do
  let(:admin_user) { create(:user, :admin) }
  let(:draft_skill) { create(:draft_skill) }

  before { sign_in(admin_user) }

  describe '#index' do
    subject { get :index }
    it 'renders correct template' 

  end

  describe '#show' do
    subject { get :show, id: draft_skill.id }
    it 'renders correct template' 

  end

  describe '#edit' do
    subject { get :edit, id: draft_skill.id }

    context 'when user is requester' do
      let(:draft_skill) { create(:draft_skill, requester: admin_user) }

      it 'redirects to root_path' 

    end

    context 'when user is not requester' do
      it 'renders correct template' 

    end
  end

  describe '#update' do
    subject { put :update, params }
    let(:params) do
      {
        id: draft_skill.id,
        draft_skill: {
          reviewer_explanation: 'test explanation',
          draft_status: 'accepted'
        }
      }
    end
    let(:draft_skill_updater) { instance_double('::DraftSkills::Update') }
    let(:draft_skill) { create(:draft_skill) }

    before do
      allow(
        DraftSkills::Update
      ).to receive(:new).and_return(draft_skill_updater)
    end

    it 'executes draft skill updater' 


    context 'when is valid' do
      before do
        allow(
          draft_skill_updater
        ).to receive(:call).and_return(true)
      end

      it 'renders correct template' 

    end

    context 'when is not valid' do
      before do
        allow(
          draft_skill_updater
        ).to receive(:call).and_return(false)
      end

      it 'renders correct template' 

    end
  end
end

