
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::AtJob do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#unschedule' do

    it 'unschedules the job' 

  end

  describe '#scheduled_at' do

    it 'returns the Time at which the job got scheduled' 

  end

  describe '#time' do

    it 'returns the time at which the job will trigger' 

  end

  describe '#previous_time' do

    it 'returns the previous #time' 

  end
end


