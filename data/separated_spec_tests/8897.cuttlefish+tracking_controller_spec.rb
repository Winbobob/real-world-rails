# frozen_string_literal: true

require "spec_helper"

describe TrackingController, type: :controller do
  describe "#open" do
    before :each do
      create(:delivery, id: 101)
    end

    it "should be succesful when the correct hash is used" 


    it "should 404 when hash isn't recognised" 


    it "should register the open event" 


    context "read only mode" do
      before(:each) do
        allow(Rails.configuration).to receive(:cuttlefish_read_only_mode)
          .and_return(true)
      end

      it "should be succesful when the correct hash is used" 


      it "should not register the open event" 

    end
  end

  describe "#click" do
    before :each do
      @delivery_link = create(:delivery_link, id: 204)
      allow_any_instance_of(DeliveryLink).to receive(:url)
        .and_return("http://foo.com")
    end

    context "When the correct hash and id are used" do
      context "the delivery_link exists" do
        it "should redirect" 


        it "should log the event" 

      end

      context "the delivery_link doesn't exist and url provided" do
        it "should redirect to to the given url" 

      end

      context "the url has been changed" do
        it "should not redirect to the given url" 

      end
    end

    context "read only mode" do
      before(:each) do
        allow(Rails.configuration).to receive(:cuttlefish_read_only_mode)
          .and_return(true)
      end

      it "should redirect" 


      it "should not log the event" 

    end

    it "should 404 when the wrong id is used" 


    it "should 4040 when the wrong hash is used" 

  end
end

