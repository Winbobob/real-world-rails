
#
# Specifying rufus-scheduler
#
# Fri Aug  9 07:10:18 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  before :each do

    @taoe = Thread.abort_on_exception
    Thread.abort_on_exception = false

    @ose = $stderr
    $stderr = StringIO.new

    @scheduler = Rufus::Scheduler.new
  end

  after :each do

    @scheduler.shutdown

    Thread.abort_on_exception = @taoe

    $stderr = @ose
  end

  context 'error in block' do

    it 'intercepts the error and describes it on $stderr' 

  end

  context 'error in callable' do

    class MyFailingHandler
      attr_reader :counter
      def initialize
        @counter = 0
      end
      def call(job, time)
        @counter = @counter + 1
        fail 'ouch'
      end
    end

    it 'intercepts the error and describes it on $stderr' 

  end

  context 'Rufus::Scheduler#stderr=' do

    it 'lets divert error information to custom files' 

  end

  context 'error information' do

    it 'contains information about the error, the job and the scheduler' 

  end

  context 'Rufus::Scheduler#on_error(&block)' do

    it 'intercepts all StandardError instances' 

  end
end


