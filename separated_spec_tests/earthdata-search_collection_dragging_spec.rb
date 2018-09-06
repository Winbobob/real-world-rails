require "spec_helper"

describe "Project collection dragging", reset: false do
  first_collection_id = 'C179002914-ORNL_DAAC'
  first_collection_title = "30 Minute Rainfall Data (FIFE)"
  first_color_rgb = 'rgb(52, 152, 219)'
  second_collection_id = 'C179003030-ORNL_DAAC'
  second_collection_title = "15 Minute Stream Flow Data: USGS (FIFE)"
  second_color_rgb = 'rgb(230, 126, 34)'

  def drag_collection(start_index, end_index)
    wait_for_xhr

    script = """
      (function() {
        $('#project-collections-list').trigger('sortupdate', {startIndex: #{start_index}, endIndex: #{end_index}});
      })();
    """
    page.execute_script script
    wait_for_xhr
  end

  context "dragging and dropping a collection to a new position" do
    before :all do
      load_page :search, project: [first_collection_id, second_collection_id]
      find("#view-project").click
      wait_for_xhr
      drag_collection(0, 1)
    end

    it "updates the order of the collections in the collections list" 


    it "updates the order of the collections in the timeline" 


    # EDSC-1394: I am not seeing any indication of granule visualization at this point in the test steps - 
    # not even on production.  This test is dubious.  Suppressing for now.
    #it "updates the z-index of the collections visualized on the map" do
     # expect(page).to have_selector("#granule-vis-#{second_collection_id}[style*=\"z-index: 16\"]")
     # expect(page).to have_selector("#granule-vis-#{first_collection_id}[style*=\"z-index: 17\"]")
    #end

    it "persists the new order in the URL parameters" 


    it "keeps collection color assignments the same" 

  end

  context "dragging and dropping a collection to its original position" do
    before :all do
      load_page :search, project: [first_collection_id, second_collection_id]
      find("#view-project").click
      wait_for_xhr
      drag_collection(0, 0)
    end

    it "maintains the order of the collections in the collections list" 


    it "maintains the order of the collections in the timeline" 


   # EDSC-1394: I am not seeing any indication of granule visualization at this point in the test steps - 
   # not even on production.  This test is dubious.  Suppressing for now.
   # it "maintains the z-index of the collections visualized on the map" do
   #   expect(page).to have_selector("#granule-vis-#{first_collection_id}[style*=\"z-index: 16\"]")
   #   expect(page).to have_selector("#granule-vis-#{second_collection_id}[style*=\"z-index: 17\"]")
   # end

    it "maintains the collection order in the URL parameters" 


    it "keeps collection color assignments the same" 

  end
end

