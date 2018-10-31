require "spec_helper"

describe CollectionItemsController do

  before(:all) do
    # so this part of the before :all runs only once
    unless User.find_by_username('collections_scenario')
      truncate_all_tables
      load_scenario_with_caching(:collections)
    end
    @test_data = EOL::TestInfo.load('collections')
    @collection_item = @test_data[:collection].collection_items.last
    @collection_editor = @test_data[:collection].users.first
  end

  # This method is used when JS is disabled, otherwise items are updated through Collection controller
  describe "POST update" do
    it "should NOT update the item if user not logged in" 

    it "should update the item if user has permission to update" 

  end

end

