
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::IntervalJob do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#interval' do

    it 'returns the scheduled interval' 

  end

  context 'first_at/in' do

    it 'triggers for the first time at first_at' 


    describe '#first_at=' do

      it 'alters @next_time' 

    end
  end
end


