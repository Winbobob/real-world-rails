require 'spec_helper'

describe Api::OrderSerializer do
  let(:serializer) { Api::OrderSerializer.new order }
  let(:order) { create(:completed_order_with_totals) }

  let!(:completed_payment) { create(:payment, order: order, state: 'completed', amount: order.total - 1) }
  let!(:payment) { create(:payment, order: order, state: 'checkout', amount: 123.45) }

  it "serializes an order" 


  it "convert the state attributes to translatable keys" 


  it "only serializes completed payments" 

end

