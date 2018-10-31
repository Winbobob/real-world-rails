require 'spec_helper'

describe Api::Admin::SubscriptionCustomerSerializer do
  let(:address) { build(:address) }
  let(:customer) { build(:customer) }
  let(:serializer) { Api::Admin::SubscriptionCustomerSerializer.new(customer) }
  let(:finder_mock) { instance_double(OpenFoodNetwork::AddressFinder, bill_address: address, ship_address: address) }

  before do
    allow(serializer).to receive(:finder) { finder_mock }
  end

  it "serializes a customer " 

end

