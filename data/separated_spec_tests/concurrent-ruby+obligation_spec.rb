module Concurrent
  module Concern

    RSpec.describe Obligation do

      let (:obligation_class) do
        Class.new(Synchronization::LockableObject) do
          include Obligation
          public :state=, :compare_and_set_state, :if_state
          attr_writer :value, :reason
          def initialize
            super
            set_deref_options
            init_obligation
          end
        end
      end

      let (:obligation) { obligation_class.new }
      let (:event) { double 'event' }

      RSpec.shared_examples :incomplete do

        it 'should be not completed' 


        it 'should be incomplete' 


        methods = [:value, :value!, :no_error!]
        methods.each do |method|
          describe "##{method}" do

            it 'should return immediately if timeout is zero' 


            it 'should block on the event if timeout is not set' 


            it 'should block on the event if timeout is not zero' 


          end
        end
      end

      context 'unscheduled' do
        before(:each) { obligation.state = :unscheduled }
        it_should_behave_like :incomplete
      end

      context 'pending' do
        before(:each) { obligation.state = :pending }
        it_should_behave_like :incomplete
      end

      context 'fulfilled' do

        before(:each) do
          obligation.send :set_state, true, 42, nil
          allow(obligation).to receive(:event).and_return(event)
        end

        it 'should be completed' 


        it 'should be not incomplete' 


        describe '#value' do

          it 'should return immediately if timeout is zero' 


          it 'should return immediately if timeout is not set' 


          it 'should return immediately if timeout is not zero' 


        end

        describe '#value!' do

          it 'should return immediately if timeout is zero' 


          it 'should return immediately if timeout is not set' 


          it 'should return immediately if timeout is not zero' 


        end

        describe '#no_error!' do

          it 'should return immediately if timeout is zero' 


          it 'should return immediately if timeout is not set' 


          it 'should return immediately if timeout is not zero' 


        end

      end

      context 'rejected' do

        before(:each) do
          obligation.send :set_state, false, nil, (raise rescue $!)
          allow(obligation).to receive(:event).and_return(event)
        end

        it 'should be completed' 


        it 'should be not incomplete' 



        describe '#value' do

          it 'should return immediately if timeout is zero' 


          it 'should return immediately if timeout is not set' 


          it 'should return immediately if timeout is not zero' 


        end

        describe '#value!' do

          it 'should return immediately if timeout is zero' 


          it 'should return immediately if timeout is not set' 


          it 'should return immediately if timeout is not zero' 


        end

        describe '#no_error!' do

          it 'should return immediately if timeout is zero' 


          it 'should return immediately if timeout is not set' 


          it 'should return immediately if timeout is not zero' 


        end

      end

      describe '#compare_and_set_state' do

        before(:each) { obligation.state = :unscheduled }

        context 'unexpected state' do
          it 'should return false if state is not the expected one' 


          it 'should not change the state if current is not the expected one' 

        end

        context 'expected state' do
          it 'should return true if state is the expected one' 


          it 'should not change the state if current is not the expected one' 

        end

      end

      describe '#if_state' do

        before(:each) { obligation.state = :unscheduled }

        it 'should raise without block' 


        it 'should return false if state is not expected' 


        it 'should the block value if state is expected' 


        it 'should execute the block within the mutex' 

      end

      context '#get_arguments_from' do

        it 'returns an empty array when opts is not given' 


        it 'returns an empty array when opts is an empty hash' 


        it 'returns an empty array when there is no :args key' 


        it 'returns an empty array when the :args key has a nil value' 


        it 'returns a one-element array when the :args key has a non-array value' 


        it 'returns an array when when the :args key has an array value' 


        it 'returns the given array when the :args key has a complex array value' 

      end
    end
  end
end

