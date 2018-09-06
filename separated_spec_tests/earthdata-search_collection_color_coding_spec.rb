require "spec_helper"

describe "Project collection color coding", reset: false do
  present = DateTime.new(2014, 3, 1, 0, 0, 0, '+0')

  first_color_hex = '#3498DB'
  first_color_rgb = 'rgb(52, 152, 219)'
  second_color_hex = '#E67E22'
  second_color_rgb = 'rgb(230, 126, 34)'

  before(:all) do
    Capybara.reset_sessions!
    load_page :search, q: 'Minute FIFE'

    view_granule_results
    zoom_out_button = find('.timeline-zoom-out')
    zoom_out_button.click
    pan_to_time(present - 20.years)
    wait_for_xhr
    leave_granule_results
  end

  context 'in the project view' do
    before :all do
      first_collection_result.click_link "Add collection to the current project"
      second_collection_result.click_link "Add collection to the current project"
      find("#view-project").click
    end

    after :all do
      reset_overlay
      reset_project
    end

    it 'shows a color indicator on each collection in the project list' 


    it 'draws timeline data with the color corresponding to each collection' 


    context 'viewing granules for a collection' do
      before(:all) { view_granule_results('15 Minute Stream Flow Data: USGS (FIFE)', 'project-overview') }
      after(:all) { leave_granule_results('project-overview') }

      it 'draws granule footprints with the color corresponding the collection' 

    end
  end

  context 'viewing collection results' do
    it 'shows no color indicator' 

  end

  context 'in the granule view for collections not in a project' do
    before(:all) { view_granule_results }
    after(:all) { leave_granule_results }

    it 'uses the default color for granule footprints' 


    it 'uses the default color in the timeline' 

  end
end

