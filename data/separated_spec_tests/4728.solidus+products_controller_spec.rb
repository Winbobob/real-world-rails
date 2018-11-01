# frozen_string_literal: true

require 'spec_helper'

describe Spree::ProductsController, type: :controller do
  let!(:product) { create(:product, available_on: 1.year.from_now) }

  # Regression test for https://github.com/spree/spree/issues/1390
  it "allows admins to view non-active products" 


  it "cannot view non-active products" 


  it "should provide the current user to the searcher class" 


  # Regression test for https://github.com/spree/spree/issues/2249
  it "doesn't error when given an invalid referer" 

end

