require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::EventsController, :type => :controller do

	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	describe 'GET #index' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			context "with no parameters given" do
				it "retrieves a list of all events" 

			end

			context "with specific parameters given" do
				it "retrieves a list of events matching the parameters" 

			end
		end
	end

	describe 'POST #create' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "creates a new event" 

		end
	end

	describe 'GET #show' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "retrieves the event with the given ID" 

		end
	end

	describe 'PUT #update' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "updates an event with the given ID" 

		end
	end

	describe 'DELETE #destroy' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "deletes an event with the given ID" 

		end
	end

end

