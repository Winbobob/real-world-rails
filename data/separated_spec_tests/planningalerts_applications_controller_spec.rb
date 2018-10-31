require 'spec_helper'

describe ApplicationsController do
  before :each do
    request.env['HTTPS'] = 'on'
  end

  describe "#index" do
    describe "rss feed" do
      before :each do
        allow(Location).to receive(:geocode).and_return(double(lat: 1.0, lng: 2.0, full_address: "24 Bruce Road, Glenbrook NSW 2773"))
      end

      it "should not provide a link for all applications" 

    end

    describe "error checking on parameters used" do
      it "should not do error checking on the normal html sites" 

    end

    describe "search by authority" do
      it "should give a 404 when an invalid authority_id is used" 

    end
  end

  describe "#show" do
    it "should gracefully handle an application without any geocoded information" 

  end

  describe "#address" do
    it "should set the radius to the supplied parameter" 


    it "should set the radius to the default when not supplied" 

  end

end

