require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
	describe 'GET #index' do
		context "with no existing users in the database" do
			it "returns a success" 

		end
		context "with some existing users in the database" do
			context "with no token" do
				it "receives an error" 

			end

			context "with a valid token" do
				context "with no parameters given" do
					it "retrieves a list of all users" 

				end

				context "with specific parameters given" do
					it "retrieves a list of users matching the parameters" 

				end
			end
		end
	end

	describe 'POST #create' do
		context "with no existing users in the database" do
			it "creates a new user without a valid token" 

		end
		context "with some existing users in the database" do
			context "with no token" do
				it "receives an error" 

			end

			context "with a valid token" do
				it "creates a new user" 

			end
		end
	end

	describe 'GET #show' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "retrieves the user with the given ID" 

		end
	end

	describe 'PUT #update' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "updates an user with the given ID" 

		end
	end

	describe 'DELETE #destroy' do
		context "with no token" do
			it "receives an error" 

		end

		context "with a valid token" do
			it "deletes an user with the given ID" 

		end
	end

end

