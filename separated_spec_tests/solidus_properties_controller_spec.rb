# frozen_string_literal: true

require 'spec_helper'
module Spree
  describe Spree::Api::PropertiesController, type: :request do
    let!(:property_1) { Property.create!(name: "foo", presentation: "Foo") }
    let!(:property_2) { Property.create!(name: "bar", presentation: "Bar") }

    let(:attributes) { [:id, :name, :presentation] }

    before do
      stub_authentication!
    end

    it "can see a list of all properties" 


    it "can control the page size through a parameter" 


    it 'can query the results through a parameter' 


    it "retrieves a list of properties by id" 


    it "retrieves a list of properties by ids string" 


    it "can see a single property" 


    it "can see a property by name" 


    it "can learn how to create a new property" 


    it "cannot create a new property if not an admin" 


    it "cannot update a property" 


    it "cannot delete a property" 


    context "as an admin" do
      sign_in_as_admin!

      it "can create a new property" 


      it "can update a property" 


      it "can delete a property" 

    end
  end
end

