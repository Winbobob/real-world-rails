require 'spec_helper'

describe AwardEmojiHelper do
  describe '.toggle_award_url' do
    context 'note on personal snippet' do
      let(:note) { create(:note_on_personal_snippet) }

      it 'returns correct url' 

    end

    context 'note on project item' do
      let(:note) { create(:note_on_project_snippet) }

      it 'returns correct url' 

    end

    context 'personal snippet' do
      let(:snippet) { create(:personal_snippet) }

      it 'returns correct url' 

    end

    context 'merge request' do
      let(:merge_request) { create(:merge_request) }

      it 'returns correct url' 

    end

    context 'issue' do
      let(:issue) { create(:issue) }

      it 'returns correct url' 

    end
  end
end

