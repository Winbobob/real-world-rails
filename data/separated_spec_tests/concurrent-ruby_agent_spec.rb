require_relative 'concern/observable_shared'

module Concurrent

  RSpec.describe Agent do

    let!(:immediate) { Concurrent::ImmediateExecutor.new }
    let!(:executor) { Concurrent::SingleThreadExecutor.new }

    context 'initialization' do

      it 'sets the initial value' 


      it 'sets the initial error to nil' 


      it 'sets the error mode when given a valid value' 


      it 'defaults the error mode to :continue when an error handler is given' 


      it 'defaults the error mode to :fail when no error handler is given' 


      it 'raises an error when given an invalid error mode' 


      it 'sets #failed? to false' 

    end

    context 'action processing' do

      specify 'the given block will be passed the current value' do
        actual = nil
        expected = 0
        subject = Agent.new(expected)
        subject.send_via(immediate){|value| actual = value }
        expect(actual).to eq expected
      end

      specify 'the given block will be passed any provided arguments' do
        actual = nil
        expected = [1, 2, 3, 4]
        subject = Agent.new(0)
        subject.send_via(immediate, *expected){|_, *args| actual = args }
        expect(actual).to eq expected
      end

      specify 'the return value will be passed to the validator function' do
        actual = nil
        expected = 42
        validator = ->(new_value){ actual = new_value; true }
        subject = Agent.new(0, validator: validator)
        subject.send_via(immediate){ expected }
        expect(actual).to eq expected
      end

      specify 'upon validation the new value will be set to the block return value' do
        actual = nil
        expected = 42
        validator = ->(new_value){ true }
        subject = Agent.new(0, validator: validator)
        subject.send_via(immediate){ expected }
        expect(subject.value).to eq expected
      end

      specify 'on success all observers will be notified' do
        observer_class = Class.new do
          def initialize(bucket)
            @bucket = bucket
          end
          def update(time, old_value, new_value)
            @bucket.concat([time, old_value, new_value])
          end
        end

        bucket = []
        subject = Agent.new(0)
        subject.add_observer(observer_class.new(bucket))
        subject.send_via(immediate){ 42 }

        expect(bucket[0]).to be_a Time
        expect(bucket[1]).to eq 0
        expect(bucket[2]).to eq 42
      end

      specify 'any recursive action dispatches will run after the value has been updated' do
        subject = Agent.new(0)

        subject.send_via(executor, subject) do |v1, a1|
          expect(v1).to eq 0
          a1.send_via(executor, a1) do |v2, a2|
            expect(v2).to eq 1
            a1.send_via(executor, a2) do |v3, a3|
              expect(v3).to eq 2
              3
            end
            2
          end
          1
        end
      end

      specify 'when the action raises an error the value will not change' do
        expected = 0
        subject = Agent.new(expected)
        subject.send_via(immediate){ raise StandardError }
        expect(subject.value).to eq expected
      end

      specify 'when the action raises an error the validator will not be called' do
        validator_called = false
        validator = ->(new_value){ validator_called = true }
        subject = Agent.new(0, validator: validator)
        subject.send_via(immediate){ raise StandareError }
        expect(validator_called).to be false
      end

      specify 'when validation returns false the value will not change' do
        expected = 0
        validator = ->(new_value){ false }
        subject = Agent.new(0, validator: validator)
        subject.send_via(immediate){ 42 }
        expect(subject.value).to eq expected
      end

      specify 'when validation raises an error the value will not change' do
        expected = 0
        validator = ->(new_value){ raise StandareError }
        subject = Agent.new(0, validator: validator)
        subject.send_via(immediate){ 42 }
        expect(subject.value).to eq expected
      end

      specify 'when the action raises an error the handler will be called' do
        error_handler_called = false
        error_handler = ->(agent, exception){ error_handler_called = true }
        subject = Agent.new(0, error_handler: error_handler)
        subject.send_via(immediate){ raise StandardError }
        expect(error_handler_called).to be true
      end

      specify 'when validation fails the handler will be called' do
        error_handler_called = false
        error_handler = ->(agent, exception){ error_handler_called = true }
        validator = ->(new_value){ false }
        subject = Agent.new(0, error_handler: error_handler, validator: validator)
        subject.send_via(immediate){ 42 }
        expect(error_handler_called).to be true
      end

      specify 'when validation raises an error the handler will be called' do
        error_handler_called = false
        error_handler = ->(agent, exception){ error_handler_called = true }
        validator = ->(new_value){ raise StandardError }
        subject = Agent.new(0, error_handler: error_handler, validator: validator)
        subject.send_via(immediate){ 42 }
        expect(error_handler_called).to be true
      end
    end

    context 'validation' do

      it 'sets the new value when the validator returns true' 


      it 'rejects the new value when the validator returns false' 


      it 'rejects the new value when the validator raises an error' 


      it 'sets the error when the error mode is :fail and the validator returns false' 


      it 'sets the error when the error mode is :fail and the validator raises an error' 


      it 'does not set an error when the error mode is :continue and the validator returns false' 


      it 'does not set an error when the error mode is :continue and the validator raises an error' 


      it 'does not trigger observation when validation fails' 

    end

    context 'error handling' do

      specify 'the agent will be passed to the handler' do
        actual = nil
        error_handler = ->(agent, error){ actual = agent }
        subject = Agent.new(0, error_handler: error_handler)
        subject.send_via(immediate){ raise StandardError}
        expect(actual).to eq subject
      end

      specify 'the exception will be passed to the handler' do
        expected = StandardError.new
        actual = nil
        error_handler = ->(agent, error){ actual = error }
        subject = Agent.new(0, error_handler: error_handler)
        subject.send_via(immediate){ raise expected}
        expect(actual).to eq expected
      end

      specify 'does not trigger observation' do
        observer_class = Class.new do
          attr_reader :count
          def initialize
            @count = 0
          end
          def update(time, old_value, new_value)
            @count += 1
          end
        end

        observer = observer_class.new
        subject = Agent.new(0)
        subject.add_observer(observer)
        subject.send_via(immediate){ raise StandardError }

        expect(observer.count).to eq 0
      end
    end

    context 'error mode' do

      context ':continue' do

        it 'does not set an error when the validator returns false' 


        it 'does not set an error when the validator raises an error' 


        it 'does not set an error when the action raises an error' 


        it 'does not block further action processing' 


        it 'sets #failed? to false' 

      end

      context ':fail' do

        it 'sets the error when the validator returns false' 


        it 'sets the error when the validator raises an error' 


        it 'sets the error when the action raises an error' 


        it 'blocks all further action processing until a restart' 


        it 'sets #failed? to true' 

      end
    end

    context 'nested actions' do

      specify 'occur in the order they ar post' do
        actual = []
        expected = [0, 1, 2, 3, 4]
        latch = Concurrent::CountDownLatch.new
        subject = Agent.new(0)

        subject.send_via(executor, subject) do |v1, a1|
          a1.send_via(executor, a1) do |v2, a2|
            a1.send_via(executor, a2) do |v3, a3|
              a1.send_via(executor, a3) do |v4, a4|
                a1.send_via(executor, a4) do |v5, a5|
                  actual << v5; latch.count_down
                end
                actual << v4; v4 + 1
              end
              actual << v3; v3 + 1
            end
            actual << v2; v2 + 1
          end
          actual << v1; v1 + 1
        end

        latch.wait(2)
        expect(actual).to eq expected
      end

      specify 'work with immediate execution' do
        actual = []
        expected = [0, 1, 2]
        subject = Agent.new(0)

        subject.send_via(immediate) do |v1|
          subject.send_via(immediate) do |v2|
            subject.send_via(immediate) do |v3|
              actual << v3
            end
            actual << v2; v2 + 1
          end
          actual << v1; v1 + 1
        end

        expect(actual).to eq expected
      end
    end

    context 'posting' do

      context 'with #send' do

        it 'returns true when the job is post' 


        it 'returns false when #failed?' 


        it 'posts to the global fast executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #send!' do

        it 'returns true when the job is post' 


        it 'raises an error when #failed?' 


        it 'posts to the global fast executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #send_off' do

        it 'returns true when the job is post' 


        it 'returns false when #failed?' 


        it 'posts to the global io executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #send_off!' do

        it 'returns true when the job is post' 


        it 'raises an error when #failed?' 


        it 'posts to the global io executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #send_via' do

        it 'returns true when the job is post' 


        it 'returns false when #failed?' 


        it 'posts to the given executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #send_via!' do

        it 'returns true when the job is post' 


        it 'raises an error when #failed?' 


        it 'posts to the given executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #post' do

        it 'returns true when the job is post' 


        it 'returns false when #failed?' 


        it 'posts to the global io executor' 


        it 'does not wait for the action to process' 

      end

      context 'with #<<' do

        it 'returns self when the job is post' 


        it 'returns self when #failed?' 


        it 'posts to the global io executor' 


        it 'does not wait for the action to process' 

      end
    end

    context '#restart' do

      context 'when #failed?' do

        it 'raises an error if the new value is not valid' 


        it 'sets the new value' 


        it 'clears the error' 


        it 'sets #failed? to true' 


        it 'removes all actions from the queue when :clear_actions is true' 


        it 'does not clear the action queue when :clear_actions is false' 


        it 'does not clear the action queue when :clear_actions is not given' 


        it 'resumes action processing if actions are enqueued' 


        it 'does not trigger observation' 

      end

      context 'when not #failed?' do

        it 'raises an error' 

      end
    end

    context 'waiting' do

      context 'the await job' do

        it 'does not change the value' 


        it 'does not trigger the error mode' 


        it 'does not trigger observers' 


        it 'waits for nested actions' 

      end

      context 'with #await' do

        it 'returns self when there are no pending actions' 


        it 'does not block on actions from other threads' 


        it 'blocks indefinitely' 


        it 'returns true when all prior actions have processed' 


        it 'blocks forever if restarted with :clear_actions true', notravis: true do
          pending('the timing is nearly impossible'); fail
          subject = Agent.new(0, error_mode: :fail)

          t = Thread.new do
            subject.send_via(executor){ sleep(0.1) }
            subject.send_via(executor){ raise StandardError }
            subject.send_via(executor){ nil }
            Thread.new{ subject.restart(42, clear_actions: true) }
            subject.await
          end

          thread_status = t.join(0.3)
          t.kill

          expect(thread_status).to be nil
        end
      end

      context 'with #await_for' do

        it 'returns true when there are no pending actions' 


        it 'does not block on actions from other threads' 


        it 'returns true when all prior actions have processed', buggy: true do
          subject = Agent.new(0)
          subject.send_via(executor){ sleep(1) }
          5.times{ subject.send_via(executor){ nil } }
          expect(subject.await_for(10)).to be true
        end

        it 'returns false on timeout' 


        it 'returns false if restarted with :clear_actions true', notravis: true do
          pending('the timing is nearly impossible'); fail
          subject = Agent.new(0, error_mode: :fail)

          subject.send_via(executor){ sleep(0.1) }
          subject.send_via(executor){ raise StandardError }
          subject.send_via(executor){ nil }

          t = Thread.new{ subject.restart(42, clear_actions: true) }
          ok = subject.await_for(0.2)

          expect(ok).to be false
        end
      end

      context 'with #await_for!' do

        it 'returns true when there are no pending actions' 


        it 'does not block on actions from other threads' 


        it 'returns true when all prior actions have processed' 


        it 'raises an error on timeout' 


        it 'raises an error if restarted with :clear_actions true', notravis: true do
          pending('the timing is nearly impossible'); fail
          subject = Agent.new(0, error_mode: :fail)

          subject.send_via(executor){ sleep(0.1) }
          subject.send_via(executor){ raise StandardError }
          subject.send_via(executor){ nil }

          t = Thread.new{ subject.restart(42, clear_actions: true) }

          expect {
            subject.await_for!(0.2)
          }.to raise_error(Concurrent::TimeoutError)
        end
      end

      context 'with #wait' do

        it 'returns true when there are no pending actions and timeout is nil' 


        it 'returns true when there are no pending actions and a timeout is given' 


        it 'does not block on actions from other threads' 


        it 'blocks indefinitely when timeout is nil' 


        it 'blocks forever when timeout is nil and restarted with :clear_actions true', notravis: true do
          pending('the timing is nearly impossible'); fail
          subject = Agent.new(0, error_mode: :fail)

          t = Thread.new do
            subject.send_via(executor){ sleep(0.1) }
            subject.send_via(executor){ raise StandardError }
            subject.send_via(executor){ nil }
            Thread.new{ subject.restart(42, clear_actions: true) }
            subject.wait(nil)
          end

          thread_status = t.join(0.3)
          t.kill

          expect(thread_status).to be nil
        end

        it 'returns true when all prior actions have processed' 


        it 'returns false on timeout' 


        it 'returns false when timeout is given and restarted with :clear_actions true', notravis: true do
          pending('the timing is nearly impossible'); fail
          subject = Agent.new(0, error_mode: :fail)

          subject.send_via(executor){ sleep(0.1) }
          subject.send_via(executor){ raise StandardError }
          subject.send_via(executor){ nil }

          t = Thread.new{ subject.restart(42, clear_actions: true) }
          ok = subject.wait(0.2)

          expect(ok).to be false
        end
      end

      context 'with .await' do

        it 'returns true when all prior actions on all agents have processed' 

      end

      context 'with .await_for' do

        it 'returns true when there are no pending actions' 


        it 'returns true when all prior actions for all agents have processed' 


        it 'returns false on timeout' 

      end

      context 'with await_for!' do

        it 'returns true when there are no pending actions' 


        it 'returns true when all prior actions for all agents have processed' 


        it 'raises an exception on timeout' 

      end
    end

    context :observable do

      subject { Agent.new(0) }

      def trigger_observable(observable)
        observable.send_via(immediate){ 42 }
      end

      it_behaves_like :observable
    end
  end
end

