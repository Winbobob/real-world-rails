
#
# Specifying rufus-scheduler
#
# Wed Apr 17 06:00:59 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler::JobArray do

  class DummyJob < Struct.new(:id, :next_time); end

  before(:each) do
    @array = Rufus::Scheduler::JobArray.new
  end

  describe '#push' do

    it 'pushes jobs' 


    it 'pushes and remove duplicates' 

  end
end


