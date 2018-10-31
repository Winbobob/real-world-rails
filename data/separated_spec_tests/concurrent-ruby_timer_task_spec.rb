require_relative 'concern/dereferenceable_shared'
require_relative 'concern/observable_shared'

module Concurrent

  RSpec.describe TimerTask do

    context :dereferenceable do

      def kill_subject
        @subject.kill if @subject
      rescue Exception => ex
        # prevent exceptions with mocks in tests
      end

      after(:each) do
        kill_subject
      end

      def dereferenceable_subject(value, opts = {})
        kill_subject
        opts     = opts.merge(execution_interval: 0.1, run_now: true)
        @subject = TimerTask.new(opts) { value }.execute.tap { sleep(0.1) }
      end

      def dereferenceable_observable(opts = {})
        opts     = opts.merge(execution_interval: 0.1, run_now: true)
        @subject = TimerTask.new(opts) { 'value' }
      end

      def execute_dereferenceable(subject)
        subject.execute
        sleep(0.1)
      end

      it_should_behave_like :dereferenceable
    end

    context :observable do

      subject { TimerTask.new(execution_interval: 0.1) { nil } }

      after(:each) { subject.kill }

      def trigger_observable(observable)
        observable.execute
        sleep(0.2)
      end

      it_should_behave_like :observable
    end

    context 'created with #new' do

      context '#initialize' do

        it 'raises an exception if no block given' 


        it 'raises an exception if :execution_interval is not greater than zero' 


        it 'raises an exception if :execution_interval is not an integer' 


        it 'raises an exception if :timeout_interval is not greater than zero' 


        it 'raises an exception if :timeout_interval is not an integer' 


        it 'uses the default execution interval when no interval is given' 


        it 'uses the default timeout interval when no interval is given' 


        it 'uses the given execution interval' 


        it 'uses the given timeout interval' 

      end

      context '#kill' do

        it 'returns true on success' 

      end

      context '#shutdown' do

        it 'returns true on success' 

      end
    end

    context 'arguments' do

      it 'raises an exception if no block given' 


      specify '#execution_interval is writeable' do

        latch   = CountDownLatch.new(1)
        subject = TimerTask.new(timeout_interval: 1,
                                execution_interval: 1,
                                run_now: true) do |task|
          task.execution_interval = 3
          latch.count_down
        end

        expect(subject.execution_interval).to eq(1)
        subject.execution_interval = 0.1
        expect(subject.execution_interval).to eq(0.1)

        subject.execute
        latch.wait(0.2)

        expect(subject.execution_interval).to eq(3)
        subject.kill
      end

      specify '#timeout_interval is writeable' do

        latch   = CountDownLatch.new(1)
        subject = TimerTask.new(timeout_interval: 1,
                                execution_interval: 0.1,
                                run_now: true) do |task|
          task.timeout_interval = 3
          latch.count_down
        end

        expect(subject.timeout_interval).to eq(1)
        subject.timeout_interval = 2
        expect(subject.timeout_interval).to eq(2)

        subject.execute
        latch.wait(0.2)

        expect(subject.timeout_interval).to eq(3)
        subject.kill
      end
    end

    context 'execution' do

      it 'runs the block immediately when the :run_now option is true' 


      it 'waits for :execution_interval seconds when the :run_now option is false' 


      it 'waits for :execution_interval seconds when the :run_now option is not given' 


      it 'passes a "self" reference to the block as the sole argument' 

    end

    context 'observation' do

      let(:observer) do
        Class.new do
          attr_reader :time
          attr_reader :value
          attr_reader :ex
          attr_reader :latch
          define_method(:initialize) { @latch = CountDownLatch.new(1) }
          define_method(:update) do |time, value, ex|
            @time  = time
            @value = value
            @ex    = ex
            @latch.count_down
          end
        end.new
      end

      it 'notifies all observers on success' 


      it 'notifies all observers on timeout' 


      it 'notifies all observers on error' 

    end
  end
end

