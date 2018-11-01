require 'rails_helper'

describe BuildChecker::Chooser::LocationFeed do
  include_context :chooser_data
  let(:lf) { BuildChecker::Chooser::LocationFeed.new(30.seconds)}

  context 'with not tested locations scheduled' do
    before :each do
      @not_scheduled_templates = FactoryGirl.create_list(:template, 2, build_checker: true)
    end

    it 'finds location ids for which templates are to be scheduled' 


    it 'detects locations verified in the past and for schedule' 


    it 'detects most recent tests for location verified in the past and for schedule' 


    it 'detects ids of not tested, but choosen for tests locations' 


    it 'returns build_checker tests only for locations ready for next build' 


    it 'returns build_checker tests sorted from farthest in time first' 


    it 'returns empty table if no location ready for new test' 


    it 'returns not tested location ids checked for tests' 

  end

  context 'without not tested locations scheduled' do
    it 'returns sorted, from farthest, tested location ids checked for tests' 


    it 'returns empty table if no location ready for new test' 

  end
end

