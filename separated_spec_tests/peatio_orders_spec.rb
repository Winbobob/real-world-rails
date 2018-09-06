require 'spec_helper'

describe APIv2::Orders do

  let(:member) { create(:member) }
  let(:token)  { create(:api_token, member: member) }

  describe "GET /api/v2/orders" do
    before do
      create(:order_bid, currency: 'btccny', price: '11'.to_d, volume: '123.123456789', member: member)
      create(:order_bid, currency: 'btccny', price: '12'.to_d, volume: '123.123456789', member: member, state: Order::CANCEL)
      create(:order_ask, currency: 'btccny', price: '13'.to_d, volume: '123.123456789', member: member)
      create(:order_ask, currency: 'btccny', price: '14'.to_d, volume: '123.123456789', member: member, state: Order::DONE)
    end

    it "should require authentication" 


    it "should validate market param" 


    it "should validate state param" 


    it "should return active orders by default" 


    it "should return complete orders" 


    it "should return paginated orders" 


    it "should sort orders" 


  end

  describe "GET /api/v2/order" do
    let(:order)  { create(:order_bid, currency: 'btccny', price: '12.326'.to_d, volume: '3.14', origin_volume: '12.13', member: member, trades_count: 1) }
    let!(:trade) { create(:trade, bid: order) }

    it "should get specified order" 


    it "should include related trades" 


    it "should get 404 error when order doesn't exist" 

  end

  describe "POST /api/v2/orders/multi" do
    before do
      member.get_account(:btc).update_attributes(balance: 100)
      member.get_account(:cny).update_attributes(balance: 100000)
    end

    it "should create a sell order and a buy order" 


    it "should create nothing on error" 

  end

  describe "POST /api/v2/orders" do
    it "should create a sell order" 


    it "should create a buy order" 


    it "should set order source to APIv2" 


    it "should return cannot lock funds error" 


    it "should give a number as volume parameter" 


    it "should give a number as price parameter" 

  end

  describe "POST /api/v2/order/delete" do
    let!(:order)  { create(:order_bid, currency: 'btccny', price: '12.326'.to_d, volume: '3.14', origin_volume: '12.13', locked: '20.1082', origin_locked: '38.0882', member: member) }

    context "succesful" do
      before do
        member.get_account(:cny).update_attributes(locked: order.price*order.volume)
      end

      it "should cancel specified order" 

    end

    context "failed" do
      it "should return order not found error" 

    end

  end

  describe "POST /api/v2/orders/clear" do

    before do
      create(:order_ask, currency: 'btccny', price: '12.326', volume: '3.14', origin_volume: '12.13', member: member)
      create(:order_bid, currency: 'btccny', price: '12.326', volume: '3.14', origin_volume: '12.13', member: member)

      member.get_account(:btc).update_attributes(locked: '5')
      member.get_account(:cny).update_attributes(locked: '50')
    end

    it "should cancel all my orders" 


    it "should cancel all my asks" 


  end
end

