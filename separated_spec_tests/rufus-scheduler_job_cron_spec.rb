
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::CronJob do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  context 'normal' do

    it 'triggers near the zero second' 

  end

  #context 'sub-minute' do
  #
  #  it 'triggers near the zero second' do
  #
  #    job = @scheduler.schedule_cron '* * * * * *' do; end
  #
  #    sleep 1.5
  #
  #    p job.last_time
  #    p job.last_time.to_f
  #  end
  #end

  context 'first_at/in' do

    it 'does not trigger before first_at is reached' 


    it 'triggers for the first time at first_at' 

  end

  context 'scheduling the cron itself' do

    # for https://github.com/jmettraux/rufus-scheduler/issues/95
    #
    # schedule_cron takes more than 30 seconds, blocking...
    #
    it 'does not sit scheduling and blocking...' 

  end

  describe '#next_time' do

    it 'returns the next trigger time' 


    it 'returns the next trigger time (first_at => Time)' 

  end
end


