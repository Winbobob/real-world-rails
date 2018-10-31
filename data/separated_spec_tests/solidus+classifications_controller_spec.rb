# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::ClassificationsController, type: :request do
    let(:taxon) do
      taxon = create(:taxon)

      3.times do
        product = create(:product)
        product.taxons << taxon
      end
      taxon
    end

    before do
      stub_authentication!
    end

    context "as a user" do
      it "cannot change the order of a product" 

    end

    context "as an admin" do
      sign_in_as_admin!

      let(:last_product) { taxon.products.last }

      it "can change the order a product" 


      it "should touch the taxon" 

    end
  end
end

