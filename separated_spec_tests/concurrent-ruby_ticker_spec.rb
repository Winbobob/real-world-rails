require_relative 'timing_buffer_shared'

module Concurrent::Channel::Buffer

  RSpec.describe Ticker, edge: true do

    let(:delay) { 0.1 }
    subject { described_class.new(delay) }

    it_behaves_like :channel_timing_buffer

    context '#take' do
      it 'triggers until closed' 


      it 'returns Concurrent::NULL when closed after trigger' 

    end

    context '#poll' do
      it 'triggers until closed' 

    end

    context '#next' do
      it 'triggers until closed' 


      it 'returns true for more while open' 


      it 'returns false for more once closed' 

    end
  end
end

