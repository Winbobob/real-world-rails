require 'spec_helper'

describe Private::OrderAsksController do

  let(:member) do
    create(:member).tap {|m|
      m.get_account('btc').update_attributes(balance: '20')
    }
  end

  let(:market) { Market.find('btccny') }
  let(:params) do
    { market_id: market.id,
      market:    market.id,
      ask:       market.base_unit,
      bid:       market.quote_unit,
      order_ask: { ord_type: 'limit', origin_volume: '12.13', price: '2014.47' }
    }
  end

  context 'POST :create' do
    it "should create a sell order" 


    it "should set order source to Web" 

  end

  context 'POST :clear' do
    it "should cancel all my asks in current market" 

  end

end

