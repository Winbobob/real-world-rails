require 'rails_helper'

describe LongRunnable do
  class LongRunnableAgent < Agent
    include LongRunnable

    def default_options
      {test: 'test'}
    end
  end

  before(:each) do
    @agent = LongRunnableAgent.new
  end

  it "start_worker? defaults to true" 


  it "should build the worker_id" 


  context "#setup_worker" do
    it "returns active agent workers" 


    it "returns an empty array when no agent is active" 

  end

  describe LongRunnable::Worker do
    before(:each) do
      @agent = Object.new
      @worker = LongRunnable::Worker.new(agent: @agent, id: 'test1234')
      @scheduler = Rufus::Scheduler.new
      @worker.setup!(@scheduler, Mutex.new)
    end

    after(:each) do
      @worker.thread.terminate if @worker.thread && !@skip_thread_terminate
      @scheduler.shutdown(:wait)
    end

    it "calls boolify of the agent" 


    it "expects run to be overriden" 


    context "#run!" do
      it "runs the agent worker" 


      it "stops when rescueing a SystemExit" 


      it "creates an agent log entry for a generic exception" 

    end

    context "#stop!" do
      it "terminates the thread" 


      it "gracefully stops the worker" 

    end

    context "#terminate_thread!" do
      before do
        @skip_thread_terminate = true
        mock_thread = Object.new
        stub(@worker).thread { mock_thread }
      end

      it "terminates the thread" 


      it "wakes up sleeping threads after termination" 

    end

    context "#restart!" do
      it "stops, setups and starts the worker" 

    end

    context "scheduling" do
      it "schedules tasks once" 


      it "schedules repeating tasks" 


      it "allows the cron syntax" 

    end
  end
end

