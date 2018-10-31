require 'spec_helper'

describe Spree::Core::Search::Base do
  before do
    include Spree::Core::ProductFilters
    @taxon = create(:taxon, name: 'Ruby on Rails')

    @product1 = create(:product, name: 'RoR Mug', price: 9.00)
    @product1.taxons << @taxon
    @product2 = create(:product, name: 'RoR Shirt', price: 11.00)
  end

  it 'returns all products by default' 


  context 'when include_images is included in the initalization params' do
    subject { described_class.new(params).retrieve_products }

    let(:params) { { include_images: true, keyword: @product1.name, taxon: @taxon.id } }

    before do
      @product1.master.images << create(:image, position: 2)
      @product1.master.images << create(:image, position: 1)
      @product1.reload
    end

    it 'returns images in correct order' 

  end

  it 'switches to next page according to the page parameter' 


  it 'maps search params to named scopes' 


  it 'maps multiple price_range_any filters' 


  it 'uses ransack if scope not found' 


  it 'accepts a current user' 


  it 'finds products in alternate currencies' 

end

