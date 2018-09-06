
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::Job do

  # specify behaviours common to all job classes

  before :each do

    @taoe = Thread.abort_on_exception
    Thread.abort_on_exception = false

    @ose = $stderr
    $stderr = StringIO.new

    @scheduler = Rufus::Scheduler.new
  end

  after :each do

    @scheduler.shutdown

    Thread.abort_on_exception = @taoe

    $stderr = @ose
  end

  describe '#last_time' do

    it 'returns nil if the job never fired' 


    it 'returns the last time the job fired' 

  end

  describe '#threads' do

    it 'returns an empty list when the job is not running' 


    it 'returns an empty list after the job terminated' 


    it 'lists the threads the job currently runs in' 

  end

  describe '#kill' do

    it 'has no effect if the job is not running' 


    it 'makes the threads vacant' 

  end

  describe '#running?' do

    it 'returns false when the job is not running in any thread' 


    it 'returns true when the job is running in at least one thread' 

  end

  describe '#scheduled?' do

    it 'returns true when the job is scheduled' 


    it 'returns false when the job is not scheduled' 


    it 'returns true for repeat jobs that are running' 


    it 'returns false if job is unscheduled' 

  end

  describe '#call' do

    it 'calls the job (like it were a proc)' 

  end

  describe '#call(true)' do

    it 'calls the job and let the scheduler handle errors' 

  end

  describe '#call(false)' do

    it 'calls the job and let errors slip through' 

  end

  context 'job-local variables' do

    describe '#[]=' do

      it 'sets a job-local variable' 

    end

    describe '#[]' do

      it 'returns nil if there is no such entry' 


      it 'returns the value of a job-local variable' 

    end

    describe '#key?' do

      it 'returns true if there is an entry with the given key' 

    end

    describe '#keys' do

      it 'returns the array of keys of the job-local variables' 

    end
  end

  context ':tag / :tags => [ t0, t1 ]' do

    it 'accepts one tag' 


    it 'accepts an array of tags' 


    it 'turns tags into strings' 

  end

  context ':blocking => true' do

    it 'runs the job in the same thread as the scheduler thread' 

  end

  context 'default one thread per job behaviour' do

    it 'runs the job in a dedicated thread' 

  end

  context ':allow_overlapping / :allow_overlap / :overlap' do

    context 'default (:overlap => true)' do

      it 'lets a job overlap itself' 

    end

    context 'when :overlap => false' do

      it 'prevents a job from overlapping itself' 

    end
  end

  context ':mutex' do

    context ':mutex => "mutex_name"' do

      it 'prevents concurrent executions' 

    end

    context ':mutex => mutex_instance' do

      it 'prevents concurrent executions' 

    end

    context ':mutex => [ array_of_mutex_names_or_instances ]' do

      it 'prevents concurrent executions' 

    end
  end

  context ':timeout => duration_or_point_in_time' do

    it 'interrupts the job it is stashed to (duration)' 


    it 'interrupts the job it is stashed to (point in time)' 


    it 'starts timing when the job enters successfully all its mutexes' 


    it 'emits the timeout information to $stderr (default #on_error)' 


    it 'does not prevent a repeat job from recurring' 

  end

  context 'work time' do

    describe '#last_work_time' do

      it 'starts at 0' 


      it 'keeps track of how long the work was upon last trigger' 

    end

    describe '#mean_work_time' do

      it 'starts at 0' 


      it 'gathers work times and computes the mean' 

    end
  end

  context 'one time job' do

    describe '#determine_id' do

      it 'returns unique ids' 

    end
  end

  context 'repeat job' do

    describe '#determine_id' do

      it 'returns unique ids' 

    end
  end
end


