
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  describe '#initialize' do

    it 'starts the scheduler thread' 


    it 'sets :name and :rufus_scheduler in the scheduler thread local vars' 


    it 'accepts a :frequency => integer option' 


    it 'accepts a :frequency => "2h1m" option' 


    it 'accepts a :thread_name option' 


    #it 'accepts a :min_work_threads option' do
    #  scheduler = Rufus::Scheduler.new(:min_work_threads => 9)
    #  scheduler.min_work_threads.should == 9
    #end

    it 'accepts a :max_work_threads option' 

  end

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe 'a schedule method' do

    it 'passes the job to its block when it triggers' 


    it 'passes the trigger time as second block argument' 


    class MyHandler
      attr_reader :counter
      def initialize
        @counter = 0
      end
      def call(job, time)
        @counter = @counter + 1
      end
    end

    it 'accepts a callable object instead of a block' 


    class MyOtherHandler
      attr_reader :counter
      def initialize
        @counter = 0
      end
      def call
        @counter = @counter + 1
      end
    end

    it 'accepts a callable obj instead of a block (#call with no args)' 


    it 'accepts a class as callable' 


    it 'raises if the scheduler is shutting down' 

  end

  describe '#in / #at' do

    # scheduler.in(2.hours.from_now) { ... }

    it 'accepts point in time and duration indifferently (#in)' 


    it 'accepts point in time and duration indifferently (#at)' 

  end

  describe '#schedule' do

    it 'accepts a duration and schedules an InJob' 


    it 'accepts a point in time and schedules an AtJob' 


    it 'accepts a cron string and schedules a CronJob' 

  end

  describe '#repeat' do

    it 'accepts a duration and schedules an EveryJob' 


    it 'accepts a cron string and schedules a CronJob' 

  end

  describe '#unschedule(job_or_work_id)' do

    it 'accepts job ids' 


    it 'accepts jobs' 


    it 'carefully unschedules repeat jobs' 

  end

  describe '#uptime' do

    it 'returns the uptime as a float' 

  end

  describe '#uptime_s' do

    it 'returns the uptime as a human readable string' 

  end

  describe '#join' do

    it 'joins the scheduler thread' 

  end

  describe '#job(job_id)' do

    it 'returns nil if there is no corresponding Job instance' 


    it 'returns the corresponding Job instance' 

  end

