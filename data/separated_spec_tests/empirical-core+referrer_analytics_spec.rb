require 'rails_helper'

describe 'ReferrerAnalytics' do
  let(:analytics) { ReferrerAnalytics.new }
  let(:segment_analytics) { SegmentAnalytics.new }
  let(:track_calls) { segment_analytics.backend.track_calls }
  let(:identify_calls) { segment_analytics.backend.identify_calls }
  let(:referrer) { create(:teacher) }
  let(:referral) { create(:teacher) }

  context 'when a referral signs up' do
    before(:each) do
      analytics.track_referral_invited(referrer, referral.id)
    end

    it 'identifies the referring teacher' 


    it 'sends the event' 

  end

  context 'when a referral becomes active' do
    before(:each) do
      analytics.track_referral_activated(referrer, referral.id)
    end

    it 'identifies the referring teacher' 


    it 'sends the event' 

  end
end

