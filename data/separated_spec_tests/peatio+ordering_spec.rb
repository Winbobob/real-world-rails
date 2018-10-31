require 'spec_helper'

describe Ordering do
  let(:order) { create(:order_bid, volume: '1.23456789', price: '1.23456789') }
  let(:account) { create(:account, balance: 100.to_d, locked: 100.to_d) }

  describe "ordering service can submit order" do
    before do
      order.stubs(:hold_account).returns(account)
      AMQPQueue.expects(:enqueue).with(:matching, anything)
    end

    it "should return true on success" 


    it "should set locked funds on order" 


    it "should compute locked after number precision fixed" 

  end

  describe "ordering service can cancel order" do
    before do
      order.stubs(:hold_account).returns(account)
    end

    it "should soft cancel order" 


    it "should hard cancel order" 

  end
end

