# encoding: utf-8
require 'spec_helper'

describe 'taking a look at the activities' do
  include RequestHelpers

  let(:user) { FactoryGirl.create(:user) }
  let(:customer) { FactoryGirl.create(:customer) }

  before(:each) do
    Timecop.travel('2013-07-16 12:00:00 +0200')
    # last week:
    FactoryGirl.create_list(:activity, 2, user: user, duration: 1800, date: '2013-07-14', customer_id: customer.id)
    # this week, yesterday:
    FactoryGirl.create_list(:activity, 1, user: user, duration: 1800, date: '2013-07-15', customer_id: customer.id)
    # this week, today:
    FactoryGirl.create_list(:activity, 3, user: user, duration: 1600, date: '2013-07-16', customer_id: customer.id)
    login user
  end

  describe 'user\'s activity overview' do
    context 'without date parameter' do
      before(:each) do
        visit user_activities_path(user)
      end

      it 'calculates the total duration for the current day' 


      it 'calculates the total duration for the current week' 


      it 'calculates the total for this week\'s days' 


      it 'does not show the total for of days in the last week' 

    end
  end
end

