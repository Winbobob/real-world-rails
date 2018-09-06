require 'spec_helper'

describe UberZeit do
  before do
    FactoryGirl.create(:public_holiday, date: '2013-03-19', second_half_day: true) # tuesday
    FactoryGirl.create(:public_holiday, date: '2013-03-20') # wednesday
  end

  it '::is_weekday_a_workday?' 


  it '::is_work_day?' 


  it '::year_as_range' 


  it '::month_as_range' 


  it '::round' 


  it '::duration_in_hhmm' 


  it '::hhmm_in_duration' 



  describe '::range_to_buckets' do

    it 'splits a given month range into weekly buckets' 


    it 'splits a given year range into monthly buckets' 

  end
end

