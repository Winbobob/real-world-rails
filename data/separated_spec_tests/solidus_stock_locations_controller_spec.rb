# frozen_string_literal: true

require 'spec_helper'

module Spree
  module Admin
    describe StockLocationsController, type: :controller do
      stub_authorization!

      # Regression for https://github.com/spree/spree/issues/4272
      context "with no countries present" do
        it "cannot create a new stock location" 

      end

      context "with a default country other than the US present" do
        let(:country) { create :country, iso: "BR" }

        before do
          Spree::Config[:default_country_iso] = country.iso
        end

        it "can create a new stock location" 

      end

      context "with a country with the ISO code of 'US' existing" do
        before do
          FactoryBot.create(:country, iso: 'US')
        end

        it "can create a new stock location" 

      end
    end
  end
end

