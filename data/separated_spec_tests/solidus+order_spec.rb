# frozen_string_literal: true

require 'rails_helper'

class FakesController < ApplicationController
  include Spree::Core::ControllerHelpers::Order
end

RSpec.describe Spree::Core::ControllerHelpers::Order, type: :controller do
  controller(FakesController) {}

  let(:user) { create(:user) }
  let(:order) { create(:order, user: user, store: store) }
  let(:store) { create(:store) }

  before do
    allow(controller).to receive_messages(current_store: store)
    allow(controller).to receive_messages(current_pricing_options: Spree::Config.pricing_options_class.new(currency: Spree::Config.currency))
    allow(controller).to receive_messages(try_spree_current_user: user)
  end

  describe '#simple_current_order' do
    it "returns an empty order" 

    it 'returns Spree::Order instance' 

    it 'assigns the current_store id' 

    it 'is deprecated' 

  end

  describe '#current_order' do
    context 'create_order_if_necessary option is false' do
      let!(:order) { create :order, user: user, store: store }
      it 'returns current order' 

    end

    context 'create_order_if_necessary option is true' do
      subject { controller.current_order(create_order_if_necessary: true) }

      it 'creates new order' 


      it 'assigns the current_store id' 


      it 'records last_ip_address' 

    end
  end

  describe '#associate_user' do
    before { allow(controller).to receive_messages(current_order: order) }
    context "user's email is blank" do
      let(:user) { create(:user, email: '') }
      it 'calls Spree::Order#associate_user! method' 

    end
    context "user isn't blank" do
      it 'does not calls Spree::Order#associate_user! method' 

    end
  end

  describe '#set_current_order' do
    let(:incomplete_order) { create(:order, store: incomplete_order_store, user: user) }

    context 'when current order not equal to users incomplete orders' do
      before { allow(controller).to receive_messages(current_order: order, last_incomplete_order: incomplete_order, cookies: double(signed: { guest_token: 'guest_token' })) }

      context "an order from another store" do
        let(:incomplete_order_store) { create(:store) }

        it 'doesnt call Spree::Order#merge! method' 

      end
      context "an order from the same store" do
        let(:incomplete_order_store) { store }

        it 'calls Spree::Order#merge! method' 

      end
    end
  end

  describe '#ip_address' do
    it 'returns remote ip' 

  end
end

