require 'rails_helper'

describe IndicesTasks do
  let(:tasks) {IndicesTasks.new}
  let!(:location) {FactoryGirl.create(:location, hv_group_id: 7)}
  let(:indices_array_initial) {
    [{:cpu_score=>1437,
      :disk_score=>120,
      :bandwidth_score=>107,
      :cpu_index=>99.79020979020979,
      :disk_index=>96.7741935483871,
      :bandwidth_index=>90.67796610169492,
      :cloud_index=>95.74745648009726,
      :created_at=>"2015-04-03T13:01:36.000Z"},
     {:cpu_score=>1427,
      :disk_score=>120,
      :bandwidth_score=>107,
      :cpu_index=>99.79020979020979,
      :disk_index=>96.7741935483871,
      :bandwidth_index=>18.166383701188455,
      :cloud_index=>71.57692901326179,
      :created_at=>"2015-04-23T08:42:05.000Z"},
     {:cpu_score=>1427,
      :disk_score=>133,
      :bandwidth_score=>107,
      :cpu_index=>99.79020979020979,
      :disk_index=>69.36416184971098,
      :bandwidth_index=>26.034063260340634,
      :cloud_index=>65.06281163342048,
      :created_at=>"2015-05-06T14:29:00.000Z"},
     {:cpu_score=>1427,
      :disk_score=>120,
      :bandwidth_score=>117,
      :cpu_index=>99.79020979020979,
      :disk_index=>96.7741935483871,
      :bandwidth_index=>21.314741035856574,
      :cloud_index=>72.62638145815116,
      :created_at=>"2015-05-14T09:32:47.000Z"}]
  }
  
  context "location_update" do
    before :each do
      allow_any_instance_of(LocationIndices).to receive(:process).and_return(indices_array_initial)
    end
    
    it "should add all location's indices if indices for location are empty" 

  
    it "should add only the indices that are newer than already stored for location" 

  
    it "should not add indices if they are older than last existing for location" 

  end
  
  context "all locations update" do
    let!(:location2) {FactoryGirl.create(:location, hv_group_id: 8)}
    let(:indices_location2) {
      [{:cpu_score=>1000,
        :disk_score=>90,
        :bandwidth_score=>137,
        :cpu_index=>94,
        :disk_index=>92,
        :bandwidth_index=>99,
        :cloud_index=>33,
        :created_at=>"2015-07-06T11:11:36.000Z"},
       {:cpu_score=>1507,
        :disk_score=>130,
        :bandwidth_score=>22,
        :cpu_index=>4,
        :disk_index=>33,
        :bandwidth_index=>12,
        :cloud_index=>33,
        :created_at=>"2015-05-02T11:24:05.000Z"}
        ]
      }
      
    before(:each) do
      indices_class_double = class_double("LocationIndices").as_stubbed_const
      indices1_double = instance_double("LocationIndices")
      indices2_double = instance_double("LocationIndices")
      
      allow(indices_class_double).to receive(:new).with(location).and_return(indices1_double)
      allow(indices_class_double).to receive(:new).with(location2).and_return(indices2_double)
      allow(indices1_double).to receive(:process).and_return(indices_array_initial)
      allow(indices2_double).to receive(:process).and_return(indices_location2)
    end
      
    it "should update all locations" 

    
    it "should set correct max location values" 

    
    it "should calculate correct cloud_index scores" 

  end
end

