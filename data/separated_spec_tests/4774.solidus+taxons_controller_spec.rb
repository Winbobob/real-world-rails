# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::TaxonsController, type: :request do
    let(:taxonomy) { create(:taxonomy) }
    let(:taxon) { create(:taxon, name: "Ruby", taxonomy: taxonomy) }
    let(:taxon2) { create(:taxon, name: "Rails", taxonomy: taxonomy) }
    let(:attributes) { ["id", "name", "pretty_name", "permalink", "parent_id", "taxonomy_id"] }

    before do
      stub_authentication!
      taxon2.children << create(:taxon, name: "3.2.2", taxonomy: taxonomy)
      taxon.children << taxon2
      taxonomy.root.children << taxon
    end

    context "as a normal user" do
      it "gets all taxons for a taxonomy" 


      # Regression test for https://github.com/spree/spree/issues/4112
      it "does not include children when asked not to" 


      it "paginates through taxons" 


      describe 'searching' do
        context 'with a name' do
          before do
            get spree.api_taxons_path, params: { q: { name_cont: name } }
          end

          context 'with one result' do
            let(:name) { "Ruby" }

            it "returns an array including the matching taxon" 

          end

          context 'with no results' do
            let(:name) { "Imaginary" }

            it 'returns an empty array of taxons' 

          end
        end

        context 'with no filters' do
          it "gets all taxons" 

        end
      end

      it "gets a single taxon" 


      it "gets all taxons in JSTree form" 


      it "can learn how to create a new taxon" 


      it "cannot create a new taxon if not an admin" 


      it "cannot update a taxon" 


      it "cannot delete a taxon" 


      context "with caching enabled" do
        let!(:product) { create(:product, taxons: [taxon]) }

        before do
          ActionController::Base.perform_caching = true
        end

        it "handles exclude_data correctly" 


        after do
          ActionController::Base.perform_caching = false
        end
      end
    end

    context "as an admin" do
      sign_in_as_admin!

      it "can create" 


      it "can update the position in the list" 


      it "cannot create a new taxon with invalid attributes" 


      it "cannot create a new taxon with invalid taxonomy_id" 


      it "can destroy" 

    end
  end
end

