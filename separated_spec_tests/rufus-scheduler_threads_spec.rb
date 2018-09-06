
#
# Specifying rufus-scheduler
#
# Thu Jul 25 05:53:51 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  context 'thread pool' do

    it 'starts with an empty thread pool' 


    it 'does not cross the max_work_threads threshold' 


    it 'does not cross the max_work_threads threshold (overlap: false)' 


    it 'does not execute unscheduled jobs' 

  end
end


