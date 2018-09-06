require 'spec_helper'

RSpec.describe 'admin issues labels' do
  let!(:bug_label) { Label.create(title: 'bug', template: true) }
  let!(:feature_label) { Label.create(title: 'feature', template: true) }

  before do
    sign_in(create(:admin))
  end

  describe 'list' do
    before do
      visit admin_labels_path
    end

    it 'renders labels list' 


    it 'deletes label' 


    it 'deletes all labels', :js do
      page.within '.labels' do
        page.all('.btn-remove').each do |remove|
          accept_confirm { remove.click }
          wait_for_requests
        end
      end

      wait_for_requests

      expect(page).to have_content("There are no labels yet")
      expect(page).not_to have_content('bug')
      expect(page).not_to have_content('feature_label')
    end
  end

  describe 'create' do
    before do
      visit new_admin_label_path
    end

    it 'creates new label' 


    it 'does not creates label with invalid color' 


    it 'does not creates label if label already exists' 

  end

  describe 'edit' do
    it 'changes bug label' 

  end
end

