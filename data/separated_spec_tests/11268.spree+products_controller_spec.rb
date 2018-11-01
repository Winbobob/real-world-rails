require 'spec_helper'

describe Spree::ProductsController, type: :controller do
  let!(:product) { create(:product, available_on: 1.year.from_now) }
  let(:taxon) { create(:taxon) }

  # Regression test for #1390
  it 'allows admins to view non-active products' 


  it 'cannot view non-active products' 


  it 'provides the current user to the searcher class' 


  # Regression test for #2249
  it "doesn't error when given an invalid referer" 


  context 'with history slugs present' do
    let!(:product) { create(:product, available_on: 1.day.ago) }

    it 'will redirect with a 301 with legacy url used' 


    it 'will redirect with a 301 with id used' 


    it 'will keep url params on legacy url redirect' 

  end

  context 'index products' do
    it 'calls includes when the retrieved_products object responds to it' 


    it "does not call includes when it's not available" 

  end
end

