# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::ZonesController, type: :request do
    let!(:attributes) { [:id, :name, :zone_members] }
    let!(:zone) { create(:zone, name: 'Europe') }

    before do
      stub_authentication!
    end

    it "gets list of zones" 


    it 'can control the page size through a parameter' 


    it 'can query the results through a paramter' 


    it "gets a zone" 


    context "as an admin" do
      sign_in_as_admin!

      it "can create a new zone" 


      it "updates a zone" 


      it "can delete a zone" 

    end
  end
end

