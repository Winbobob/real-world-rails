require 'spec_helper'

describe 'Product Variants', type: :feature, js: true do
  stub_authorization!

  before do
    create(:product)
    visit spree.admin_products_path
  end

  context 'editing variant option types' do
    it 'allows an admin to create option types for a variant' 


    it 'allows admin to create a variant if there are option types' 

  end
end