#    describe '#find_by_tag(t)' do
#
#      it 'returns an empty list when there are no jobs with the given tag' do
#
#        @scheduler.find_by_tag('nada').should == []
#      end
#
#      it 'returns all the jobs with the given tag' do
#
#        @scheduler.in '10d', :tag => 't0' do; end
#        @scheduler.every '2h', :tag => %w[ t0 t1 ] do; end
#        @scheduler.every '3h' do; end
#
#        @scheduler.find_by_tag('t0').map(&:original).should ==
#          %w[ 2h 10d ]
#        @scheduler.find_by_tag('t1').map(&:original).should ==
#          %w[ 2h ]
#        @scheduler.find_by_tag('t1', 't0').map(&:original).sort.should ==
#          %w[ 2h ]
#      end
#    end

  describe '#threads' do

    it 'just lists the main thread (scheduler thread) when no job is scheduled' 


    it 'lists all the threads a scheduler uses' 

  end

  describe '#work_threads(:all | :vacant)' do

    it 'returns an empty array when the scheduler has not yet done anything' 


    it 'lists the [vacant] work threads in the pool' 

  end

  describe '#work_threads(:active)' do

    it 'returns [] when there are no jobs running' 


    it 'returns the list of threads of the running jobs' 


    it 'does not return threads from other schedulers' 

  end

  #describe '#min_work_threads' do
  #  it 'returns the min job thread count' do
  #    @scheduler.min_work_threads.should == 3
  #  end
  #end
  #describe '#min_work_threads=' do
  #  it 'sets the min job thread count' do
  #    @scheduler.min_work_threads = 1
  #    @scheduler.min_work_threads.should == 1
  #  end
  #end

  describe '#max_work_threads' do

    it 'returns the max job thread count' 

  end

  describe '#max_work_threads=' do

    it 'sets the max job thread count' 

  end

  #describe '#kill_all_work_threads' do
  #
  #  it 'kills all the work threads' do
  #
  #    @scheduler.in '0s' do; sleep(5); end
  #    @scheduler.in '0s' do; sleep(5); end
  #    @scheduler.in '0s' do; sleep(5); end
  #
  #    sleep 0.5
  #
  #    @scheduler.work_threads.size.should == 3
  #
  #    @scheduler.send(:kill_all_work_threads)
  #
  #    sleep 0.5
  #
  #    @scheduler.work_threads.size.should == 0
  #  end
  #end

  describe '#running_jobs' do

    it 'returns [] when there are no running jobs' 


    it 'returns a list of running Job instances' 


    it 'does not return twice the same job' 

  end

  describe '#running_jobs(:tag/:tags => x)' do

    it 'returns a list of running jobs filtered by tag' 

  end

  describe '#occurrences(time0, time1)' do

    it 'returns a { job => [ times ] } of job occurrences' 


    it 'returns a [ [ time, job ], ... ] of job occurrences when :timeline' 


    it 'respects :first_at for repeat jobs' 


    it 'respects :times for repeat jobs' 

  end

  describe '#timeline' do

    it 'returns a [ [ time, job ], ... ] of job occurrences' 


    it 'should not lock when running timeline with a :first_at specified' 

  end

  #--
  # management methods
  #++

  describe '#shutdown' do

    it 'blanks the uptime' 


    it 'shuts the scheduler down' 


    it 'has a #stop alias' 


    #it 'has a #close alias'
  end

  describe '#shutdown(:wait)' do

    it 'shuts down and blocks until all the jobs ended their current runs' 

  end

  describe '#shutdown(:kill)' do

    it 'kills all the jobs and then shuts down' 

  end

  describe '#pause' do

    it 'pauses the scheduler' 

  end

  describe '#resume' do

    it 'works' 

  end

  describe '#paused?' do

    it 'returns true if the scheduler is paused' 


    it 'returns false if the scheduler is not paused' 

  end

  describe '#down?' do

    it 'returns true when the scheduler is down' 


    it 'returns false when the scheduler is up' 

  end

  describe '#up?' do

    it 'returns true when the scheduler is up' 

  end

  #--
  # job methods
  #++

  describe '#jobs' do

    it 'is empty at the beginning' 


    it 'returns the list of scheduled jobs' 


    it 'returns all the jobs (even those pending reschedule)' 


    it 'does not return unscheduled jobs' 

  end

  describe '#jobs(:tag / :tags => x)' do

    it 'returns [] when there are no jobs with the corresponding tag' 


    it 'returns the jobs with the corresponding tag' 

  end

  describe '#every_jobs' do

    it 'returns EveryJob instances' 

  end

  describe '#at_jobs' do

    it 'returns AtJob instances' 

  end

  describe '#in_jobs' do

    it 'returns InJob instances' 

  end

  describe '#cron_jobs' do

    it 'returns CronJob instances' 

  end

  describe '#interval_jobs' do

    it 'returns IntervalJob instances' 

  end

  #--
  # callbacks
  #++

  describe '#on_pre_trigger' do

    it 'is called right before a job triggers' 


    it 'accepts the job and the triggerTime as argument' 


    context 'when it returns false' do

      it 'prevents the job from triggering' 

    end
  end

  describe '#on_post_trigger' do

    it 'is called right after a job triggers' 

  end

  #--
  # misc
  #++

  describe '.singleton / .s' do

    before(:each) do

      Rufus::Scheduler.class_eval { @singleton = nil } # ;-)
    end

    it 'returns a singleton instance of the scheduler' 


    it 'accepts initialization parameters' 

  end
end


