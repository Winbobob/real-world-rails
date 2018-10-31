# frozen_string_literal: true

require 'spec_helper'

class FakesController < Spree::Api::BaseController
end

describe Spree::Api::BaseController, type: :controller do
  render_views
  controller(Spree::Api::BaseController) do
    rescue_from Spree::Order::InsufficientStock, with: :insufficient_stock_error

    def index
      render json: { "products" => [] }
    end
  end

  before do
    @routes = ActionDispatch::Routing::RouteSet.new.tap do |r|
      r.draw { get 'index', to: 'spree/api/base#index' }
    end
  end

  context "when validating based on an order token" do
    let!(:order) { create :order }

    context "with a correct order token" do
      it "succeeds" 


      it "succeeds with an order_number parameter" 

    end

    context "with an incorrect order token" do
      it "returns unauthorized" 

    end
  end

  context "cannot make a request to the API" do
    it "without an API key" 


    it "with an invalid API key" 


    it "using an invalid token param" 

  end

  it "lets a subclass override the product associations that are eager-loaded" 


  context 'insufficient stock' do
    before do
      expect(subject).to receive(:authenticate_user).and_return(true)
      expect(subject).to receive(:index).and_raise(Spree::Order::InsufficientStock)
      get :index, params: { token: "fake_key" }
    end

    it "should return a 422" 


    it "returns an error message" 

  end

  context 'lock_order' do
    let!(:order) { create :order }

    controller(Spree::Api::BaseController) do
      around_action :lock_order

      def index
        render json: { "products" => [] }
      end
    end

    context 'without an existing lock' do
      it 'succeeds' 

    end

    context 'with an existing lock' do
      around do |example|
        Spree::OrderMutex.with_lock!(order) { example.run }
      end

      it 'returns a 409 conflict' 

    end
  end
end

