require 'spec_helper'

describe TaskFiltersController do
  # Add the task filters to be tested in this list.
  WORD_LIST = ['Tomorrow', 'Today', 'Yesterday', 'In the past', 'In the future',
               'Last week', 'Last month', 'Last year', 'Today or later',
               'Today or earlier', 'Tomorrow or earlier', 'Tomorrow or later',
               'Yesterday or earlier', 'Yesterday or later']
  render_views

  describe 'search' do
    before :each do
      sign_in_normal_user
      TimeRange.create_defaults
    end

    it 'should return all matches for time range key words' 

  end

  describe 'update filter' do
    before :each do
      sign_in_normal_user
      TimeRange.create_defaults
    end

    it 'should successfully update the task filter' 


    it "should render the right template for 'xhr' request" 


    it "should redirect to '/tasks/list' if an 'http' request" 


  end
end

