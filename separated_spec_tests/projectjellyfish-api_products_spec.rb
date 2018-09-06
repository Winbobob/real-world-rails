require 'rails_helper'

RSpec.describe 'Products API' do
  let(:default_params) { { format: :json } }

  describe 'GET index' do
    before(:each) do
      @product = create(:product)
      sign_in_as create :staff
      @products = Product.all
    end

    it 'returns a collection of all of the products', :show_in_doc do
      get '/api/v1/products'
      expect(json.map { |product| product['id'] }).to eq(@products.map(&:id))
    end

    it 'paginates the products' 

  end

  describe 'GET show' do
    before(:each) do
      @product = create :product
      sign_in_as create :staff
    end

    it 'returns an product', :show_in_doc do
      get "/api/v1/products/#{@product.id}"
      expect(json['id']).to eq(@product.id)
    end

    it 'returns an error when the product does not exist' 

  end

  describe 'DELETE destroy' do
    before :each do
      @product = create :product
      sign_in_as create :staff, :admin
    end

    it 'removes the product', :show_in_doc do
      delete "/api/v1/products/#{@product.id}"
      expect(response.status).to eq(204)
    end

    it 'returns an error when the product does not exist' 

  end

  describe 'POST create' do
    it 'creates a product without any answers' 


    it 'maps provisioning_answers to a hash' 

  end
end

