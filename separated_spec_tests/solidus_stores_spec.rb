# frozen_string_literal: true

require 'spec_helper'

describe 'Stores', type: :feature do
  stub_authorization!

  context 'when adding a store' do
    before { visit spree.new_admin_store_path }

    it 'admin should be able to set the default_currency' 

  end

  context 'when editing a store' do
    let(:store) { create :store, default_currency: 'AUD' }
    before { visit spree.edit_admin_store_path(store) }

    it 'admin should be able to change the default_currency' 

  end
end

