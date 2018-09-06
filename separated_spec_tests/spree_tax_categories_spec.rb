require 'spec_helper'

describe 'Tax Categories', type: :feature do
  stub_authorization!

  before do
    visit spree.admin_path
    click_link 'Configuration'
  end

  context 'admin visiting tax categories list' do
    it 'displays the existing tax categories' 

  end

  context 'admin creating new tax category' do
    before do
      click_link 'Tax Categories'
      click_link 'admin_new_tax_categories_link'
    end

    it 'is able to create new tax category' 


    it 'shows validation errors if there are any' 

  end

  context 'admin editing a tax category' do
    it 'is able to update an existing tax category', js: true do
      create(:tax_category)
      click_link 'Tax Categories'
      within_row(1) { click_icon :edit }
      fill_in 'tax_category_description', with: 'desc 99'
      click_button 'Update'
      expect(page).to have_content('successfully updated!')
      expect(page).to have_content('desc 99')
    end
  end
end

