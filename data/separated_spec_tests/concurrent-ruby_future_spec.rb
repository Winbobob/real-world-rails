require_relative 'ivar_shared'
require_relative 'thread_arguments_shared'

module Concurrent

  RSpec.describe Future do

    let!(:value) { 10 }
    let(:executor) { SimpleExecutorService.new }

    subject do
      Future.new(executor: executor){
        value
      }.execute.tap{ sleep(0.1) }
    end

    let!(:fulfilled_value) { 10 }
    let!(:rejected_reason) { StandardError.new('mojo jojo') }

    let(:pending_subject) do
      executor = Concurrent::SingleThreadExecutor.new
      executor.post{ sleep(5) }
      Future.execute(executor: executor){ fulfilled_value }
    end

    let(:fulfilled_subject) do
      Future.new(executor: :immediate){ fulfilled_value }.execute
    end

    let(:rejected_subject) do
      Future.new(executor: :immediate){ raise rejected_reason }.execute
    end

    it_should_behave_like :ivar do
      subject { Future.new(executor: :immediate){ value } }

      def dereferenceable_subject(value, opts = {})
        opts = opts.merge(executor: executor)
        Future.new(opts){ value }.execute.tap{ sleep(0.1) }
      end

      def dereferenceable_observable(opts = {})
        opts = opts.merge(executor: executor)
        Future.new(opts){ 'value' }
      end

      def execute_dereferenceable(subject)
        subject.execute
        sleep(0.1)
      end

      def trigger_observable(observable)
        observable.execute
        sleep(0.1)
      end
    end

    it_should_behave_like :thread_arguments do

      def get_ivar_from_no_args
        Concurrent::Future.execute{|*args| args }
      end

      def get_ivar_from_args(opts)
        Concurrent::Future.execute(opts){|*args| args }
      end
    end

    context '#initialize' do

      let(:executor) { ImmediateExecutor.new }

      it 'sets the state to :unscheduled' 


      it 'raises an exception when no block given' 


      it 'uses the executor given with the :executor option' 


      it 'uses the global io executor by default' 

    end

    context 'instance #execute' do

      it 'does nothing unless the state is :unscheduled' 


      it 'posts the block given on construction' 


      it 'sets the state to :pending' 


      it 'returns self' 

    end

    context 'class #execute' do

      let(:executor) { ImmediateExecutor.new }

      it 'creates a new Future' 


      it 'passes the block to the new Future' 


      it 'calls #execute on the new Future' 

    end

    context 'fulfillment' do

      let(:executor) { ImmediateExecutor.new }

      it 'sets the state to :processing while the task is executing' 


      it 'passes all arguments to handler' 


      it 'sets the value to the result of the handler' 


      it 'sets the state to :fulfilled when the block completes' 


      it 'sets the value to nil when the handler raises an exception' 


      it 'sets the value to nil when the handler raises Exception' 


      it 'sets the reason to the Exception instance when the handler raises Exception' 


      it 'sets the state to :rejected when the handler raises an exception' 


      context 'aliases' do

        it 'aliases #realized? for #fulfilled?' 


        it 'aliases #deref for #value' 

      end
    end

    context 'cancellation' do

      context '#cancel' do

        it 'fails to cancel the task once processing has begun' 


        it 'fails to cancel the task once processing is complete' 


        it 'cancels a pending task' 

      end

      context '#wait_or_cancel' do

        it 'returns true if the operation completes before timeout' 


        it 'cancels the task on timeout' 

      end
    end

    context 'observation' do

      let(:executor) { ImmediateExecutor.new }

      let(:clazz) do
        Class.new do
          attr_reader :value
          attr_reader :reason
          attr_reader :count
          define_method(:update) do |time, value, reason|
            @count = @count.to_i + 1
            @value = value
            @reason = reason
          end
        end
      end

      let(:observer) { clazz.new }

      it 'notifies all observers on fulfillment' 


      it 'notifies all observers on rejection' 


      it 'notifies an observer added after fulfillment' 


      it 'notifies an observer added after rejection' 


      it 'does not notify existing observers when a new observer added after fulfillment' 


      it 'does not notify existing observers when a new observer added after rejection' 


      context 'deadlock avoidance' do

        def reentrant_observer(future)
          obs = Object.new
          obs.define_singleton_method(:update) do |time, value, reason|
            @value = future.value
          end
          obs.define_singleton_method(:value) { @value }
          obs
        end

        it 'should notify observers outside mutex lock' 


        it 'should notify a new observer added after fulfillment outside lock' 

      end
    end
  end
end

