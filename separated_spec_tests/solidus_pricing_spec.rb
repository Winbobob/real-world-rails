# frozen_string_literal: true

require 'spec_helper'

describe 'Pricing' do
  stub_authorization!

  let(:product) { create(:product) }

  before do
    visit spree.edit_admin_product_path(product)
  end

  it 'has a Prices tab' 


  context "in the prices tab" do
    let!(:country) { create :country, iso: "DE" }
    let(:master_price) { product.master.default_price }
    let!(:other_price) { product.master.prices.create(amount: 34.56, currency: "RUB", country_iso: "DE") }

    before do
      visit spree.admin_product_prices_path(product)
    end

    it 'displays a table with the prices' 


    context "searching" do
      let(:variant) { create(:variant, price: 20) }
      let(:product) { variant.product }

      before do
        product.master.update(price: 49.99)
      end

      it 'has a working table filter' 

    end

    context "editing" do
      let(:variant) { create(:variant, price: 20) }
      let(:product) { variant.product }

      before do
        product.master.update(price: 49.99)
      end

      it 'has a working edit page' 

    end

    context "deleting", js: true do
      let(:product) { create(:product, price: 65.43) }
      let!(:variant) { product.master }
      let!(:other_price) { product.master.prices.create(amount: 34.56, currency: "EUR") }

      it "will delete the non-default price" 


      it "does not break when default price is deleted" 

    end
  end
end

