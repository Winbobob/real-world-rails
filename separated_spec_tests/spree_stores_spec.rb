require 'spec_helper'

describe 'Stores admin', type: :feature do
  stub_authorization!

  let!(:store) { create(:store) }

  describe 'visiting the stores page' do
    it 'is on the stores page' 

  end

  describe 'creating store' do
    it 'creates store and associate it with the user' 

  end

  describe 'updating store' do
    let(:updated_name) { 'New Store Name' }

    it 'creates store and associate it with the user' 

  end

  describe 'deleting store', js: true do
    let!(:second_store) { create(:store) }

    it 'updates store in lifetime stats' 

  end

  describe 'setting default store' do
    let!(:store1) { create(:store, default: false) }

    it 'sets a store as default' 

  end
end

