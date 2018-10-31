require 'rails_helper'

describe BuildChecker::Chooser::TemplateFeed do
  include_context :chooser_data
  let(:tf) { BuildChecker::Chooser::TemplateFeed.new(@started.first.location_id, 24.hours)}

  context 'with not tested templates scheduled' do
    before :each do
      @not_scheduled_templates = FactoryGirl.create_list(:template, 2, build_checker: true, location_id: @started.first.location_id)
    end

    it 'detects templates verified in the past and for schedule' 


    it 'detects most recent tests for templates verified in the past and for schedule' 


    it 'detects ids of not tested, but choosen for tests templates' 


    it 'returns build_checker test for farthest recent tested template' 


    it 'returns template id for farthest recent tested template' 


    it 'returns nil if time not passed for test of farthest recent tested template' 


    it 'returns not tested template id' 

  end

  context 'without not tested templates scheduled' do
    it 'returns farthest, from recent tests, template_id checked for tests' 


    it 'returns nil if time not passed for test of farthest recent tested template' 


    it 'returns farthest, from recent tests, template_id checked for tests' 

  end


end

