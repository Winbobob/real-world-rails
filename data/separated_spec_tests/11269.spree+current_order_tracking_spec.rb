require 'spec_helper'

describe 'current order tracking', type: :controller do # rubocop:disable RSpec/MultipleDescribes
  let(:user) { create(:user) }

  before { create(:order) }

  controller(Spree::StoreController) do
    def index
      head :ok
    end
  end

  it 'automatically tracks who the order was created by & IP address' 


  context 'current order creation' do
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

