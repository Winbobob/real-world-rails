require 'spec_helper'

module Spree
  describe ProductsHelper, type: :helper do
    it "displays variant price differences as absolute, not relative values" 


    private

    def make_variant_stub(product_price, variant_price)
      product = double(:product, price: product_price)
      variant = double(:variant, product: product, price: variant_price)
      variant
    end
  end
end

