# frozen_string_literal: true

require 'spec_helper'

describe "Cancelling + Resuming", type: :feature do
  stub_authorization!

  let(:user) { build_stubbed(:user, id: 123, spree_api_key: 'fake') }

  before do
    allow(user).to receive(:has_spree_role?).and_return(true)
    allow_any_instance_of(Spree::Admin::BaseController).to receive(:try_spree_current_user).and_return(user)
  end

  let(:order) do
    order = create(:order)
    order.update_columns({
      state: 'complete',
      completed_at: Time.current
    })
    order
  end

  it "can cancel an order" 


  context "with a cancelled order" do
    before do
      order.update_column(:state, 'canceled')
    end

    it "can resume an order" 

  end
end

