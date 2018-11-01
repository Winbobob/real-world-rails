
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

  describe '#in' do

    it 'adds a job' 


    it 'triggers a job' 


    it 'removes the job after execution' 

  end

  describe '#schedule_in' do

    it 'accepts a number' 


    it 'accepts a duration string' 


    it 'accepts an ActiveSupport .from_now thinggy'
      #
      #   schedule_in(2.days.from_now)
      #
      # that'd simply require "in" to be a bit like "at"...
  end
end


