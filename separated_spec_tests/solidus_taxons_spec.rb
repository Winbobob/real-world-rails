# frozen_string_literal: true

require 'spec_helper'

describe "Taxonomies and taxons", type: :feature do
  stub_authorization!

  it "admin should be able to edit taxon" 


  it "can view and add to taxon tree", js: true do
    taxonomy = create :taxonomy

    visit spree.edit_admin_taxonomy_path(taxonomy)
    expect(page).to have_content('Brand')

    click_on('Add taxon')
    expect(page).to have_content('New node')

    # Little tricky to select the right taxon. Since the text is technically
    # inside the top-level li.
    within '#taxonomy_tree li li', text: 'New node' do
      click_icon :edit
    end

    expect(page).to have_current_path %r{/admin/taxonomies/\d+/taxons/\d+/edit}
  end
end

