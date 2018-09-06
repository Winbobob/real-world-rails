
#
# Specifying rufus-scheduler
#
# Sat Aug 13 21:00:31 JST 2016
#

require 'spec_helper'


describe Rufus::Scheduler do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#schedule' do

    it 'leaves the schedule option hash untouched (2 args)' 


    it 'leaves the schedule option hash untouched (3 args)' 


    it 'accepts a CronLine instance' 

  end

  describe '#at' do

    it 'leaves the schedule option hash untouched (2 args)' 


    it 'leaves the schedule option hash untouched (3 args)' 

  end
end


