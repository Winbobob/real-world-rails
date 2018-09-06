RSpec.shared_examples :priority_queue do

  subject{ described_class.new }

  context '#initialize' do

    it 'sorts from high to low when :order is :max' 


    it 'sorts from high to low when :order is :high' 


    it 'sorts from low to high when :order is :min' 


    it 'sorts from low to high when :order is :low' 


    it 'sorts from high to low by default' 

  end

  context '#clear' do

    it 'removes all items from a populated queue' 


    it 'has no effect on an empty queue' 


    specify { expect(subject.clear).to be_truthy }
  end

  context '#delete' do

    it 'deletes the requested item when found' 


    it 'deletes the requested item when it is the first element' 


    it 'deletes the requested item when it is the last element' 


    it 'deletes multiple matching items when present' 


    it 'returns true when found' 


    it 'returns false when not found' 


    it 'returns false when called on an empty queue' 

  end

  context '#empty?' do

    it 'returns true for an empty queue' 


    it 'returns false for a populated queue' 

  end

  context '#include?' do

    it 'returns true if the item is found' 


    it 'returns false if the item is not found' 


    it 'returns false when the queue is empty' 


    it 'is aliased as #has_priority?' 

  end

  context '#length' do

    it 'returns the length of a populated queue' 


    it 'returns zero when the queue is empty' 


    it 'is aliased as #size' 

  end

  context '#peek' do

    it 'returns the item at the head of the queue' 


    it 'does not remove the item from the queue' 


    it 'returns nil when the queue is empty' 

  end

  context '#pop' do

    it 'returns the item at the head of the queue' 


    it 'removes the item from the queue' 


    it 'returns nil when the queue is empty' 


    it 'returns nil when called multiple times while empty' 


    it 'is aliased as #deq' 


    it 'is aliased as #shift' 

  end

  context '#push' do

    it 'raises an exception when attempting to enqueue nil' 


    it 'adds the item to the queue' 


    it 'sorts the new item in priority order' 


    it 'arbitrarily orders equal items with respect to each other' 


    specify { expect(subject.push(10)).to be_truthy }

    it 'is aliased as <<' 


    it 'is aliased as enq' 

  end

  context '.from_list' do

    it 'creates an empty queue from an empty list' 


    it 'creates a sorted, populated queue from an Array' 


    it 'creates a sorted, populated queue from a Hash' 

  end
end

module Concurrent
  module Collection

    RSpec.describe RubyNonConcurrentPriorityQueue do

      it_should_behave_like :priority_queue
    end

    if Concurrent.on_jruby?

      RSpec.describe JavaNonConcurrentPriorityQueue do

        it_should_behave_like :priority_queue
      end
    end

    RSpec.describe NonConcurrentPriorityQueue do
      if Concurrent.on_jruby?
        it 'inherits from JavaNonConcurrentPriorityQueue' 

      else
        it 'inherits from RubyNonConcurrentPriorityQueue' 

      end
    end
  end
end

