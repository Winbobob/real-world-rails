require 'spec_helper'

describe Gitlab::UserActivities, :clean_gitlab_redis_shared_state do
  let(:now) { Time.now }

  describe '.record' do
    context 'with no time given' do
      it 'uses Time.now and records an activity in SharedState' 

    end

    context 'with a time given' do
      it 'uses the given time and records an activity in SharedState' 

    end
  end

  describe '.delete' do
    context 'with a single key' do
      context 'and key exists' do
        it 'removes the pair from SharedState' 

      end

      context 'and key does not exist' do
        it 'removes the pair from SharedState' 

      end
    end

    context 'with multiple keys' do
      context 'and all keys exist' do
        it 'removes the pair from SharedState' 

      end

      context 'and some keys does not exist' do
        it 'removes the existing pair from SharedState' 

      end
    end
  end

  describe 'Enumerable' do
    before do
      described_class.record(40, now)
      described_class.record(41, now)
      described_class.record(42, now)
    end

    it 'allows to read the activities sequentially' 


    context 'with many records' do
      before do
        1_000.times { |i| described_class.record(i, now) }
      end

      it 'is possible to loop through all the records' 

    end
  end
end

