require 'spec_helper'

def expect_single_taxon_result(taxon_name)
  expect(json_response['taxons'].count).to eq(1)
  expect(json_response['taxons'].first['name']).to eq(taxon_name)
end

module Spree
  describe Api::V1::TaxonsController, type: :controller do
    render_views

    let!(:taxonomy) { create(:taxonomy) }
    let!(:taxon) { create(:taxon, name: 'Ruby', taxonomy: taxonomy, parent_id: taxonomy.root.id) }
    let!(:rust_taxon) { create(:taxon, name: 'Rust', taxonomy: taxonomy, parent_id: taxonomy.root.id) }
    let!(:taxon2) { create(:taxon, name: 'Rails', taxonomy: taxonomy, parent_id: taxon.id) }
    let(:attributes) { ['id', 'name', 'pretty_name', 'permalink', 'parent_id', 'taxonomy_id', 'meta_title', 'meta_description'] }

    before do
      create(:taxon, name: 'React', taxonomy: taxonomy, parent_id: taxon2.id) # taxon3
      stub_authentication!
    end

    context 'as a normal user' do
      it 'gets all taxons for a taxonomy' 


      # Regression test for #4112
      it 'does not include children when asked not to' 


      it 'paginates through taxons' 


      describe 'searching' do
        context 'within a taxonomy' do
          before do
            api_get :index, taxonomy_id: taxonomy.id, q: { name_cont: name }
          end

          context 'searching for top level taxon' do
            let(:name) { 'Ruby' }

            it 'returns the matching taxons' 

          end
        end

        context 'with a name' do
          before do
            api_get :index, q: { name_cont: name }
          end

          context 'with one result' do
            let(:name) { 'Ruby' }

            it 'returns an array including the matching taxon' 

          end

          context 'with no results' do
            let(:name) { 'Imaginary' }

            it 'returns an empty array of taxons' 

          end
        end

        context 'with no filters' do
          it 'gets all taxons' 

        end
      end

      it 'gets a single taxon' 


      it 'gets all taxons in JSTree form' 


      it 'can learn how to create a new taxon' 


      it 'cannot create a new taxon if not an admin' 


      it 'cannot update a taxon' 


      it 'cannot delete a taxon' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'can create' 


      it 'can update the position in the list' 


      it 'cannot create a new taxon with invalid attributes' 


      it 'cannot create another root taxon' 


      it 'cannot create a new taxon with invalid taxonomy_id' 


      it 'can destroy' 

    end
  end
end

