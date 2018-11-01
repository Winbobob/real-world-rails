require 'spec_helper'

describe MergeRequests::DeleteNonLatestDiffsService, :clean_gitlab_redis_shared_state do
  let(:merge_request) { create(:merge_request) }

  let!(:subject) { described_class.new(merge_request) }

  describe '#execute' do
    before do
      stub_const("#{described_class.name}::BATCH_SIZE", 2)

      3.times { merge_request.create_merge_request_diff }
    end

    it 'schedules non-latest merge request diffs removal' 


    it 'schedules no removal if it is already cleaned' 


    it 'schedules no removal if it is empty' 


    it 'schedules no removal if there is no non-latest diffs' 

  end
end

