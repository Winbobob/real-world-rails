require 'spec_helper'

describe Gitlab::Diff::FileCollection::MergeRequestDiff do
  let(:merge_request) { create(:merge_request) }
  let(:diff_files) { described_class.new(merge_request.merge_request_diff, diff_options: nil).diff_files }

  it 'does not highlight binary files' 


  it 'does not highlight files marked as undiffable in .gitattributes' 


  shared_examples 'initializes a DiffCollection' do
    it 'returns a valid instance of a DiffCollection' 

  end

  context 'with Gitaly disabled', :disable_gitaly do
    it_behaves_like 'initializes a DiffCollection'
  end

  context 'with Gitaly enabled' do
    it_behaves_like 'initializes a DiffCollection'
  end
end

