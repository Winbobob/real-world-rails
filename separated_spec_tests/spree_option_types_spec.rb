require 'spec_helper'

describe 'Option Types', type: :feature, js: true do
  stub_authorization!

  before do
    visit spree.admin_path
    click_link 'Products'
  end

  context 'listing option types' do
    it 'lists existing option types' 

  end

  context 'creating a new option type' do
    it 'allows an admin to create a new option type' 

  end

  context 'editing an existing option type' do
    it 'allows an admin to update an existing option type' 

  end

  # Regression test for #3204
  it 'can remove a non-persisted option value from an option type' 

end

