require 'spec_helper'

RSpec.describe OpportunitiesController, type: :controller do

  describe "GET index" do
    it "should respond with 200" 


    it "should render the opportunities index template with jobs layout" 


    context "when it's filtered" do
      context "by remote opportunities" do
        before(:all) { @opportunity1 = Fabricate(:opportunity, remote: true, location: "Anywhere") }

        it "should assign the remote opportunities to @jobs" 

      end

      context "by query" do
        before(:all) { @opportunity2 = Fabricate(:opportunity, remote: true, location: "Anywhere", location_city: "San Francisco") }

        it "should assign the remote opportunities to @jobs which have the keyword 'senior rails' [attr: name]" 


        it "should assign the remote opportunities to @jobs which have the keyword 'underpinnings' [attr: description]" 


        it "should assign the remote opportunities to @jobs which have the keyword 'jquery' [attr: tag]" 


        it "should NOT assign the remote opportunities to @jobs which have the keyword dev-ops" 

      end

      context "by query with keywords containing regexp special characters" do
        it "should NOT fail when querying with keywords containing '+'" 

        it "should NOT fail when querying with keywords containing '.^$*+?()[{\|'" 

      end
    end
  end
end

