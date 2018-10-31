require 'spec_helper'

describe AlertsController do
  before :each do
    request.env['HTTPS'] = 'on'
  end

  describe "#confirmed" do
    it "should set the alert to be confirmed" 


    it "should set the alert to be confirmed when on an iPhone" 


    it "should return a 404 when the wrong confirm_id is used" 

  end

  describe "#unsubscribe" do
    it "should mark the alert as unsubscribed" 


    it "should allow unsubscribing for non-existent alerts" 

  end

  describe "#area" do
    it "should 404 if the alert can't be found" 

  end
end

