require 'spec_helper'

describe Gitlab::Conflict::FileCollection do
  let(:merge_request) { create(:merge_request, source_branch: 'conflict-resolvable', target_branch: 'conflict-start') }
  let(:file_collection) { described_class.new(merge_request) }

  describe '#files' do
    it 'returns an array of Conflict::Files' 

  end

  describe '#cache' do
    it 'specifies a custom namespace with the merge request commit ids' 

  end

  describe '#can_be_resolved_in_ui?' do
    it 'returns true if conflicts for this collection can be resolved in the UI' 


    it "returns false if conflicts for this collection can't be resolved in the UI" 


    it 'caches the result' 

  end

  describe '#default_commit_message' do
    it 'matches the format of the git CLI commit message' 

  end
end

