require 'spec_helper'

describe APIv2::Trades do

  let(:member) do
    create(:verified_member).tap {|m|
      m.get_account(:btc).update_attributes(balance: 12.13,   locked: 3.14)
      m.get_account(:cny).update_attributes(balance: 2014.47, locked: 0)
    }
  end
  let(:token)  { create(:api_token, member: member) }

  let(:ask) { create(:order_ask, currency: 'btccny', price: '12.326'.to_d, volume: '123.123456789', member: member) }
  let(:bid) { create(:order_bid, currency: 'btccny', price: '12.326'.to_d, volume: '123.123456789', member: member) }

  let!(:ask_trade) { create(:trade, ask: ask, created_at: 2.days.ago) }
  let!(:bid_trade) { create(:trade, bid: bid, created_at: 1.day.ago) }

  describe 'GET /api/v2/trades' do
    it "should return all recent trades" 


    it "should return 1 trade" 


    it "should return trades before timestamp" 


    it "should return trades between id range" 


    it "should sort trades in reverse creation order" 


    it "should get trades by from and limit" 

  end

  describe 'GET /api/v2/trades/my' do
    it "should require authentication" 


    it "should return all my recent trades" 


    it "should return 1 trade" 


    it "should return trades before timestamp" 


    it "should return limit out of range error" 

  end

end

