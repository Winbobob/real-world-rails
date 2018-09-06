require 'spec_helper'

describe 'Taxonomies and taxons', type: :feature do
  stub_authorization!

  let(:taxonomy) { create(:taxonomy, name: 'Hello') }

  it 'admin should be able to edit taxon' 


  it 'taxon without name should not be updated' 


  it 'admin should be able to remove a product from a taxon', js: true do
    taxon_1 = create(:taxon, name: 'Clothing')
    product = create(:product)
    product.taxons << taxon_1

    visit spree.admin_taxons_path
    select_clothing_from_select2

    find('.product').hover
    find('.product .dropdown-toggle').click
    click_link 'Delete From Taxon'
    wait_for_ajax

    visit current_path
    select_clothing_from_select2

    expect(page).to have_content('No results')
  end

  def select_clothing_from_select2
    targetted_select2_search 'Clothing', from: '#s2id_taxon_id'
    wait_for_ajax
  end
end

