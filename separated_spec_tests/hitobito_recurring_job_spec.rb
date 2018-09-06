# encoding: utf-8

#  Copyright (c) 2012-2013, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe RecurringJob do

  subject { RecurringJob.new }

  its(:interval) { should == 15.minutes }

  it 'schedules job unless it exists' 


  it 'is rescheduled after successfull run' 


  it 'is rescheduled after failed run' 


  it 'is rescheduled after worker pause' 


  it 'reschedules only one job' 

end

