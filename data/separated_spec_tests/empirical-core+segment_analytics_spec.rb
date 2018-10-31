require 'rails_helper'

describe 'SegmentAnalytics' do

  # TODO : arent tests of these behaviours duplicated in the tests of the Workers?

  let(:analytics) { SegmentAnalytics.new }

  let(:track_calls) { analytics.backend.track_calls }
  let(:identify_calls) { analytics.backend.identify_calls }


  context 'tracking classroom creation' do
    let(:classroom) { create(:classroom) }

    it 'sends an event' 

  end

  context 'tracking activity assignment' do
    let(:teacher) { create(:teacher) }

    it 'sends an event' 

  end
end

