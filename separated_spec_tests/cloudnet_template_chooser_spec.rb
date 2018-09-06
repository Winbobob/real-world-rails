require 'rails_helper'

describe BuildChecker::Chooser::TemplateChooser do
  include_context :chooser_data
  let(:chooser) { BuildChecker::Chooser::TemplateChooser.new }

  it 'sets variables' 


  context 'with not tested locations and templates scheduled' do
    before :each do
      @not_scheduled_templates1 = FactoryGirl.create_list(:template, 2, build_checker: true)
      @not_scheduled_templates2 = FactoryGirl.create_list(:template, 2, build_checker: true, location_id: @started.first.location_id)
    end

    it 'returns location ids' 


    it 'returns template id' 


    it 'returns next template for test' 

  end

  context 'without not tested locations scheduled' do
    it 'returns location ids' 


    it 'returns template id' 


    it 'returns next template for test from first sorted location' 


    it 'returns next template for test from second sorted location' 


    it 'returns nil if no template is ready for test' 

  end

end

