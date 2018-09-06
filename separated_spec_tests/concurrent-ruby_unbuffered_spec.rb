require_relative 'base_shared'

module Concurrent::Channel::Buffer

  RSpec.describe Unbuffered, edge: true do

    subject { described_class.new }

    it_behaves_like :channel_buffer

    specify do
      expect(subject).to be_blocking
    end

    specify do
      expect(subject.capacity).to eq 1
    end

    context '#size' do

      it 'is 0 when first created' 


      it 'is 1 when a putting thread is waiting' 


      it 'is 0 when there are taking threads but no putting threads' 

    end

    context '#empty?' do

      it 'is true when there are no putting threads' 


      it 'is false when there are waiting putting threads' 

    end

    context '#full?' do

      it 'is false when there are no putting threads' 


      it 'is false when there are waiting putting threads' 

    end

    context '#put' do

      it 'does not enqueue the item when closed' 


      it 'returns false when closed' 


      it 'blocks until a thread is ready to take' 


      it 'delivers when closed after put starts' 

    end

    context '#offer' do

      it 'returns false immediately when a put in in progress' 


      it 'gives the item to a waiting taker and returns true' 

    end

    context '#take' do

      it 'returns false immediately when a put in in progress' 


      it 'gives the item to a waiting taker and returns true' 

    end

    context '#next' do

      it 'blocks when no putting and returns <item>, true when one arrives' 


      it 'returns <item>, true when there are multiple putting' 


      it 'returns <item>, true when closed and last item' 


      it 'returns Concurrent::NULL, false when closed and no items remain' 

    end
  end
end

