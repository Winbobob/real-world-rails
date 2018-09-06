require 'spec_helper'

describe MarketplaceService do
  include MarketplaceService

  describe "#create" do

    before :each do
      @community_params = {
        :marketplace_name => "LocalFoodGarden",
        :marketplace_type => "product",
        :marketplace_country => "ES",
        :marketplace_language => "es"
      }
    end

    it "should create a marketplace" 


    it "should find a free domain, if intitial domain is taken" 


    it "should set correct currency based on contry selection" 


    it "should set correct listing shape and category" 


    it "should have preauthorize_payments enabled" 


    it "should create marketplace without payment process" 


    it "should have community customizations" 


  end


end

