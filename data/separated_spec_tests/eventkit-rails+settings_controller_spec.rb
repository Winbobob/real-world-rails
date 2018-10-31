require 'rails_helper'

RSpec.describe Api::V1::SettingsController, :type => :controller do

	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	describe 'GET #index' do
		context "with no parameters given" do
			it "retrieves a list of all settings" 

		end

		context "with specific parameters given" do
			it "retrieves a list of settings matching the parameters" 

		end
	end

	describe 'POST #create' do
		it "creates a new setting" 

	end

	describe 'GET #show' do
		it "retrieves the setting with the given ID" 

	end

	describe 'PUT #update' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "updates a setting with the given ID" 

		end
	end

	describe 'DELETE #destroy' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "deletes a setting with the given ID" 

		end
	end

end

