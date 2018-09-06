require 'spec_helper'

shared_examples 'base stage' do
  let(:stage) { described_class.new(project: double, options: {}) }

  before do
    allow(stage).to receive(:median).and_return(1.12)
    allow_any_instance_of(Gitlab::CycleAnalytics::BaseEventFetcher).to receive(:event_result).and_return({})
  end

  it 'has the median data value' 


  it 'has the median data stage' 


  it 'has the median data description' 


  it 'has the title' 


  it 'has the events' 

end

