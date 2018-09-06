require 'spec_helper'

describe 'Promotion Categories', type: :feature do
  stub_authorization!

  context "index" do
    before do
      create(:promotion_category, name: 'name1', code: 'code1')
      create(:promotion_category, name: 'name2', code: 'code2')
      visit spree.admin_promotion_categories_path
    end

    context "listing promotion categories" do
      it "should list the existing promotion categories" 

    end
  end

  context "create" do
    before do
      visit spree.admin_promotion_categories_path
      click_on "New Promotion Category"
    end

    it "should allow an admin to create a new promotion category" 


    it "should not allow admin to create promotion category when invalid data" 

  end

  context "edit" do
    before(:each) do
      create(:promotion_category, name: 'name1')
      visit spree.admin_promotion_categories_path
      within_row(1) { click_icon :edit }
    end

    it "should allow an admin to edit an existing promotion category" 


    it "should show validation errors" 

  end

  context "delete" do
    before(:each) do
      create(:promotion_category, name: 'name1')
      visit spree.admin_promotion_categories_path
    end

    it "should allow an admin to delete an existing promotion category", js: true do
      accept_alert do
        click_icon :trash
      end
      expect(page).to have_content("successfully removed!")
    end
  end
end

