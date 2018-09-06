require 'rails_helper'
# require 'spec_helper'

describe HubsController do

	if ENV["GOOGLE_API_KEY"] == nil 
		$API_KEY_DEFINED = false
		pp "GOOGLE_API_KEY not defined. So testing involving the google api service will be skipped"
	else 
		$API_KEY_DEFINED = true 
	end

	before :each do
    	request.env["HTTP_ACCEPT"] = 'application/json'
  	end

	describe "GET index" do 

		context "with existing hub" do
			let(:hub) { create(:hub) }

			context "using group name of hub as filter" do
				before do 
					get :index, hub_filter: hub.group_name
				end

				it "should find hub" 

			end

			context "using location of hub as filter" do 
				before do 
					get :index, hub_filter: hub.formatted_location
				end

				it "should find hub" 


				it "should find location from google places api" 

				end

			end
		end

		context "with no existing hubs" do

			context "using non-existent group name as filter" do
				before do 
					get :index, hub_filter: "Non existent group"
				end

				it "should not find hub" 

			end

			context "using location as filter" do 
				let(:search_string) { "Mountain View" }

				before do 
					get :index, hub_filter: search_string
				end

				it "should find location from google places api" 

				end

			end
		end
	end
end

