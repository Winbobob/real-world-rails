require 'spec_helper'

describe DraftSkills::Create do
  subject do
    described_class.new(
      params: params,
      type: draft_type,
      user: user,
      skill: skill
    )
  end
  let(:user) { create(:user) }
  let(:skill_category) { create(:skill_category) }
  let(:params) do
    {
      name: 'Git',
      description: 'Github tool',
      rate_type: 'boolean',
      skill_category_id: skill_category.id,
      requester_explanation: 'Everyone should know this'
    }
  end
  let(:skill) { create(:skill) }
  let(:draft_type) { 'create' }
  let(:draft_status) { 'created' }

  describe '#initialize' do
    context 'when type is create' do
      let(:draft_type) { 'create' }
      let(:expected_draft_skill) { subject.draft_skill }
      let(:skill) { nil }

      it 'initializez draft_skill with correct attributes' 

    end
    context 'when type is update' do
      let(:draft_type) { 'update' }
      let(:expected_draft_skill) { subject.draft_skill }

      it 'initializes draft_skill with correct attributes' 

    end
  end

  describe '#valid?' do
    context 'when is valid' do
      it { expect(subject.valid?).to eq(true) }
    end
    context 'when is invalid' do
      let(:params) do
        {
          name: 'Git',
          description: 'Github tool',
          rate_type: 'boolean',
          skill_category_id: skill_category.id,
          requester_explanation: ''
        }
      end

      it { expect(subject.valid?).to eq(false) }
    end
  end

  describe '#errors' do
    context 'when is valid' do
      it { expect(subject.errors).to be_blank }
    end
    context 'when is invalid' do
      let(:params) do
        {
          name: 'Git',
          description: 'Github tool',
          rate_type: 'boolean',
          skill_category_id: skill_category.id,
          requester_explanation: ''
        }
      end
      it { expect(subject.errors).to_not be_blank }
      it { expect(subject.errors[:requester_explanation]).to include('can\'t be blank') }
    end
  end

  describe 'save!' do
    context 'when is valid' do
      it 'saves draft_skill object' 

    end
    context 'when is invalid' do
      let(:params) do
        {
          name: 'Git',
          description: 'Github tool',
          rate_type: 'boolean',
          skill_category_id: skill_category.id,
          requester_explanation: ''
        }
      end
      it 'does not save draft_skill object' 

    end
  end
end

