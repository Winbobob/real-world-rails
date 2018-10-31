require_relative 'buffered_shared'

module Concurrent::Channel::Buffer

  RSpec.describe Dropping, edge: true do

    subject { described_class.new(10) }

    it_behaves_like :channel_buffered_buffer

    specify do
      expect(subject).to_not be_blocking
    end

    context '#put' do

      it 'does not block when full' 


      it 'drops the last value when full' 

    end

    context '#offer' do

      it 'returns true immediately when full' 


      it 'drops the last value when full' 

    end
  end
end

