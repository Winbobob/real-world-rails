require 'rails_helper'

describe ReportMilestoneToSegmentWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let(:analytics) { double(:analytics, identify: true, track: true) }
    let!(:user) { create(:user) }

    before do
      allow(SegmentAnalytics).to receive(:new) { analytics }
    end

    it 'should identify the user and track the event' 

  end
end

