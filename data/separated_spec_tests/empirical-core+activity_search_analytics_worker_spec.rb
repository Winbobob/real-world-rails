require 'rails_helper'

describe ActivitySearchAnalyticsWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let(:analytics) { double(:analytics) }
    let!(:user) { create(:user) }

    before do
      allow(SegmentAnalytics).to receive(:new) { analytics }
    end

    it 'should track the activity search' 

  end
end

