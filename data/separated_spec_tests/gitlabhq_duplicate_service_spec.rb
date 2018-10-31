require 'spec_helper'

describe Issues::DuplicateService do
  let(:user) { create(:user) }
  let(:canonical_project) { create(:project) }
  let(:duplicate_project) { create(:project) }

  let(:canonical_issue) { create(:issue, project: canonical_project) }
  let(:duplicate_issue) { create(:issue, project: duplicate_project) }

  subject { described_class.new(duplicate_project, user, {}) }

  describe '#execute' do
    context 'when the issues passed are the same' do
      it 'does nothing' 

    end

    context 'when the user cannot update the duplicate issue' do
      before do
        canonical_project.add_reporter(user)
      end

      it 'does nothing' 

    end

    context 'when the user cannot comment on the canonical issue' do
      before do
        duplicate_project.add_reporter(user)
      end

      it 'does nothing' 

    end

    context 'when the user can mark the issue as a duplicate' do
      before do
        canonical_project.add_reporter(user)
        duplicate_project.add_reporter(user)
      end

      it 'closes the duplicate issue' 


      it 'adds a system note to the duplicate issue' 


      it 'adds a system note to the canonical issue' 

    end
  end
end

