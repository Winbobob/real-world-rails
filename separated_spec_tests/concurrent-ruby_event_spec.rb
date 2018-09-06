module Concurrent

  RSpec.describe Event do

    subject{ Event.new }

    context '#initialize' do

      it 'sets the state to unset' 

    end

    context '#set?' do

      it 'returns true when the event has been set' 


      it 'returns false if the event is unset' 

    end

    context '#set' do

      it 'triggers the event' 


      it 'sets the state to set' 

    end

    context '#try?' do

      it 'triggers the event if not already set' 


      it 'returns true if not previously set' 


      it 'returns false if previously set' 

    end

    context '#reset' do

      it 'does not change the state of an unset event' 


      it 'does not trigger an unset event' 


      it 'returns true when called on an unset event' 


      it 'sets the state of a set event to unset' 


      it 'returns true when called on a set event' 

    end

    context '#wait' do

      it 'returns immediately when the event has been set' 


      it 'returns true once the event is set' 


      it 'blocks indefinitely when the timer is nil' 


      it 'stops waiting when the timer expires' 


      it 'returns false when the timer expires' 


      it 'triggers multiple waiting threads' 


      it 'behaves appropriately if wait begins while #set is processing' 

    end

    context 'spurious wake ups' do

      before(:each) do
        def subject.simulate_spurious_wake_up
          synchronize do
            ns_signal
            ns_broadcast
          end
        end
      end

      it 'should resist to spurious wake ups without timeout' 


      it 'should resist spurious wake ups with timeout', buggy: true do
        latch = CountDownLatch.new(1)
        t = Thread.new{ subject.wait(0.5); latch.count_down }
        t.join(0.1)

        subject.simulate_spurious_wake_up
        expect(latch.wait(0.1)).to be false
        expect(latch.wait(1)).to be true
      end
    end
  end
end

