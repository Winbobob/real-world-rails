require 'spec_helper'

class FakesController < Spree::Api::BaseController
end

describe Spree::Api::BaseController, type: :controller do
  render_views
  controller(Spree::Api::BaseController) do
    def index
      render plain: { 'products' => [] }.to_json
    end
  end

  before do
    @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
      r.draw { get 'index', to: 'spree/api/base#index' }
    end
  end

  context 'when validating based on an order token' do
    let!(:order) { create :order }

    context 'with a correct order token' do
      it 'succeeds' 


      it 'succeeds with an order_number parameter' 

    end

    context 'with an incorrect order token' do
      it 'returns unauthorized' 

    end
  end

  context 'cannot make a request to the API' do
    it 'without an API key' 


    it 'with an invalid API key' 


    it 'using an invalid token param' 

  end

  it 'handles parameter missing exceptions' 


  it 'handles record invalid exceptions' 


  it 'lets a subclass override the product associations that are eager-loaded' 

end

