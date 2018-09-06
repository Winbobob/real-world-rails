require "spec_helper"

describe "Place Index" do
  describe "as_indexed_json" do
    it "should return a hash" 

  end
  describe "geometry indexing" do
    before(:each) { enable_elastic_indexing( Place ) }
    after(:each) { disable_elastic_indexing( Place ) }
    it "should not receive a geometry with duplicate points" 

  end
end

