require 'spec_helper'

describe NoteSummary do
  let(:project)  { build(:project) }
  let(:noteable) { build(:issue) }
  let(:user)     { build(:user) }

  def create_note_summary
    described_class.new(noteable, project, user, 'note', action: 'icon', commit_count: 5)
  end

  describe '#metadata?' do
    it 'returns true when metadata present' 


    it 'returns false when metadata not present' 

  end

  describe '#note' do
    it 'returns note hash' 


    context 'when noteable is a commit' do
      let(:noteable) { build(:commit) }

      it 'returns note hash specific to commit' 

    end
  end

  describe '#metadata' do
    it 'returns metadata hash' 

  end
end

