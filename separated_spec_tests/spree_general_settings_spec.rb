require 'spec_helper'

describe 'General Settings', type: :feature do
  stub_authorization!

  before do
    create(:store, name: 'Test Store', url: 'test.example.org', mail_from_address: 'test@example.org')
    visit spree.edit_admin_general_settings_path
  end

  context 'clearing the cache', js: true do
    it 'clears the cache' 

  end
end

