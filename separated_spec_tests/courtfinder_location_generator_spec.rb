require 'spec_helper'

describe Location::LocationGenerator do
  let(:location_generator) do
    locator = double("locator").as_null_object
    Location::LocationGenerator.new(locator)
  end

  describe "#missing_location?" do
    context "when the court does not have a location" do
      it "should be true" 

    end

    context "when the court has a location" do
      it "should be false" 

    end
  end

  describe "#generate_location_for" do
    it "should retrieve the postcode from the first address of the court" 


    it "should ignore a court without an address" 


    it "should call find on a locator" 


    it "should update the longitude and latitude" 

  end

  describe "#process" do
    it "should ignore courts with map locations" 


    it "should generate map location for a court that can't be located" 

  end

  describe "#load" do
    let(:file_with_one_entry) { "spec/fixtures/manual_map_location.yml" }
    let(:file_with_two_entries) { "spec/fixtures/manual_map_locations.yml" }
    let(:court) { double('court').as_null_object }

    describe 'when there is one court' do
      it "should find a court" 


      it "should update the longitude and latitude" 

    end

    describe 'when there is more courts' do
      it "should find two courts" 


      it "should update the longitude and latitude" 

    end
  end
end

