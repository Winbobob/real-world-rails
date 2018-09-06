# frozen_string_literal: true

require 'spec_helper'

describe 'current order tracking', type: :controller do
  let!(:store) { create(:store) }
  let(:user) { create(:user) }

  controller(Spree::StoreController) do
    def index
      head :ok
    end
  end

  let(:order) { FactoryBot.create(:order) }

  it 'automatically tracks who the order was created by & IP address' 


  context "current order creation" do
    before { allow(controller).to receive_messages(try_spree_current_user: user) }

    it "doesn't create a new order out of the blue" 

  end
end

describe Spree::OrdersController, type: :controller do
  let(:user) { create(:user) }

  before { allow(controller).to receive_messages(try_spree_current_user: user) }

  describe Spree::OrdersController do
    it "doesn't create a new order out of the blue" 

  end
end

