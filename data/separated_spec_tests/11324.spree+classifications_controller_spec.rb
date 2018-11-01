require 'spec_helper'

module Spree
  describe Api::V1::ClassificationsController, type: :controller do
    let(:taxon) do
      taxon = create(:taxon)

      3.times do
        product = create(:product)
        product.taxons << taxon
      end
      taxon
    end

    before do
      stub_authentication!
    end

    context 'as a user' do
      it 'cannot change the order of a product' 

    end

    context 'as an admin' do
      sign_in_as_admin!

      let(:last_product) { taxon.products.last }

      it 'can change the order a product' 


      it 'touches the taxon' 

    end
  end
end

