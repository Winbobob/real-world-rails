require 'spec_helper'
require 'lib/gitlab/cycle_analytics/shared_stage_spec'

describe Gitlab::CycleAnalytics::ReviewStage do
  let(:stage_name) { :review }

  it_behaves_like 'base stage'
end

