require_relative 'buffered_shared'

module Concurrent::Channel::Buffer

  RSpec.describe Buffered, edge: true do

    let(:capacity) { 10 }
    subject { described_class.new(capacity) }

    it_behaves_like :channel_buffered_buffer

    specify do
      expect(subject).to be_blocking
    end

    context '#full?' do
      it 'returns true when at max capacity' 

    end

    context '#put' do
      it 'blocks when at capacity until a thread is ready to take' 

    end

    context '#offer' do
      it 'returns false immediately when full' 

    end
  end
end

