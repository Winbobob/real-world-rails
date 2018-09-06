require 'spec_helper'

describe 'Store credits admin', type: :feature do
  stub_authorization!

  let!(:admin_user) { create(:admin_user) }
  let!(:store_credit) { create(:store_credit) }

  before do
    allow(Spree.user_class).to receive(:find_by).and_return(store_credit.user)
  end

  describe 'visiting the store credits page' do
    before do
      visit spree.admin_path
      click_link 'Users'
    end

    it 'is on the store credits page' 

  end

  describe 'creating store credit' do
    before do
      visit spree.admin_path
      click_link 'Users'
      click_link store_credit.user.email
      click_link 'Store Credits'
      allow_any_instance_of(Spree::Admin::StoreCreditsController).to receive(:try_spree_current_user).and_return(admin_user)
    end

    it 'creates store credit and associate it with the user' 

  end

  describe 'updating store credit' do
    let(:updated_amount) { '99.0' }

    before do
      visit spree.admin_path
      click_link 'Users'
      click_link store_credit.user.email
      click_link 'Store Credits'
      allow_any_instance_of(Spree::Admin::StoreCreditsController).to receive(:try_spree_current_user).and_return(admin_user)
    end

    it 'creates store credit and associate it with the user' 

  end

  describe 'deleting store credit', js: true do
    before do
      visit spree.admin_path
      click_link 'Users'
      click_link store_credit.user.email
      click_link 'Store Credits'
      allow_any_instance_of(Spree::Admin::StoreCreditsController).to receive(:try_spree_current_user).and_return(admin_user)
    end

    it 'updates store credit in lifetime stats' 

  end

  describe 'non-existent user' do
    before do
      visit spree.admin_path
      click_link 'Users'
      click_link store_credit.user.email
      store_credit.user.destroy
      allow(Spree.user_class).to receive(:find_by).and_return(nil)
      click_link 'Store Credits'
      allow_any_instance_of(Spree::Admin::StoreCreditsController).to receive(:try_spree_current_user).and_return(admin_user)
    end

    it 'displays flash withe error' 

  end
end

