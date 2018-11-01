require 'rails_helper'
require 'huginn_scheduler'

describe HuginnScheduler do
  before(:each) do
    @rufus_scheduler = Rufus::Scheduler.new
    @scheduler = HuginnScheduler.new
    stub(@scheduler).setup {}
    @scheduler.setup!(@rufus_scheduler, Mutex.new)
  end

  after(:each) do
    @rufus_scheduler.shutdown(:wait)
  end

  it "schould register the schedules with the rufus scheduler and run" 


  it "should run scheduled agents" 


  it "should propagate events" 


  it "schould clean up expired events" 


  describe "#hour_to_schedule_name" do
    it "for 0h" 


    it "for the forenoon" 


    it "for 12h" 


    it "for the afternoon" 

  end

  describe "cleanup_failed_jobs!" do
    before do
      3.times do |i|
        Delayed::Job.create(failed_at: Time.now - i.minutes)
      end
      @keep = Delayed::Job.order(:failed_at)[1]
    end

    it "work with set FAILED_JOBS_TO_KEEP env variable" 



    it "work without the FAILED_JOBS_TO_KEEP env variable" 

  end

  context "#setup_worker" do
    it "should return an array with an instance of itself" 

  end
end

describe Rufus::Scheduler do
  before :each do
    Agent.delete_all

    @taoe, Thread.abort_on_exception = Thread.abort_on_exception, false
    @oso, @ose, $stdout, $stderr = $stdout, $stderr, StringIO.new, StringIO.new

    @scheduler = Rufus::Scheduler.new

    stub.any_instance_of(Agents::SchedulerAgent).second_precision_enabled { true }

    @agent1 = Agents::SchedulerAgent.new(name: 'Scheduler 1', options: { action: 'run', schedule: '*/1 * * * * *' }).tap { |a|
      a.user = users(:bob)
      a.save!
    }
    @agent2 = Agents::SchedulerAgent.new(name: 'Scheduler 2', options: { action: 'run', schedule: '*/1 * * * * *' }).tap { |a|
      a.user = users(:bob)
      a.save!
    }
  end

  after :each do
    @scheduler.shutdown(:wait)

    Thread.abort_on_exception = @taoe
    $stdout, $stderr = @oso, @ose
  end

  describe '#schedule_scheduler_agents' do
    it 'registers active SchedulerAgents' 


    it 'unregisters disabled SchedulerAgents' 


    it 'unregisters deleted SchedulerAgents' 

  end
end

