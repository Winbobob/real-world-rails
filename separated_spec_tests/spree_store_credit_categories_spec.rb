require 'spec_helper'

describe 'Store Credit Categories', type: :feature, js: true do
  stub_authorization!

  before do
    visit spree.admin_path
    click_link 'Configuration'
  end

  context 'admin visiting store credit categories list' do
    it 'displays existing store credit categories' 

  end

  context 'admin creating a new store credit category' do
    before do
      click_link 'Store Credit Categories'
      click_link 'admin_new_store_credit_category_link'
    end

    it 'is able to create a new store credit category' 


    it 'shows validation errors if there are any' 

  end

  context 'admin editing a store credit category' do
    it 'is able to update an existing store credit category' 

  end
end

