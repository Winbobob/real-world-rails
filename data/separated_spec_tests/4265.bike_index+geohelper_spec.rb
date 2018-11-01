require "spec_helper"

describe Geohelper do
  after { Geocoder.configure(lookup: :test) }

  describe "reverse_geocode" do
    context "point" do
      let(:address) { "1740 E 2nd St, Casper, WY 82601, USA" }
      let(:latitude) { 42.8490197 }
      let(:longitude) { -106.3015341 }

      it "returns correct location" 

    end
  end
  describe "coordinates" do
    let(:address) { "3550 W Shakespeare Ave, 60647" }
    let(:latitude) { 41.9202661 }
    let(:longitude) { -87.7156846 }

    it "returns correct location" 


    context "blank" do
      it "handles it successfully" 

    end

    context "zipcode" do
      let(:address) { "60647" }

      it "queries using 'zipcode: ' because google likes that" 

    end
  end
end

