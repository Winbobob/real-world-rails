require 'spec_helper'

module Spree
  module Admin
    describe TaxCategoriesController, type: :controller do
      stub_authorization!

      describe 'GET #index' do
        subject { spree_get :index }

        it 'is successful' 

      end

      describe 'PUT #update' do
        subject { spree_put :update, id: tax_category.id, tax_category: { name: 'Foo', tax_code: 'Bar' } }

        let(:tax_category) { create :tax_category }

        it 'redirects' 


        it 'updates' 

      end
    end
  end
end

