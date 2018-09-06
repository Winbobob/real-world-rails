
#
# Specifying rufus-scheduler
#
# Tue Aug 13 05:58:48 JST 2013
#

require 'spec_helper'


describe Rufus::Scheduler do

  after :each do

    FileUtils.rm_f('.rufus-scheduler.lock')
    FileUtils.rm_f('lock.txt')
  end

  context ':lockfile => ".rufus-scheduler.lock"' do

    it 'writes down a .rufus-scheduler.lock file' 


    it '"flocks" the lock file' 


    it 'prevents newer schedulers from starting' 


    it 'releases the lockfile when shutting down' 

  end
end


