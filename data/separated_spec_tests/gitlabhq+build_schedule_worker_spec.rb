require 'spec_helper'

describe Ci::BuildScheduleWorker do
  subject { described_class.new.perform(build.id) }

  context 'when build is found' do
    context 'when build is scheduled' do
      let(:build) { create(:ci_build, :scheduled) }

      it 'executes RunScheduledBuildService' 

    end

    context 'when build is not scheduled' do
      let(:build) { create(:ci_build, :created) }

      it 'executes RunScheduledBuildService' 

    end
  end

  context 'when build is not found' do
    let(:build) { build_stubbed(:ci_build, :scheduled) }

    it 'does nothing' 

  end
end

