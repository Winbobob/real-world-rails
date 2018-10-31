require 'spec_helper'

describe APIv2::OrderBooks do

  describe "GET /api/v2/order_book" do
    before do
      5.times { create(:order_bid) }
      5.times { create(:order_ask) }
    end

    it "should return ask and bid orders on specified market" 


    it "should return limited asks and bids" 

  end

  describe "GET /api/v2/depth" do
    let(:asks) { [['100', '2.0'], ['120', '1.0']] }
    let(:bids) { [['90', '3.0'], ['50', '1.0']] }

    before do
      global = mock("global", asks: asks, bids: bids)
      Global.stubs(:[]).returns(global)
    end

    it "should sort asks and bids from highest to lowest" 

  end

end

