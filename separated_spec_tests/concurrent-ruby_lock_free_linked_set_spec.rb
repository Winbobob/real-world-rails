require 'concurrent'
require 'concurrent/edge'
require 'securerandom'

RSpec.describe Concurrent::Edge::LockFreeLinkedSet, edge: true do
  subject { described_class.new }

  describe '.new' do
    context 'when passed default val' do
      it 'uses the val arg as data for each node' 

    end
  end

  describe '#add' do
    it 'appends to the linked set' 


    context 'in a multi-threaded environment', buggy: true do
      it 'adds the items to the set' 

    end
  end

  describe '#<<' do
    it 'appends to the linked set and returns self' 


    it 'returns self regardless of whether it was logically added' 

  end

  describe '#contains?' do
    context 'when checking if set includes a value' do
      it 'returns true if a value exists' 


      it 'compares object using Object#hash' 


      it 'returns false for values not in the set' 


      context 'when set is empty' do
        it 'does not break' 

      end

      context 'when set is long' do
        it 'does not break' 

      end

      context 'in a multi-threaded environment', buggy: true do
        it 'correctly check that the set contains the item' 

      end
    end
  end

  describe '#remove' do
    context 'when item is inside of set' do
      before { subject << 'one' << 'two' << 'three' }

      it 'the item is no longer visible to the user' 


      it 'allows for the item to be added despite being physically present' 

    end

    context 'in a multi-threaded environment', buggy: true do

      it 'adds the items to the set' 


      it 'does not recognize the existence of the item when removed' 

    end

    context 'when item is not inside of set' do
      before { subject << 'one' << 'two' << 'three' }

      it 'does not remove to value' 


      it 'the set remains intact' 


      context 'when the set is empty' do
        subject { described_class.new }

        it 'remove does not break' 

      end

      context 'when the set is large' do
        subject { described_class.new(1000) { SecureRandom.hex } }

        it 'remove successfully removes the node' 

      end
    end
  end
end

