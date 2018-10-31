RSpec.shared_examples :count_down_latch do

  let(:latch) { described_class.new(3) }
  let(:zero_count_latch) { described_class.new(0) }

  context '#initialize' do

    it 'raises an exception if the initial count is less than zero' 


    it 'raises an exception if the initial count is not an integer' 


    it 'defaults the count to 1' 

  end

  describe '#count' do

    it 'should be the value passed to the constructor' 


    it 'should be decreased after every count down' 


    it 'should not go below zero' 

  end

  describe '#wait' do

    it 'blocks indefinitely, and is kill-able' 


    it 'blocks indefinitely with timeout, and is kill-able' 


    context 'count set to zero' do
      it 'should return true immediately' 


      it 'should return true immediately with timeout' 

    end

    context 'non zero count' do

      it 'should block thread until counter is set to zero' 


      it 'should block until counter is set to zero with timeout' 


      it 'should block until timeout and return false when counter is not set to zero' 

    end
  end
end

module Concurrent

  RSpec.describe MutexCountDownLatch do

    it_should_behave_like :count_down_latch

    context 'spurious wake ups' do

      subject { described_class.new(3) }

      before(:each) do
        def subject.simulate_spurious_wake_up
          synchronize do
            ns_signal
            ns_broadcast
          end
        end
      end

      it 'should resist to spurious wake ups without timeout' 


      it 'should resist to spurious wake ups with timeout' 

    end
  end

  if Concurrent.on_jruby?
    RSpec.describe JavaCountDownLatch do
      it_should_behave_like :count_down_latch
    end
  end

  RSpec.describe CountDownLatch do
    if Concurrent.on_jruby?
      it 'inherits from JavaCountDownLatch' 

    else
      it 'inherits from MutexCountDownLatch' 

    end
  end
end

