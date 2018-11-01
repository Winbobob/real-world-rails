require 'spec_helper'

describe SkillsController do
  let(:admin_user) { create(:user, :admin) }
  let(:skill) { create(:skill, name: 'Git') }

  before { sign_in(admin_user) }

  describe '#index' do
    subject { get :index }
    it 'renders correct template' 

  end

  describe '#new' do
    subject { get :new }
    it 'renders correct template' 

  end

  describe '#show' do
    subject { get :show, id: skill.id }
    it 'renders correct template' 

  end

  describe '#edit' do
    subject { get :edit, id: skill.id }

    context 'when request for change already exists' do
      let(:skill) { create(:skill, :with_awaiting_change_request) }

      it 'redirects to root_path' 

    end

    context 'when request for change does not exist' do
      it 'renders correct template' 

    end
  end

  describe '#create' do
    subject { post :create, params }
    let(:params) do
      {
        skill: {
          description: 'test',
          rate_type: 'boolean',
          skill_category_id: skill.skill_category.id,
          requester_explanation: admin_user,
          name: 'Ruby'
        }
      }
    end
    let(:change_requester) { instance_double('::Skills::ChangeRequester') }
    let(:draft_skill) { create(:draft_skill) }

    before do
      allow(
        Skills::ChangeRequester
      ).to receive(:new).and_return(change_requester)
    end

    it 'executes change requester' 


    context 'when is valid' do
      before do
        allow(
          change_requester
        ).to receive(:request).with(type: 'create').and_return(true)
        allow(
          change_requester
        ).to receive(:draft_skill).and_return(draft_skill)
      end

      it 'renders correct template' 

    end

    context 'when is not valid' do
      before do
        allow(
          change_requester
        ).to receive(:request).with(type: 'create').and_return(false)
      end

      it 'renders correct template' 

    end
  end

  describe '#update' do
    subject { put :update, params }
    let(:params) do
      {
        id: skill.id,
        skill: {
          description: 'test',
          rate_type: 'boolean',
          skill_category_id: skill.skill_category.id,
          requester_explanation: admin_user,
          name: 'Ruby'
        }
      }
    end
    let(:change_requester) { instance_double('::Skills::ChangeRequester') }
    let(:draft_skill) { create(:draft_skill) }

    before do
      allow(
        Skills::ChangeRequester
      ).to receive(:new).and_return(change_requester)
    end

    it 'executes change requester' 


    context 'when request for change already exists' do
      let(:skill) { create(:skill, :with_awaiting_change_request) }

      it 'redirects to root_path' 

    end

    context 'when request for change does not exist' do
      context 'when is valid' do
        before do
          allow(
            change_requester
          ).to receive(:request).with(type: 'update').and_return(true)
          allow(
            change_requester
          ).to receive(:draft_skill).and_return(draft_skill)
        end

        it 'renders correct template' 

      end

      context 'when is not valid' do
        before do
          allow(
            change_requester
          ).to receive(:request).with(type: 'update').and_return(false)
        end

        it 'renders correct template' 

      end
    end
  end
end

