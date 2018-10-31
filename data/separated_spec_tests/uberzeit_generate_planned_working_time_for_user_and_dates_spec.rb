require 'spec_helper'

describe GeneratePlannedWorkingTimeForUserAndDates do

  let(:user) { FactoryGirl.create(:user) }
  let(:dates) { Date.civil(2013, 12, 23)..Date.civil(2013, 12, 24) }

  subject { GeneratePlannedWorkingTimeForUserAndDates.new(user, dates) }

  context 'date range' do
    it 'calculates all the planned working time of the given range' 


    it 'calculates the correct planned working_time for the holidays of a given year' 

  end

  context 'single date' do
    let(:dates) { Date.civil(2013, 12, 24) }
    it 'calculate the planned working time for the given date' 


    it 'calculates the correct planned working_time for the holidays' 

  end

end

