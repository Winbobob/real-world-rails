require 'spec_helper'

describe Gitlab::BackgroundMigration::DeleteDiffFiles, :migration, :sidekiq, schema: 20180619121030 do
  describe '#perform' do
    context 'when diff files can be deleted' do
      let(:merge_request) { create(:merge_request, :merged) }
      let!(:merge_request_diff) do
        merge_request.create_merge_request_diff
        merge_request.merge_request_diffs.first
      end

      let(:perform) do
        described_class.new.perform(MergeRequestDiff.pluck(:id))
      end

      it 'deletes all merge request diff files' 


      it 'updates state to without_files' 


      it 'rollsback if something goes wrong' 

    end

    it 'reschedules itself when should_wait_deadtuple_vacuum' 

  end

  describe '#should_wait_deadtuple_vacuum?' do
    it 'returns true when hitting merge_request_diff_files hits DEAD_TUPLES_THRESHOLD', :postgresql do
      worker = described_class.new
      threshold_query_result = [{ "n_dead_tup" => described_class::DEAD_TUPLES_THRESHOLD.to_s }]
      normal_query_result = [{ "n_dead_tup" => '3' }]

      allow(worker)
        .to receive(:execute_statement)
        .with(/SELECT n_dead_tup */)
        .and_return(threshold_query_result, normal_query_result)

      expect(worker.should_wait_deadtuple_vacuum?).to be(true)
    end
  end
end

