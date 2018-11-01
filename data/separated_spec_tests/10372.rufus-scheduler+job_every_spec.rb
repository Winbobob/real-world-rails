
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::EveryJob do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  it 'triggers as expected' 


#  it 'strives to follow the given frequency (gh-181)' do
#
#    duration = 60 * 60
#    a = [ [ 0, Time.now ] ]
#
#    @scheduler.every '60s' do |x|
#      n = Time.now
#      d = n - a.last[1]
#      a << [ d, n ]
#      print "#{d}"
#      print d >= 61 ? "...!!! " : " "
#    end
#
#    sleep duration
#  end

  it 'lets its @next_time change in-flight' 


  context 'summer time' do

    it 'triggers correctly through a DST transition' 

  end

  context 'first_at/in' do

    it 'triggers for the first time at first_at' 


    it 'triggers for the first time at first_in' 


    it 'triggers once at first then repeatedly after the assigned time' 


    describe '#first_at=' do

      it 'alters @next_time' 

    end

    describe '#previous_time' do

      it 'returns the previous #time' 

    end
  end
end


