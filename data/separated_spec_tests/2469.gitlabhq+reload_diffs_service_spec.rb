require 'spec_helper'

describe MergeRequests::ReloadDiffsService, :use_clean_rails_memory_store_caching do
  let(:current_user) { create(:user) }
  let(:merge_request) { create(:merge_request) }
  let(:subject) { described_class.new(merge_request, current_user) }

  describe '#execute' do
    it 'creates new merge request diff' 


    it 'calls update_diff_discussion_positions with correct params' 


    it 'does not change existing merge request diff' 


    context 'cache clearing' do
      before do
        allow_any_instance_of(Gitlab::Diff::File).to receive(:text?).and_return(true)
        allow_any_instance_of(Gitlab::Diff::File).to receive(:diffable?).and_return(true)
      end

      it 'retrieves the diff files to cache the highlighted result' 


      it 'clears the cache for older diffs on the merge request' 

    end
  end
end

