# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stafftools::ResourcesController, type: :controller do
  let(:organization) { classroom_org     }
  let(:user)         { classroom_teacher }

  before(:each) do
    sign_in_as(user)
  end

  describe "GET #index", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
      end

      context "without URL parameters" do
        before(:each) do
          get :index
        end

        it "returns a success status" 


        it "does not have any resources" 

      end

      context "with URL parameters" do
        before(:each) do
          get :index, params: { query: "1" }
        end

        it "returns a success status" 


        it "has a MultiIndexSearchRequest of resources" 

      end
    end
  end

  describe "GET #search", :vcr do
    context "as an unauthorized user" do
      it "returns a 404" 

    end

    context "as an authorized user" do
      before do
        user.update_attributes(site_admin: true)
      end

      context "without URL parameters" do
        before(:each) do
          get :search
        end

        it "returns a succcess status" 


        it "does not have any resources" 

      end

      context "with URL parameters" do
        before(:each) do
          get :search, params: { query: "1" }
        end

        it "returns a succcess status" 


        it "has a MultiIndexSearchRequest of resources" 

      end
    end
  end
end

