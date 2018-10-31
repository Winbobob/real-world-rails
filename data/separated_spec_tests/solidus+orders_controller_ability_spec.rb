# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe OrdersController, type: :controller do
    ORDER_TOKEN = 'ORDER_TOKEN'

    let!(:store) { create(:store) }
    let(:user) { create(:user) }
    let(:guest_user) { create(:user) }
    let(:order) { Spree::Order.create }
    let(:variant) { create(:variant) }

    it 'should understand order routes with token' 


    context 'when an order exists in the cookies.signed' do
      let(:token) { 'some_token' }

      before do
        allow(controller).to receive_messages current_order: order
        allow(controller).to receive_messages spree_current_user: user
      end

      context '#populate' do
        it 'should check if user is authorized for :update' 

      end

      context '#edit' do
        it 'should check if user is authorized for :read' 

      end

      context '#update' do
        it 'should check if user is authorized for :update' 

      end

      context '#empty' do
        it 'should check if user is authorized for :update' 

      end

      context "#show" do
        let(:specified_order) { create(:order) }

        it "should check against the specified order" 

      end
    end

    context 'when no authenticated user' do
      let(:order) { create(:order, number: 'R123') }

      context '#show' do
        context 'when token parameter present' do
          it 'always ooverride existing token when passing a new one' 


          it 'should store as guest_token in session' 

        end

        context 'when no token present' do
          it 'should respond with 404' 

        end
      end
    end
  end
end

