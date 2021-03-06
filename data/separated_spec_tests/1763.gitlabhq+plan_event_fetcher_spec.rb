require 'spec_helper'
require 'lib/gitlab/cycle_analytics/shared_event_spec'

describe Gitlab::CycleAnalytics::PlanEventFetcher do
  let(:stage_name) { :plan }

  it_behaves_like 'default query config' do
    context 'no commits' do
      it 'does not blow up if there are no commits' 

    end
  end
end

