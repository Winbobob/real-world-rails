require 'rails_helper'

describe Gitlab::BackgroundMigration::PopulateMergeRequestMetricsWithEventsData, :migration, schema: 20171128214150 do
  # commits_count attribute is added in a next migration
  before do
    allow_any_instance_of(MergeRequestDiff)
      .to receive(:commits_count=).and_return(nil)
  end

  describe '#perform' do
    let(:mr_with_event) { create(:merge_request) }
    let!(:merged_event) { create(:event, :merged, target: mr_with_event) }
    let!(:closed_event) { create(:event, :closed, target: mr_with_event) }

    before do
      # Make sure no metrics are created and kept through after_* callbacks.
      mr_with_event.metrics.destroy!
    end

    it 'inserts metrics and updates closed and merged events' 

  end

  describe '#insert_metrics_for_range' do
    let!(:mrs_without_metrics) { create_list(:merge_request, 3) }
    let!(:mrs_with_metrics) { create_list(:merge_request, 2) }

    before do
      # Make sure no metrics are created and kept through after_* callbacks.
      mrs_without_metrics.each { |m| m.metrics.destroy! }
    end

    it 'inserts merge_request_metrics for merge_requests without one' 


    it 'does not inserts merge_request_metrics for MRs out of given range' 

  end

  describe '#update_metrics_with_events_data' do
    context 'closed events data update' do
      let(:users) { create_list(:user, 3) }
      let(:mrs_with_event) { create_list(:merge_request, 3) }

      before do
        create_list(:event, 2, :closed, author: users.first, target: mrs_with_event.first)
        create_list(:event, 3, :closed, author: users.second, target: mrs_with_event.second)
        create(:event, :closed, author: users.third, target: mrs_with_event.third)
      end

      it 'migrates multiple MR metrics with closed event data' 


      it 'does not updates metrics out of given range' 

    end

    context 'merged events data update' do
      let(:users) { create_list(:user, 3) }
      let(:mrs_with_event) { create_list(:merge_request, 3) }

      before do
        create_list(:event, 2, :merged, author: users.first, target: mrs_with_event.first)
        create_list(:event, 3, :merged, author: users.second, target: mrs_with_event.second)
        create(:event, :merged, author: users.third, target: mrs_with_event.third)
      end

      it 'migrates multiple MR metrics with merged event data' 


      it 'does not updates metrics out of given range' 

    end
  end
end
