require 'spec_helper'

describe DraftSkills::Update do
  subject { described_class.new(draft_skill, draft_skill_params).call }
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(Salesforce::GenericRepository).to receive(:sync)
  end

  shared_examples 'updates draft_skill' do
    it 'sets reviewer data' 

  end
  
  shared_examples 'does not update the skill' do
    it { expect { subject }.to_not change { skill.name } }
    it { expect { subject }.to_not change { skill.description } }
    it { expect { subject }.to_not change { skill.rate_type } }
    it { expect { subject }.to_not change { skill.skill_category_id } }
  end

  describe '#call' do
    context 'when params are valid' do
      let(:draft_skill_params) do
        {
          reviewer_explanation: 'Trust me, you want this.',
          reviewer_id: user.id,
          draft_status: draft_status
        }
      end

      context 'when draft_skill is create type' do
        let(:draft_skill) { create(:draft_skill, :with_create_draft_type) }

        context 'when draft_status equals accepted' do
          before do
            allow(
              CreateRatesForSkillJob
            ).to receive(:perform_async).and_return(true)
          end

          let(:draft_status) { 'accepted' }

          it 'creates skill' 


          it 'sets attributes form draft_skill to skill' 


          it 'generates base user_skill_rates' 


          include_examples 'updates draft_skill'
        end

        context 'when draft_status equals declined' do
          let(:draft_status) { 'declined' }

          it 'does not create new skill' 


          it 'sets reviewer data on draft_skill' 

        end
      end

      context 'when draft_skill is update type' do
        let(:old_skill_category) { create(:skill_category) }
        let(:new_skill_category) { create(:skill_category) }
        let(:skill) do
          create(
            :skill,
            name: 'ruby',
            description: 'language',
            skill_category_id: old_skill_category.id,
            rate_type: 'boolean'
          )
        end
        let(:draft_skill) do
          create(
            :draft_skill,
            name: 'Ruby on Rails',
            description: 'Framework for Ruby',
            skill_category_id: new_skill_category.id,
            rate_type: 'range',
            draft_status: 'created',
            draft_type: 'update',
            skill_id: skill.id
          )
        end

        context 'when draft_status equals accepted' do
          let(:draft_status) { 'accepted' }

          include_examples 'updates draft_skill'

          it do expect { subject }.to change {
            skill.reload.name }.to(draft_skill.name)
          end
          it do
            expect { subject }.to change {
              skill.reload.description
            }.to(draft_skill.description)
          end
          it do
            expect { subject }.to change {
              skill.reload.rate_type
            }.to(draft_skill.rate_type)
          end
          it do
            expect { subject }.to change {
              skill.reload.skill_category_id
            }.to(draft_skill.skill_category_id)
          end
        end

        context 'when draft_status equals declined' do
          let(:draft_status) { 'declined' }

          it 'sets reviewer data on draft_skill' 


          include_examples 'does not update the skill'
        end
      end

      context 'when draft_skill is delete type' do
        let!(:skill) { create(:skill, marked_for_delete: true) }
        let(:draft_skill) do
          create(
            :draft_skill,
            draft_status: 'created',
            draft_type: 'delete',
            marked_for_delete: true,
            skill_id: skill.id
          )
        end

        context 'when draft_status equals accepted' do
          let(:draft_status) { 'accepted' }

          it 'destroys draft skill\'s association with the skill' 


          it 'deletes the skill' 


          include_examples 'updates draft_skill'
        end

        context 'when draft_status equals declined' do
          let(:draft_status) { 'declined' }

          it 'does not delete the skill' 


          include_examples 'updates draft_skill'
          include_examples 'does not update the skill'
        end
      end
    end

    context 'when params are invalid' do
      let(:draft_skill_params) do
        {
          reviewer_explanation: '',
          reviewer_id: user.id,
          draft_status: 'accepted'
        }
      end
      let(:draft_skill) { create(:draft_skill) }

      it { expect(subject).to eq false }

      it 'sets errors on draft_skill' 

    end
  end
end

