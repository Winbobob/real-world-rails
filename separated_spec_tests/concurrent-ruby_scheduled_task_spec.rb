require 'timecop'
require_relative 'concern/dereferenceable_shared'
require_relative 'concern/obligation_shared'
require_relative 'concern/observable_shared'

module Concurrent

  RSpec.describe ScheduledTask do

    context 'behavior' do

      let!(:fulfilled_value) { 10 }
      let!(:rejected_reason) { StandardError.new('mojo jojo') }

      let(:pending_subject) do
        ScheduledTask.new(1){ fulfilled_value }.execute
      end

      let(:fulfilled_subject) do
        ScheduledTask.new(0, executor: :immediate){ fulfilled_value }.execute
      end

      let(:rejected_subject) do
        ScheduledTask.new(0, executor: :immediate){ raise rejected_reason }.execute
      end

      def dereferenceable_subject(value, opts = {})
        task = ScheduledTask.execute(0, opts){ value }.execute
        task.value
        task
      end

      def dereferenceable_observable(opts = {})
        ScheduledTask.new(0, opts){ 'value' }
      end

      def execute_dereferenceable(subject)
        subject.execute
        subject.value
      end

      def trigger_observable(observable)
        observable.execute
        sleep(0.2)
      end

      subject{ ScheduledTask.new(0.1){ nil } }

      it_should_behave_like :obligation
      it_should_behave_like :dereferenceable
      it_should_behave_like :observable
    end

    context '#initialize' do

      it 'accepts a number of seconds (from now) as the schedule time' 


      it 'raises an exception when seconds is less than zero' 


      it 'raises an exception when no block given' 


      it 'sets the initial state to :unscheduled' 

    end

    context 'instance #execute' do

      it 'does nothing unless the state is :unscheduled' 


      it 'sets the sate to :pending' 


      it 'returns self' 

    end

    context 'class #execute' do

      it 'creates a new ScheduledTask' 


      it 'passes the block to the new ScheduledTask' 


      it 'calls #execute on the new ScheduledTask' 

    end

    context 'execution' do

      it 'passes :args from the options to the block' 


      it 'uses the :executor from the options' 


      it 'uses the :timer_set from the options' 


      it 'sets the state to :processing when the task is running' 

    end

    context '#cancel' do

      it 'returns false if the task has already been performed' 


      it 'returns false if the task is already in progress' 


      it 'cancels the task if it has not yet scheduled' 


      it 'cancels the task if it has not yet started' 


      it 'returns true on success' 


      it 'sets the reason to CancelledOperationError when cancelled' 

    end

    context 'observation' do

      let(:clazz) do
        Class.new do
          attr_reader :value
          attr_reader :reason
          attr_reader :count
          attr_reader :latch
          def initialize
            @latch = Concurrent::CountDownLatch.new(1)
          end
          def update(time, value, reason)
            @count = @count.to_i + 1
            @value = value
            @reason = reason
            @latch.count_down
          end
        end
      end

      let(:observer) { clazz.new }

      it 'returns true for an observer added while :unscheduled' 


      it 'returns true for an observer added while :pending' 


      it 'returns true for an observer added while :processing' 


      it 'notifies all observers on fulfillment' 


      it 'notifies all observers on rejection' 

    end
  end
end

