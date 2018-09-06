require 'spec_helper'

module Spree
  describe Api::V1::TaxonomiesController, type: :controller do
    render_views

    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, name: 'Ruby', taxonomy: taxonomy) }
    let(:taxon2) { create(:taxon, name: 'Rails', taxonomy: taxonomy) }
    let(:attributes) { [:id, :name] }

    before do
      stub_authentication!
      taxon2.children << create(:taxon, name: '3.2.2', taxonomy: taxonomy)
      taxon.children << taxon2
      taxonomy.root.children << taxon
    end

    context 'as a normal user' do
      it 'gets all taxonomies' 


      it 'can control the page size through a parameter' 


      it 'can query the results through a paramter' 


      it 'gets a single taxonomy' 


      it 'gets a single taxonomy with set=nested' 


      it 'gets the jstree-friendly version of a taxonomy' 


      it 'can learn how to create a new taxonomy' 


      it 'cannot create a new taxonomy if not an admin' 


      it 'cannot update a taxonomy' 


      it 'cannot delete a taxonomy' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'can create' 


      it 'cannot create a new taxonomy with invalid attributes' 


      it 'can destroy' 

    end
  end
end

