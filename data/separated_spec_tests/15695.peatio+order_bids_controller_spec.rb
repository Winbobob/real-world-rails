require 'spec_helper'

describe Private::OrderBidsController do

  let(:member) do
    create(:member).tap {|m|
      m.get_account('cny').update_attributes(balance: '30000')
    }
  end

  let(:market) { Market.find('btccny') }
  let(:params) do
    { market_id: market.id,
      market:    market.id,
      ask:       market.base_unit,
      bid:       market.quote_unit,
      order_bid: { ord_type: 'limit', origin_volume: '12.13', price: '2014.47' }
    }
  end

  context 'POST :create' do
    it "should create a buy order" 


    it "should set order source to Web" 

  end

  context 'POST :clear' do
    it "should cancel all my bids in current market" 

  end

end

