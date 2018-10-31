
#
# Specifying rufus-scheduler
#
# Wed Aug  7 06:20:55 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#interval' do

    it 'adds a job' 


    it 'triggers a job (2 times)' 


    it 'triggers, but reschedules after the trigger execution' 


    it 'does not reschedule if the job was unscheduled' 


    it 'raises on negative intervals' 


    it 'raises on zero intervals' 


    #it 'raises if the job frequency is higher than the scheduler frequency' do
    #
    #  @scheduler.frequency = 10
    #
    #  lambda {
    #    @scheduler.interval '1s' do; end
    #  }.should raise_error(ArgumentError)
    #end
  end

  describe '#schedule_interval' do

    it 'accepts a duration string' 

  end
end


