require 'spec_helper'

describe 'Service Options', reset: false do
  downloadable_collection_id = 'C203234523-LAADS'
  downloadable_collection_title = 'MODIS/Aqua Calibrated Radiances 5-Min L1B Swath 250m V006'

  collection_with_intermittent_timeline_id = 'C179003030-ORNL_DAAC'

  before :all do
    load_page :search, overlay: false
    login
  end

  context 'for collections with granule results' do
    before :all do
      load_page :search, project: [downloadable_collection_id], view: :project
      wait_for_xhr
      click_button "Download project data"
      wait_for_xhr
    end

    context "when setting options for a collection with order options" do
      after :all do
        reset_access_page
      end

      context 'choosing to set an order option' do
        before :all do
          choose 'Stage for Delivery'
        end

        it 'shows the form for the associated order option' 


        it 'hides and shows portions of the form based on form selections' 

      end
    end
  end

  context 'for collections without granule results' do
    before :all do
      load_page :search, project: [collection_with_intermittent_timeline_id], view: :project, temporal: ['2014-07-10T00:00:00Z', '2014-07-10T03:59:59Z']
      wait_for_xhr
      click_button "Download project data"
      wait_for_xhr
    end

    it 'displays no service options' 


    it 'displays a message indicating that there are no matching granules' 

  end

  context "for collections with bounding box prepopulation options" do
    context "when the project's query has a spatial filter" do
      before :all do
        load_page 'data/configure', {project: ['C194001241-LPDAAC_ECS'],
                                     granule_id: 'G1456440974-LPDAAC_ECS',
                                     bounding_box: [1, 2, 3, 4]}
      end

      it "prepopulates the options form with the filter's MBR" 

    end

    context "when the project's query has no spatial filter" do
      before :all do
        load_page 'data/configure', {project: ['C194001241-LPDAAC_ECS'],
                                     granule_id: 'G1456440974-LPDAAC_ECS'}
      end

      it "does not prepopulate the form" 


    end
  end
end

