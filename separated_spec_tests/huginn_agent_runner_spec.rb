require 'rails_helper'

describe AgentRunner do
  context "without traps" do
    before do
      stub.instance_of(Rufus::Scheduler).every
      stub.instance_of(AgentRunner).set_traps
      @agent_runner = AgentRunner.new
    end

    after(:each) do
      @agent_runner.stop
      AgentRunner.class_variable_set(:@@agents, [])
    end

    context "#run" do
      before do
        mock(@agent_runner).run_workers
      end

      it "runs until stop is called" 


      it "handles signals" 

    end

    context "#load_workers" do
      before do
        AgentRunner.class_variable_set(:@@agents, [HuginnScheduler, DelayedJobWorker])
      end

      it "loads all workers" 


      it "loads only the workers specified in the :only option" 


      it "does not load workers specified in the :except option" 

    end

    context "running workers" do
      before do
        AgentRunner.class_variable_set(:@@agents, [HuginnScheduler, DelayedJobWorker])
        stub.instance_of(HuginnScheduler).setup
        stub.instance_of(DelayedJobWorker).setup
      end

      context "#run_workers" do
        it "runs all the workers" 


        it "kills no long active workers" 

      end

      context "#restart_dead_workers" do
        before do
          mock.instance_of(HuginnScheduler).run!
          mock.instance_of(DelayedJobWorker).run!
          @agent_runner.send(:run_workers)

        end
        it "restarts dead workers" 

      end
    end
  end

  context "#set_traps" do
    it "sets traps for INT TERM and QUIT" 

  end
end

