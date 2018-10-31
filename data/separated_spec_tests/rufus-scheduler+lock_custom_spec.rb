
#
# Specifying rufus-scheduler
#
# Fri Nov  1 05:56:03 JST 2013
#
# Ishinomaki
#

require 'spec_helper'


describe Rufus::Scheduler do

  class LosingLockScheduler < Rufus::Scheduler

    attr_reader :counter

    def initialize
      super
      @counter = 0
    end

    def confirm_lock
      @counter = @counter + 1
      false
    end
  end

  context 'custom locks' do

    it 'does not trigger when #confirm_lock returns false' 

  end
end


