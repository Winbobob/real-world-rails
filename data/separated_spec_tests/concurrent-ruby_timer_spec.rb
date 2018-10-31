require_relative 'timing_buffer_shared'

module Concurrent::Channel::Buffer

  RSpec.describe Timer, edge: true do

    let(:delay) { 0.1 }
    subject { described_class.new(0.1) }

    it_behaves_like :channel_timing_buffer

    context '#take' do
      it 'closes automatically on first take' 

    end

    context '#poll' do
      it 'closes automatically on first take' 

    end

    context '#next' do
      it 'closes automatically on first take' 


    it 'returns false for more' 

    end
  end
end

