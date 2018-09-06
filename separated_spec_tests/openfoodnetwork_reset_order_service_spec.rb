require 'spec_helper'

describe ResetOrderService do
  let(:current_token) { double(:current_token) }
  let(:current_distributor) { double(:distributor) }
  let(:current_order) do
    double(
      :current_order,
      token: current_token,
      distributor: current_distributor
    )
  end
  let(:tokenized_permission) { double(:tokenized_permission, save!: true) }
  let(:new_order) do
    double(
      :new_order,
      set_distributor!: true,
      tokenized_permission: tokenized_permission,
    )
  end
  let(:controller) do
    double(
      :controller,
      current_order: new_order,
      expire_current_order: true
    )
  end
  let(:reset_order_service) { described_class.new(controller, current_order) }

  before do
    allow(new_order)
      .to receive(:tokenized_permission)
      .and_return(tokenized_permission)

    allow(tokenized_permission).to receive(:token=)
  end

  describe '#call' do
    it 'creates a new order' 


    it 'sets the new order\'s distributor to the same as the old order' 


    it 'sets the token of the tokenized permissions' 


    it 'persists the tokenized permissions' 

  end
end

