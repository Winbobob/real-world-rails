require 'rails_helper'

describe "FinishActivityAnalytics" do
  let(:analytics) { FinishActivityAnalytics.new }
  let(:segment_analytics) { SegmentAnalytics.new }
  let(:track_calls) { segment_analytics.backend.track_calls }
  let(:identify_calls) { segment_analytics.backend.identify_calls }

  context 'tracking activity completion' do
    let!(:activity_session) { create(:activity_session) }

    it 'sends an event' 

  end

  context 'tracking activity completion for sessions not associated with a teacher' do
    let(:activity_session) { create(:activity_session,  classroom_activity: nil) }

    it 'does nothing' 

  end
end

