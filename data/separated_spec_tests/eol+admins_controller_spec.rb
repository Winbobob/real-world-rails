require "spec_helper"

describe AdminsController do
  include ApplicationHelper
  render_views  
  
  before(:all) do
    truncate_all_tables
    load_foundation_cache
    @admin = User.gen
    @admin.grant_admin
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      session[:user_id] = @admin.id
    end
    
    describe "running harvestings" do
      it "displays harvestings info" 

    
      context "when no harvestings is currently running" do
        it "displays no harvestings statement" 

      end
      
      context "when there is running harvesting" do
        before(:all) do
          @current_harvesting = HarvestEvent.first
          @current_harvesting.update_attributes(completed_at: nil)
          @harvesting_resource = Resource.find(@current_harvesting.resource_id)
          @harvest_process_log = HarvestProcessLog.gen(completed_at: nil, process_name: "Harvesting")
        end
      
        it "displays resource title of currently running harvest" 

      
        it "displays duration of currently running harvest" 

        
        after(:all) do
          @harvest_process_log.destroy if @harvest_process_log
        end
        
      end
    end
  end
end

