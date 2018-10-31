require 'spec_helper'

describe MergeRequests::MergeRequestDiffCacheService, :use_clean_rails_memory_store_caching do
  let(:subject) { described_class.new }
  let(:merge_request) { create(:merge_request) }

  describe '#execute' do
    before do
      allow_any_instance_of(Gitlab::Diff::File).to receive(:text?).and_return(true)
      allow_any_instance_of(Gitlab::Diff::File).to receive(:diffable?).and_return(true)
    end

    it 'retrieves the diff files to cache the highlighted result' 


    it 'clears the cache for older diffs on the merge request' 

  end
end

