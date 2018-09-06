# frozen_string_literal: true

require 'spec_helper'

describe "Log entries", type: :feature do
  stub_authorization!

  let!(:payment) { create(:payment) }

  context "with a successful log entry" do
    before do
      response = ActiveMerchant::Billing::Response.new(
        true,
        "Transaction successful",
        transid: "ABCD1234"
      )

      payment.log_entries.create(
        details: response.to_yaml
      )
    end

    it "shows a successful attempt" 

  end

  context "with a failed log entry" do
    before do
      response = ActiveMerchant::Billing::Response.new(
        false,
        "Transaction failed",
        transid: "ABCD1234"
      )

      payment.log_entries.create(
        source: payment.source,
        details: response.to_yaml
      )
    end

    it "shows a failed attempt" 

  end
end

