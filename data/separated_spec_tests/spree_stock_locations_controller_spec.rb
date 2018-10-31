require 'spec_helper'

module Spree
  module Admin
    describe StockLocationsController, type: :controller do
      stub_authorization!

      # Regression for #4272
      context 'with no countries present' do
        it 'cannot create a new stock location' 

      end

      context 'with a default country present' do
        before do
          country = FactoryBot.create(:country)
          Spree::Config[:default_country_id] = country.id
        end

        it 'can create a new stock location' 

      end

      context "with a country with the ISO code of 'US' existing" do
        before do
          FactoryBot.create(:country, iso: 'US')
        end

        it 'can create a new stock location' 

      end
    end
  end
end

