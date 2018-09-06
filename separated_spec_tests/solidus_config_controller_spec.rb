# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::ConfigController, type: :request do
    let!(:default_country) { create :country, iso: "US" }

    before do
      stub_authentication!
    end

    it "returns Spree::Money settings" 


    it "returns some configuration settings" 

  end
end

