# frozen_string_literal: true

require 'shared_examples/protect_product_actions'
require 'spec_helper'

module Spree
  describe Spree::Api::ProductsController, type: :request do
    let!(:product) { create(:product) }
    let(:attributes) { [:id, :name, :description, :price, :available_on, :slug, :meta_description, :meta_keywords, :taxon_ids, :meta_title] }

    context "without authentication" do
      before { Spree::Api::Config[:requires_authentication] = false }

      it "retrieves a list of products" 


      it_behaves_like "modifying product actions are restricted"
    end
  end
end

