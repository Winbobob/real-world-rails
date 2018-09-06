require 'spec_helper'

describe 'Zones', type: :feature do
  stub_authorization!

  before do
    Spree::Zone.delete_all
    visit spree.admin_path
    click_link 'Configuration'
  end

  context 'show' do
    it 'displays existing zones' 

  end

  context 'create' do
    it 'allows an admin to create a new zone' 

  end
end

