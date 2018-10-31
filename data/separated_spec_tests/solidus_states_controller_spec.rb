# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::StatesController, type: :request do
    let!(:state) { create(:state, name: "Victoria") }
    let(:attributes) { [:id, :name, :abbr, :country_id] }

    before do
      stub_authentication!
    end

    it "gets all states" 


    it "gets all the states for a particular country" 


    context "pagination" do
      it "can select the next page and control page size" 

    end

    context "with two states" do
      before { create(:state, name: "New South Wales") }

      it "gets all states for a country" 


      it "can view all states" 


      it 'can query the results through a paramter' 

    end

    it "can view a state" 

  end
end

