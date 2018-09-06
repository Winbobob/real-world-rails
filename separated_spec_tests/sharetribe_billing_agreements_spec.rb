require "spec_helper"

describe PaypalService::API::BillingAgreements do

  let(:account_store) { PaypalService::Store::PaypalAccount }

  before(:each) do
    # Test version of merchant client
    PaypalService::API::Api.reset!
    @events = PaypalService::API::Api.build_test_events
    @api_builder = PaypalService::API::Api.api_builder
    @payments = PaypalService::API::Api.build_test_payments(events: @events)
    @billing_agreements = PaypalService::API::Api.billing_agreements

    @process = PaypalService::API::Process.new


    # Test data

    @cid = 10
    @person_id = "merchant_id_1"
    @paypal_email = "merchant_1@test.com"
    @paypal_email_admin = "admin_2@test.com"

    @payer_id = "payer_id_1"
    @admin_person_id = "admin_merchant_id"
    @payer_id_admin = "payer_id_2"

    @billing_agreement_id = "bagrid"

    # Normal personal account
    account_store.create(opts:
      {
        active: true,
        person_id: @person_id,
        community_id: @cid,
        email: @paypal_email,
        payer_id: @payer_id,
        order_permission_paypal_username_to: "sharetribe@sharetribe.com",
        order_permission_request_token: "123456789",
        billing_agreement_billing_agreement_id: @billing_agreement_id,
        billing_agreement_request_token: "request-token",
        billing_agreement_paypal_username_to: @paypal_email_admin
      })

    # Admin personal account (same Paypal account as Community account)
    account_store.create(opts:
      {
        active: true,
        person_id: @admin_person_id,
        community_id: @cid,
        email: @paypal_email_admin,
        payer_id: @payer_id_admin,
        order_permission_paypal_username_to: "sharetribe@sharetribe.com",
        order_permission_request_token: "123456789",
        billing_agreement_billing_agreement_id: @billing_agreement_id,
        billing_agreement_request_token: "request-token",
        billing_agreement_paypal_username_to: @paypal_email_admin
      })

    # Community account
    account_store.create(opts:
      {
        active: true,
        community_id: @cid,
        email: @paypal_email_admin,
        payer_id: @payer_id_admin,
        order_permission_paypal_username_to: "sharetribe@sharetribe.com",
        order_permission_request_token: "123456789"
      })

    @tx_id = 1234

    SyncDelayedJobObserver.reset!
  end

  after(:each) do
    # Do not leave before an active synchronous delayed job runner
    SyncDelayedJobObserver.reset!
  end

  def do_payment!(seller_person_id)
    @req_info = {
      transaction_id: @tx_id,
      item_name: "Item name",
      item_quantity: 1,
      item_price: Money.new(1200, "EUR"),
      merchant_id: seller_person_id,
      item_total: Money.new(1200, "EUR"),
      order_total: Money.new(1200, "EUR"),
      success: "https://www.test.com/success",
      cancel: "https://www.test.com/cancel"
    }

    @payment_total = Money.new(1200, "EUR")
    token = @payments.request(@cid, @req_info)[:data]
    @payments.create(@cid, token[:token])[:data]
    @events.clear

    @commission_info = {
      transaction_id: @tx_id,
      commission_to_admin: Money.new(100, "EUR"),
      minimum_commission: Money.new(50, "EUR"),
      payment_name: "commission payment",
      payment_desc: "commission payment desc"
    }
  end

  context "#charge_commission" do

    it "charges the commission and updates the payment" 


    it "marks the commission to not applicable when admin is merchant" 


    it "marks the commission errored if payment failed" 


    it "supports async running" 

  end
end

