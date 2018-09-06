require 'rails_helper'

describe EventList do
  describe 'filtering by organization' do
    let(:org1) { create(:organization) }
    let(:org2) { create(:organization) }

    let(:org1_chapter) { create(:chapter, organization: org1) }
    let(:org2_chapter) { create(:chapter, organization: org2) }

    let!(:org1_event) { create(:event, chapter: org1_chapter) }
    let!(:org2_event) { create(:event, chapter: org2_chapter) }
    let!(:org1_external_event) { create(:external_event, chapter: org1_chapter) }
    let!(:org2_external_event) { create(:external_event, chapter: org2_chapter) }

    it 'returns only the events from a given organization' 

  end

  describe 'when returning datatables json' do
    describe 'searching' do
      search_result_ids = Proc.new do |query|
        json = EventList.new('past', serialization_format: 'dataTables', start: 0, length: 10, search: {'value' => query}).as_json
        json[:data].map { |e| e[:global_id] }
      end

      before do
        @past_bt_event_location = create(:location, name: 'PBPlace', city: 'PBCity')
        @past_bt_event = create(:event, title: 'PastBridge', location: @past_bt_event_location)
        @past_bt_event.update_attributes(starts_at: 5.days.ago, ends_at: 4.days.ago)

        @past_external_event = create(:external_event, name: 'PastExternalBridge', starts_at: 3.days.ago, ends_at: 2.days.ago, location: 'PEBPlace')
      end

      it 'can search by event name' 


      it 'can search by event location' 

    end
  end

  describe 'csv' do
    let(:meetup_event_url) { 'https://example.com' }

    let!(:event) { create(:event) }
    let!(:meetup_event) do
      imported_event_data = {'student_event' => {'url' => meetup_event_url}}
      create(:event, imported_event_data: imported_event_data)
    end
    let!(:external_event) { create(:external_event) }

    it 'aggregates data for bridgetroll and external events' 

  end
end

