require 'spec_helper'

describe 'Taxonomies', type: :feature, js: true do
  stub_authorization!

  before do
    visit spree.admin_path
    click_link 'Products'
  end

  context 'show' do
    it 'displays existing taxonomies' 

  end

  context 'create' do
    before do
      click_link 'Taxonomies'
      click_link 'admin_new_taxonomy_link'
    end

    it 'allows an admin to create a new taxonomy' 


    it 'displays validation errors' 

  end

  context 'edit' do
    it 'allows an admin to update an existing taxonomy' 

  end
end

