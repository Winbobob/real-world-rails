
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#every' do

    it 'adds a job' 


    it 'triggers a job (2 times)' 


    it 'does not remove the job after execution' 


    it 'raises on negative frequencies' 


    it 'raises on zero frequencies' 


    it 'does not reschedule if the job was unscheduled' 


    it 'raises if the job frequency is higher than the scheduler frequency' 

  end

  describe '#schedule_every' do

    it 'accepts a duration string' 

  end
end


