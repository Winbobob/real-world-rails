require 'spec_helper'

describe 'Taxons Spec', type: :request do
  let!(:taxonomy)  { create(:taxonomy) }
  let!(:taxons)    { create_list(:taxon, 2, taxonomy: taxonomy, parent_id: taxonomy.root.id) }

  shared_examples 'returns proper status' do
    it 'returns a proper HTTP status' 

  end

  shared_examples 'returns valid taxon resource JSON' do
    it 'returns a valid taxon resource JSON response' 

  end

  describe 'taxons#index' do
    context 'with no params' do
      before { get '/api/v2/storefront/taxons' }

      it_behaves_like 'returns proper status'

      it 'returns all taxons' 

    end

    context 'by roots' do
      before { get '/api/v2/storefront/taxons?roots=true' }

      it_behaves_like 'returns proper status'

      it 'returns taxons by roots' 

    end

    context 'by parent' do
      before { get "/api/v2/storefront/taxons?parent_id=#{taxonomy.root.id}" }

      it_behaves_like 'returns proper status'

      it 'returns children taxons by parent' 

    end

    context 'by taxonomy' do
      before { get "/api/v2/storefront/taxons?taxonomy_id=#{taxonomy.id}" }

      it_behaves_like 'returns proper status'

      it 'returns taxons by taxonomy' 

    end

    context 'by ids' do
      before { get "/api/v2/storefront/taxons?ids=#{taxons.map(&:id).join(',')}" }

      it_behaves_like 'returns proper status'

      it 'returns taxons by ids' 

    end

    context 'paginate taxons' do
      context 'with specified pagination params' do
        before { get '/api/v2/storefront/taxons?page=1&per_page=1' }

        it_behaves_like 'returns proper status'

        it 'returns specified amount of taxons' 


        it 'returns proper meta data' 


        it 'returns proper links data' 

      end

      context 'without specified pagination params' do
        before { get '/api/v2/storefront/taxons' }

        it_behaves_like 'returns proper status'

        it 'returns specified amount of taxons' 


        it 'returns proper meta data' 


        it 'returns proper links data' 

      end
    end
  end

  describe 'taxons#show' do
    context 'by id' do
      before do
        get "/api/v2/storefront/taxons/#{taxons.first.id}"
      end

      it_behaves_like 'returns valid taxon resource JSON'

      it 'returns taxon by id' 

    end

    context 'by permalink' do
      before do
        get "/api/v2/storefront/taxons/#{Spree::Taxon.first.permalink}"
      end

      it_behaves_like 'returns valid taxon resource JSON'

      it 'returns taxon by permalink' 

    end
  end
end

