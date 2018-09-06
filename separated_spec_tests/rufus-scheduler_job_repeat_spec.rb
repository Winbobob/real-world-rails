
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::RepeatJob do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#pause' do

    it 'pauses the job' 

  end

  describe '#paused?' do

    it 'returns true if the job is paused' 


    it 'returns false if the job is not paused' 

  end

  describe '#resume' do

    it 'resumes a paused job' 


    it 'has no effect on a not paused job' 

  end

  describe ':times => i' do

    it 'lets a job unschedule itself after i times' 


    it 'is OK when passed a nil instead of an integer' 


    it 'raises when passed something else than nil or an integer' 

  end

  describe ':first/:first_in/:first_at => point in time' do

    it 'accepts a Time instance' 


    it 'accepts a time string' 


    it 'only lets the job trigger after the :first' 


    it 'raises on points in the past' 


    context ':first_time => :now/:immediately/0' do

      it 'schedules the first execution immediately (:first => :now)' 


      it 'schedules the first execution immediately (:first_in => 0)' 


      it 'schedules the first execution immediately (:first_in => "0s")' 

    end
  end

  describe ':first/:first_in/:first_at => duration' do

    it 'accepts a duration string' 


    it 'accepts a duration in seconds (integer)' 


    it 'raises if the argument cannot be used' 

  end

  describe '#first_at=' do

    it 'can be used to set first_at directly' 

  end

  describe ':last/:last_in/:last_at => point in time' do

    it 'accepts a Time instance' 


    it 'unschedules the job after the last_at time' 


    it 'accepts a time string' 


    it 'raises on a point in the past' 

  end

  describe ':last/:last_in/:last_at => duration' do

    it 'accepts a duration string' 


    it 'accepts a duration in seconds (integer)' 


    it 'raises if the argument is worthless' 

  end

  describe '#last_at=' do

    it 'can be used to set last_at directly' 

  end

  describe '#count' do

    it 'starts at 0' 


    it 'keeps track of how many times the job fired' 

  end

  describe '#trigger_off_schedule' do

    it 'calls the job' 


    it 'flags the job as running' 

  end
end


