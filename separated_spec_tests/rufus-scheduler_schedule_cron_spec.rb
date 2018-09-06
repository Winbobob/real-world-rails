
#
# Specifying rufus-scheduler
#
# Sat Jul 13 04:52:08 JST 2013
#
# In the train between Bern and Fribourg, riding back
# from the @ruvetia drinkup
#

require 'spec_helper'


describe Rufus::Scheduler do

  before :each do
    @scheduler = Rufus::Scheduler.new
  end
  after :each do
    @scheduler.shutdown
  end

  describe '#cron' do

    it 'schedules' 


    it 'raises if the job frequency is higher than the scheduler frequency' 


    it 'accepts a CronLine instance' 

  end

  describe '#schedule_cron' do

    it 'returns a CronJob instance' 


    it 'accepts a CronLine instance' 

  end
end


