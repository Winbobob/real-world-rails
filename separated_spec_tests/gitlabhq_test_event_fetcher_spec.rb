require 'spec_helper'
require 'lib/gitlab/cycle_analytics/shared_event_spec'

describe Gitlab::CycleAnalytics::TestEventFetcher do
  let(:stage_name) { :test }

  it_behaves_like 'default query config' do
    it 'has a default order' 

  end
end

