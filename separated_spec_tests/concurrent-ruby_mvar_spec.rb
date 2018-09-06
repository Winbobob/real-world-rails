require_relative 'concern/dereferenceable_shared'

module Concurrent

  RSpec.describe MVar do

    context 'behavior' do

      # dereferenceable

      def dereferenceable_subject(value, opts = {})
        MVar.new(value, opts)
      end

      it_should_behave_like :dereferenceable
    end

    describe '#initialize' do

      it 'accepts no initial value' 


      it 'accepts an empty initial value' 


      it 'accepts an initial value' 


      it 'accepts a nil initial value' 


    end

    describe '#take' do

      it 'sets the MVar to empty' 


      it 'returns the value on a full MVar' 


      it 'waits for another thread to #put' 


      it 'returns TIMEOUT on timeout on an empty MVar' 


    end

    describe '#borrow' do

      it 'yields current value to the block and puts back value' 


      it 'puts back value even if an exception is raised' 


      it 'returns the returned value of the block' 


      it 'returns TIMEOUT on timeout on an empty MVar' 


    end


    describe '#put' do

      it 'sets the MVar to be empty' 


      it 'sets a new value on an empty MVar' 


      it 'waits for another thread to #take' 


      it 'returns TIMEOUT on timeout on a full MVar' 


      it 'returns the value' 


    end

    describe '#empty?' do

      it 'returns true on an empty MVar' 


      it 'returns false on a full MVar' 


    end

    describe '#full?' do

      it 'returns false on an empty MVar' 


      it 'returns true on a full MVar' 


    end

    describe '#modify' do

      it 'raises an exception when no block given' 


      it 'modifies a full MVar' 


      it 'returns the unmodified value' 


      it 'waits for another thread to #put' 


      it 'is atomic' 


      it 'returns TIMEOUT on timeout on an empty MVar' 


    end

    describe '#try_put!' do

      it 'returns true an empty MVar' 


      it 'returns false on a full MVar' 


      it 'sets an empty MVar to be full' 


    end

    describe '#try_take!' do

      it 'returns EMPTY an empty MVar' 


      it 'returns the value on a full MVar' 


      it 'sets a full MVar to be empty' 


    end

    describe '#set!' do

      it 'sets an empty MVar to be full' 


      it 'sets a full MVar to be full' 


      it 'returns EMPTY on an empty MVar' 


      it 'returns the original value on a full MVar' 


    end

    describe '#modify!' do

      it 'raises an exception when no block given' 


      it 'modifies a full MVar' 


      it 'modifies an empty MVar' 


      it 'can be used to set a full MVar to empty' 


      it 'can be used to set an empty MVar to empty' 


      it 'returns the unmodified value' 


    end

    context 'spurious wake ups' do

      let(:m) { MVar.new }

      before(:each) do
        def m.simulate_spurious_wake_up
          @mutex.synchronize do
            @full_condition.broadcast
            @empty_condition.broadcast
          end
        end
      end

      describe '#take' do
        it 'waits for another thread to #put' 


        it 'returns TIMEOUT on timeout on an empty MVar' 

      end

      describe '#modify' do

        it 'waits for another thread to #put' 


        it 'returns TIMEOUT on timeout on an empty MVar' 

      end

      describe '#put' do

        before(:each) { m.put(42) }

        it 'waits for another thread to #take' 


        it 'returns TIMEOUT on timeout on a full MVar', buggy: true do
          # TODO (pitr-ch 15-Oct-2016): fails on jruby
          result = nil
          Thread.new { result = m.put(14, 0.3) }
          sleep(0.1)
          Thread.new { m.simulate_spurious_wake_up }
          sleep(0.1)
          expect(result).to be_nil
          sleep(0.2)
          expect(result).to eq MVar::TIMEOUT
        end
      end


    end

  end

end

