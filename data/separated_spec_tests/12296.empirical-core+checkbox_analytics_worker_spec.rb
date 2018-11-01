require 'rails_helper'

describe CheckboxAnalyticsWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }
    let(:analyzer) { double(:analyzer) }

    before do
      allow(SegmentAnalytics).to receive(:new) { analyzer }
    end

    it 'should track the event' 

  end
end

