require 'rails_helper'

describe UptimeTasks, :vcr do
  include_context :pingdom_env
  
  let(:tasks) {UptimeTasks.new}
  let(:all_servers_update) {tasks.perform(:update_all_servers)}
  let(:pingdom_servers) {tasks.perform(:pingdom_servers)}
  let (:pingdom_id) {1534749} #from vcr - Quadranet Miami
  let(:pingdom2_id) {1534660} #from vcr - Budget London Softlayer
  let(:pingom_not_connected) {1534715} #from vcr - HostPro - Kiev
  let!(:location) {FactoryGirl.create(:location, pingdom_id: pingdom_id)}
  let!(:location2) {FactoryGirl.create(:location, pingdom_id: pingdom2_id)}
  
  context "update_all_servers" do
    it 'should get all servers checks records' 

  end
  
  context "pingdom_servers" do 
    it "should get pingdom servers names" 

  
    it "should return error message if connection not working" 

  end
  
  context "update_servers" do
    before(:each) do
      allow(tasks).to receive(:performance_args).and_return(
        {
          includeuptime: true, 
          resolution: :day,
          from: 1433199600
        }
      )
    end
    it "should save performance data for given server (by pingdom check_id)" 

    
    it "should update all locations connected to given pingdom_id" 

    
    it "should update existing data in db if changed in pingdom" 

    
    it "should not update data if same data read from pingdom" do 
      expect(tasks.perform(:update_servers, pingdom_id).count).to eq 1
      expect {
        expect(tasks.perform(:update_servers, pingdom_id).count).to eq 1
      }.not_to change(location.uptimes, :count)
    end
    
    it "should return false if none of locations is connected to pingdom_id" 

  end
  
  context "update server" do
    it "should save performance data for given server (by location_id)" 

    
    it "should save performance data for given server for 100 days" 

    
    it "should return 0 updates if pingdom_id is nil" 

  end
end

