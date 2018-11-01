# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::BaseHelper, type: :helper do
  include Spree::BaseHelper

  let(:current_store){ create :store }

  context "available_countries" do
    let(:country) { create(:country) }

    before do
      3.times { create(:country) }
    end

    context "with no checkout zone defined" do
      before do
        Spree::Config[:checkout_zone] = nil
      end

      it "return complete list of countries" 


      it "uses locales for country names" 

    end

    context "with a checkout zone defined" do
      context "checkout zone is of type country" do
        before do
          @country_zone = create(:zone, name: "CountryZone")
          @country_zone.members.create(zoneable: country)
          Spree::Config[:checkout_zone] = @country_zone.name
        end

        it "return only the countries defined by the checkout zone" 


        it "returns only the countries defined by the checkout zone passed as parameter" 

      end

      context "checkout zone is of type state" do
        before do
          state_zone = create(:zone, name: "StateZone")
          state = create(:state, country: country)
          state_zone.members.create(zoneable: state)
          Spree::Config[:checkout_zone] = state_zone.name
        end

        it "return complete list of countries" 

      end
    end
  end

  # Regression test for https://github.com/spree/spree/issues/2034
  context "flash_message" do
    let(:flash) { { "notice" => "ok", "foo" => "foo", "bar" => "bar" } }

    it "should output all flash content" 


    it "should output flash content except one key" 


    it "should output flash content except some keys" 

  end

  context "link_to_tracking" do
    it "returns tracking link if available" 


    it "returns tracking without link if link unavailable" 


    it "returns nothing when no shipping method" 


    it "returns nothing when no tracking" 


    def link_to_tracking_html(options = {})
      node = link_to_tracking(double(:shipment, options))
      Nokogiri::HTML(node.to_s)
    end
  end

  # Regression test for https://github.com/spree/spree/issues/2396
  context "meta_data_tags" do
    it "truncates a product description to 160 characters" 

  end

  describe "#pretty_time" do
    subject { pretty_time(date) }

    let(:date) { Time.new(2012, 11, 6, 13, 33) }

    it "pretty prints time in long format" 


    context 'with format set to short' do
      subject { pretty_time(date, :short) }

      it "pretty prints time in short format" 

    end
  end

  context "plural_resource_name" do
    let(:plural_config) { Spree::I18N_GENERIC_PLURAL }
    let(:base_class) { Spree::Product }

    subject { plural_resource_name(base_class) }

    it "should use ActiveModel::Naming module to pluralize model names" 


    it "should use the Spree::I18N_GENERIC_PLURAL constant" 

  end
end

