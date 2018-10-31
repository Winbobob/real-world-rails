require 'spec_helper'
require 'shared_examples/protect_product_actions'

module Spree
  describe Api::V1::ProductsController, type: :controller do
    render_views

    let!(:product) { create(:product) }
    let!(:inactive_product) { create(:product, available_on: Time.current.tomorrow, name: 'inactive') }
    let(:base_attributes) { Api::ApiHelpers.product_attributes }
    let(:show_attributes) { base_attributes.dup.push(:has_variants) }
    let(:new_attributes) { base_attributes }

    let(:product_data) do
      { name: 'The Other Product',
        price: 19.99,
        shipping_category_id: create(:shipping_category).id }
    end
    let(:attributes_for_variant) do
      h = attributes_for(:variant).except(:option_values, :product)
      h.merge(options: [
                { name: 'size', value: 'small' },
                { name: 'color', value: 'black' }
              ])
    end

    before do
      stub_authentication!
    end

    context 'as a normal user' do
      context 'with caching enabled' do
        before do
          create(:product) # product_2
          ActionController::Base.perform_caching = true
        end

        it 'returns unique products' 


        after do
          ActionController::Base.perform_caching = false
        end
      end

      it 'retrieves a list of products' 


      it 'retrieves a list of products by id' 


      context 'product has more than one price' do
        before { product.master.prices.create currency: 'EUR', amount: 22 }

        it 'returns distinct products only' 

      end

      it 'retrieves a list of products by ids string' 


      it 'does not return inactive products when queried by ids' 


      it 'does not list unavailable products' 


      context 'pagination' do
        before { create(:product) }

        it 'can select the next page of products' 


        it 'can control the page size through a parameter' 

      end

      it 'can search for products' 


      # regression test for https://github.com/spree/spree/issues/8207
      it 'can sort products by date' 


      it 'gets a single product' 


      context 'tracking is disabled' do
        before { Config.track_inventory_levels = false }

        it 'still displays valid json with total_on_hand Float::INFINITY' 


        after { Config.track_inventory_levels = true }
      end

      context 'finds a product by slug first then by id' do
        let!(:other_product) { create(:product, slug: 'these-are-not-the-droids-you-are-looking-for') }

        before do
          product.update_column(:slug, "#{other_product.id}-and-1-ways")
        end

        specify do
          api_get :show, id: product.to_param
          expect(json_response['slug']).to match(/and-1-ways/)
          product.destroy

          api_get :show, id: other_product.id
          expect(json_response['slug']).to match(/droids/)
        end
      end

      it 'cannot see inactive products' 


      it 'returns a 404 error when it cannot find a product' 


      it 'can learn how to create a new product' 


      it_behaves_like 'modifying product actions are restricted'
    end

    context 'as an admin' do
      let(:taxon_1) { create(:taxon) }
      let(:taxon_2) { create(:taxon) }

      sign_in_as_admin!

      it 'can see all products' 


      # Regression test for #1626
      context 'deleted products' do
        before do
          create(:product, deleted_at: 1.day.ago)
        end

        it 'does not include deleted products' 


        it 'can include deleted products' 

      end

      describe 'creating a product' do
        it 'can create a new product' 


        it 'creates with embedded variants' 


        it 'can create a new product with embedded product_properties' 


        it 'can create a new product with option_types' 


        it 'creates product with option_types ids' 


        it 'creates with shipping categories' 


        it 'puts the created product in the given taxons' 


        # Regression test for #2140
        context 'with authentication_required set to false' do
          before do
            Spree::Api::Config.requires_authentication = false
          end

          after do
            Spree::Api::Config.requires_authentication = true
          end

          it 'can still create a product' 

        end

        it 'cannot create a new product with invalid attributes' 

      end

      context 'updating a product' do
        it 'can update a product' 


        it 'can create new option types on a product' 


        it 'can create new variants on a product' 


        it 'can update an existing variant on a product' 


        it 'cannot update a product with an invalid attribute' 


        it 'puts the updated product in the given taxons' 

      end

      it 'can delete a product' 

    end

    describe '#find_product' do
      let(:products) { Spree::Product.all }

      def send_request
        api_get :show, id: product.id
      end

      before { allow(controller).to receive(:product_scope).and_return(products) }

      context 'product found using friendly_id' do
        before do
          allow(products).to receive(:friendly).and_return(products)
          allow(products).to receive(:find).with(product.id.to_s).and_return(product)
        end

        describe 'expects to receive' do
          it { expect(controller).to receive(:product_scope).and_return(products) }
          it { expect(products).to receive(:friendly).and_return(products) }
          it { expect(products).to receive(:find).with(product.id.to_s).and_return(product) }
          after { send_request }
        end

        describe 'assigns' do
          before { send_request }
          it { expect(assigns(:product)).to eq(product) }
        end

        describe 'response' do
          before { send_request }
          it { expect(response).to have_http_status(:ok) }
          it { expect(json_response[:id]).to eq(product.id) }
          it { expect(json_response[:name]).to eq(product.name) }
        end
      end

      context 'product not found using friendly_id, but found in normal scope using id' do
        before do
          allow(products).to receive(:friendly).and_return(products)
          allow(products).to receive(:find).with(product.id.to_s).and_raise(ActiveRecord::RecordNotFound)
          allow(products).to receive(:find_by).with(id: product.id.to_s).and_return(product)
        end

        describe 'expects to receive' do
          it { expect(controller).to receive(:product_scope).and_return(products) }
          it { expect(products).to receive(:friendly).and_return(products) }
          it { expect(products).to receive(:find_by).with(id: product.id.to_s).and_return(product) }
          after { send_request }
        end

        describe 'assigns' do
          before { send_request }
          it { expect(assigns(:product)).to eq(product) }
        end

        describe 'response' do
          before { send_request }
          it { expect(response).to have_http_status(:ok) }
          it { expect(json_response[:id]).to eq(product.id) }
          it { expect(json_response[:name]).to eq(product.name) }
        end
      end

      context 'product not found' do
        before do
          allow(products).to receive(:friendly).and_return(products)
          allow(products).to receive(:find).with(product.id.to_s).and_raise(ActiveRecord::RecordNotFound)
          allow(products).to receive(:find_by).with(id: product.id.to_s).and_return(nil)
        end

        describe 'expects to receive' do
          it { expect(controller).to receive(:product_scope).and_return(products) }
          it { expect(products).to receive(:friendly).and_return(products) }
          it { expect(products).to receive(:find_by).with(id: product.id.to_s).and_return(nil) }
          after { send_request }
        end

        describe 'assigns' do
          before { send_request }
          it { expect(assigns(:product)).to eq(nil) }
        end

        describe 'response' do
          before { send_request }
          it { assert_not_found! }
        end
      end
    end
  end
end

