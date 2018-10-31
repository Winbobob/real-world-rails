require 'spec_helper'

describe 'API V2 Storefront Products Spec', type: :request do
  let!(:products)           { create_list(:product, 5) }
  let(:taxon)               { create(:taxon) }
  let(:product_with_taxon)  { create(:product, taxons: [taxon]) }
  let(:product_with_name)   { create(:product, name: 'Test Product') }
  let(:product_with_price)  { create(:product, price: 13.44) }
  let!(:option_type)        { create(:option_type) }
  let!(:option_value)       { create(:option_value, option_type: option_type) }
  let(:product_with_option) { create(:product, option_types: [option_type]) }
  let!(:variant)            { create(:variant, product: product_with_option, option_values: [option_value]) }
  let(:product)             { create(:product) }

  shared_examples 'returns proper status' do
    it 'returns a proper HTTP status' 

  end

  describe 'products#index' do
    context 'with no params' do
      before { get '/api/v2/storefront/products' }

      it_behaves_like 'returns proper status'

      it 'returns all products' 

    end

    context 'with specified ids' do
      before { get "/api/v2/storefront/products?filter[ids]=#{products.first.id}" }

      it_behaves_like 'returns proper status'

      it 'returns products with specified ids' 

    end

    context 'with specified price range' do
      before { get "/api/v2/storefront/products?filter[price]=#{product_with_price.price.to_f},#{product_with_price.price.to_f + 0.04}" }

      it_behaves_like 'returns proper status'

      it 'returns products with specified price' 

    end

    context 'with specified taxon_ids' do
      before { get "/api/v2/storefront/products?filter[taxons]=#{product_with_taxon.taxons.first.id}" }

      it_behaves_like 'returns proper status'

      it 'returns products with specified taxons' 

    end

    context 'with specified name' do
      before { get "/api/v2/storefront/products?filter[name]=#{product_with_name.name}" }

      it_behaves_like 'returns proper status'

      it 'returns products with specified name' 

    end

    context 'with specified options' do
      before { get "/api/v2/storefront/products?filter[options][#{option_type.name}]=#{option_value.name}" }

      it_behaves_like 'returns proper status'

      it 'returns products with specified options' 

    end

    context 'with specified multiple filters' do
      before { get "/api/v2/storefront/products?filter[name]=#{product_with_name.name}&filter[price]=#{product_with_name.price.to_f - 0.02},#{product_with_name.price.to_f + 0.02}" }

      it_behaves_like 'returns proper status'

      it 'returns products with specified name and price' 

    end

    context 'sort products' do
      context 'sorting by price' do
        context 'ascending order' do
          before { get '/api/v2/storefront/products?sort=price' }

          it_behaves_like 'returns proper status'

          it 'returns products sorted by price' 

        end

        context 'descending order' do
          before { get '/api/v2/storefront/products?sort=-price' }

          it_behaves_like 'returns proper status'

          it 'returns products sorted by price with descending order' 

        end
      end

      context 'sorting by updated_at' do
        context 'ascending order' do
          before { get '/api/v2/storefront/products?sort=updated_at' }

          it_behaves_like 'returns proper status'

          it 'returns products sorted by updated_at' 

        end

        context 'descending order' do
          before { get '/api/v2/storefront/products?sort=-updated_at' }

          it_behaves_like 'returns proper status'

          it 'returns products sorted by updated_at with descending order' 

        end
      end
    end

    context 'paginate products' do
      context 'with specified pagination params' do
        before { get '/api/v2/storefront/products?page=1&per_page=2' }

        it_behaves_like 'returns proper status'

        it 'returns specified amount products' 


        it 'returns proper meta data' 


        it 'returns proper links data' 

      end

      context 'without specified pagination params' do
        before { get '/api/v2/storefront/products' }

        it_behaves_like 'returns proper status'

        it 'returns specified amount products' 


        it 'returns proper meta data' 


        it 'returns proper links data' 

      end
    end
  end

  describe 'products#show' do
    context 'with non-existing product' do
      before { get '/api/v2/storefront/products/example' }

      it 'returns a proper HTTP status' 

    end

    context 'with existing product' do
      before { get "/api/v2/storefront/products/#{product.slug}" }

      it 'returns a proper HTTP status' 


      it 'returns a valid JSON response' 

    end
  end
end

