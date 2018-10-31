module Concurrent

  RSpec.describe CyclicBarrier do

    let(:parties) { 3 }
    let!(:barrier) { described_class.new(3) }

    context '#initialize' do

      it 'raises an exception if the initial count is less than 1' 


      it 'raises an exception if the initial count is not an integer' 

    end

    describe '#parties' do

      it 'should be the value passed to the constructor' 


    end

    describe '#number_waiting' do
      context 'without any waiting thread' do
        it 'should be equal to zero' 

      end

      context 'with waiting threads' do
        it 'should be equal to the waiting threads count' 

      end
    end

    describe '#broken?' do
      it 'should not be broken when created' 


      it 'should not be broken when reset is called without waiting thread' 

    end

    describe 'reset' do
      it 'should release all waiting threads', notravis: true do
        start_latch    = CountDownLatch.new(1)
        continue_latch = CountDownLatch.new(1)

        in_thread do
          start_latch.count_down
          barrier.wait
          continue_latch.count_down
        end

        start_latch.wait(1)
        barrier.reset

        expect(barrier).not_to be_broken
        expect(barrier.number_waiting).to eq 0
      end
    end

    describe '#wait' do
      context 'without timeout' do
        it 'should block the thread' 


        it 'should release all threads when their number matches the desired one' 


        it 'returns true when released' 


        it 'executes the block once' 


        it 'can be reused' 


        it 'return false if barrier has been reset', notravis: true do
          latch = CountDownLatch.new(1)

          t = in_thread { latch.count_down if barrier.wait == false }
          t.join(0.1)
          barrier.reset
          expect(latch.wait(1)).to be_truthy
        end
      end

      context 'with timeout' do
        context 'timeout not expiring' do
          it 'should block the thread' 


          it 'should release all threads when their number matches the desired one' 


          it 'returns true when released' 

        end

        context 'timeout expiring' do

          it 'returns false' 


          it 'breaks the barrier and release all other threads' 


          it 'breaks the barrier and release all other threads 2' 


          it 'does not execute the block on timeout' 

        end
      end

      context '#broken barrier' do
        it 'should not accept new threads' 


        it 'can be reset' 

      end
    end

    context 'spurious wake ups' do

      before(:each) do
        def barrier.simulate_spurious_wake_up
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
end

