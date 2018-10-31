# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::CountriesController, type: :request do
    before do
      stub_authentication!
      @state = create(:state)
      @country = @state.country
    end

    it "gets all countries" 


    context "with two countries" do
      before { @zambia = create(:country, name: "Zambia") }

      it "can view all countries" 


      it 'can query the results through a paramter' 


      it 'can control the page size through a parameter' 

    end

    it "includes states" 

  end
end

