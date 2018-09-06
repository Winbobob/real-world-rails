
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

  describe '#at' do

    it 'raises if the block to schedule is missing' 


    it 'returns a job id' 


    it 'returns a job if :job => true' 


    it 'adds a job' 


    it 'triggers a job' 


    it 'removes the job after execution' 


    it 'accepts a Time instance' 


    it 'accepts a time string' 


    it 'accepts a time string with a delta timezone' 


    it 'accepts a time string with a named timezone' 


    it 'accepts a Chronic string (if Chronic is present)' 


    it 'accepts a Chronic string and Chronic options (if Chronic present)' 


    it 'accepts an ActiveSupport time thinggy'
  end

  describe '#schedule_at' do

    it 'returns a job' 

  end
end


