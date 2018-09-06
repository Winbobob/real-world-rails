
#
# Specifying rufus-scheduler
#
# Sat Aug 16 05:42:11 JST 2014
# added by @ecin
#

require 'spec_helper'


describe Rufus::Scheduler do

  context "when running multiple schedulers side-by-side" do

    class AlwaysLock
      def lock; true; end
      def unlock; true; end
      def locked?; true; end
    end

    class NeverLock
      def lock; false; end
      def unlock; true; end
      def locked?; true; end
    end

    it "only starts if it can acquire a scheduler lock" 


    it "only triggers jobs when it can acquire a trigger lock" 

  end
end


