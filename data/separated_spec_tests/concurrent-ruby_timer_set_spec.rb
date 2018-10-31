require 'timecop'

module Concurrent

  RSpec.describe TimerSet do

    let(:executor){ Concurrent::ImmediateExecutor.new }
    subject{ TimerSet.new(executor: executor) }

    after(:each){ subject.kill }

    context 'construction' do

      before(:all) do
        reset_gem_configuration
      end

      after(:each) do
        reset_gem_configuration
      end

      it 'uses the executor given at construction' 


      it 'uses the global io executor be default' 

    end

    context '#post' do

      it 'raises an exception when given a task with a delay less than zero' 


      it 'raises an exception when no block given' 


      it 'immediately posts a task when the delay is zero' 

    end

    context 'execution' do

      it 'executes a given task when given an interval in seconds' 


      it 'returns an IVar when posting a task' 


      it 'executes a given task when given an interval in seconds, even if longer tasks have been scheduled' 


      it 'passes all arguments to the task on execution' 


      it 'does not execute tasks early' 


      it 'executes all tasks scheduled for the same time' 


      it 'executes tasks with different times in schedule order' 


      it 'executes tasks with different times in schedule time' 


      it 'continues to execute new tasks even after the queue is emptied' 

    end

    context 'resolution' do

      it 'sets the IVar value on success when delay is zero' 


      it 'sets the IVar value on success when given a delay' 


      it 'sets the IVar reason on failure when delay is zero' 


      it 'sets the IVar reason on failure when given a delay' 

    end

    context 'task cancellation' do

      after(:each) do
        Timecop.return
      end

      it 'fails to cancel the task once processing has begun' 


      it 'fails to cancel the task once processing is complete' 


      it 'cancels a pending task' 


      it 'returns false when not running' 

    end

    context 'task rescheduling' do

      let(:queue) { subject.instance_variable_get(:@queue) }

      it 'raises an exception when given an invalid time' 


      it 'does not change the current schedule when given an invalid time' 


      it 'reschdules a pending and unpost task when given a valid time' 


      it 'returns false once the task has been post to the executor' 


      it 'returns false once the task is processing' 


      it 'returns false once the task has is complete' 


      it 'returns false when not running' 

    end

    context 'task resetting' do

      it 'calls #reschedule with the original delay' 

    end

    context 'termination' do

      it 'cancels all pending tasks on #shutdown' 


      it 'cancels all pending tasks on #kill' 


      it 'stops the monitor thread on #shutdown' 


      it 'kills the monitor thread on #kill' 


      it 'rejects tasks once shutdown' 


      it 'rejects tasks once killed' 


      specify '#wait_for_termination returns true if shutdown completes before timeout' do
        latch = Concurrent::CountDownLatch.new(1)
        subject.post(0){ latch.count_down }
        latch.wait(1)
        subject.shutdown
        expect(subject.wait_for_termination(0.1)).to be_truthy
      end

      specify '#wait_for_termination returns false on timeout' do
        latch = Concurrent::CountDownLatch.new(1)
        subject.post(0){ latch.count_down }
        latch.wait(0.1)
        # do not call shutdown -- force timeout
        expect(subject.wait_for_termination(0.1)).to be_falsey
      end
    end

    context 'state' do

      it 'is running? when first created' 


      it 'is running? after tasks have been post' 


      it 'is shutdown? after shutdown completes' 


      it 'is shutdown? after being killed' 

    end
  end
end

