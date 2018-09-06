require "spec_helper"

describe PaypalService::API::Payments do

  let(:token_store) { PaypalService::Store::Token }
  let(:payment_store) { PaypalService::Store::PaypalPayment }
  let(:account_store) { PaypalService::Store::PaypalAccount }

  before(:each) do
    # Test version of merchant client
    PaypalService::API::Api.reset!
    @events = PaypalService::API::Api.build_test_events
    @api_builder = PaypalService::API::Api.api_builder
    @payments = PaypalService::API::Api.build_test_payments(events: @events)

    @process = PaypalService::API::Process.new


    # Test data

    @cid = 10
    @mid = "merchant_id_1"
    @paypal_email = "merchant_1@test.com"
    @payer_id = "payer_id_1"

    account_store.create(opts:
      {
        active: true,
        person_id: @mid,
        community_id: @cid,
        email: @paypal_email,
        payer_id: @payer_id,
        order_permission_paypal_username_to: "sharetribe@sharetribe.com",
        order_permission_request_token: "123456789"
      })

    @tx_id = 1234

    @req_info = {
      transaction_id: @tx_id,
      payment_action: :order,
      item_name: "Item name",
      item_quantity: 1,
      item_total: Money.new(1200, "EUR"),
      item_price: Money.new(1200, "EUR"),
      merchant_id: @mid,
      order_total: Money.new(1200, "EUR"),
      success: "https://www.test.com/success",
      cancel: "https://www.test.com/cancel"
    }

    @req_info_auth = {
      transaction_id: @tx_id,
      payment_action: :authorization,
      item_name: "Item name",
      item_quantity: 1,
      item_total: Money.new(1200, "EUR"),
      item_price: Money.new(1200, "EUR"),
      merchant_id: @mid,
      order_total: Money.new(1200, "EUR"),
      success: "https://www.test.com/success",
      cancel: "https://www.test.com/cancel"
    }

    SyncDelayedJobObserver.reset!
  end

  after(:each) do
    # Do not leave before an active synchronous delayed job runner
    SyncDelayedJobObserver.reset!
  end

  context "#request and #request_cancel" do
    it "saves token info" 


    it "saves token info, using payment_action :authorization" 


    it "tries the paypal api call at least 3 times in case of 10001" 


    it "cancel deletes token and fires request_cancelled event" 


    it "cancel fires no events for non-existent token" 


    it "supports async running" 


  end

  context "#create" do
    it "creates, authorizes and saves the new payment" 


    it "creates authorized new payment and saves it, payment_action :authorization" 


    it "returns error with parseable error_code when payment needs review" 


    it "triggers payment_created event followed by payment_updated" 


    it "triggers payment_created event only, payment_action :authorization" 


    it "triggers order_details event with shipping info" 


    it "will retry at least 3 times" 


    it "deletes request token when payment created" 


    it "deletes request token when payment created" 


    it "returns failure and fires no events when called with non-existent token" 


    it "deletes token and fires request_cancelled after 3 paypal api failures" 


    it "voids payment after 5 authorization failures" 


    it "keeps token and returns redirect_url in error data upon 10486 error" 


    it "supports async running" 


  end

  context "#full_capture" do
    before(:each) do
      @payment_total = Money.new(1200, "EUR")
      token = @payments.request(@cid, @req_info_auth)[:data]
      @payments.create(@cid, token[:token])[:data]
      @events.clear
    end

    it "completes the payment with given payment_total" 


    it "fires payment_updated event" 


    it "will retry at least 5 times in case of 10001" 


    it "returns failure and fires no events if called for non-existent payment" 


    it "only captures a payment once, second time returns failure" 


    it "voids payment and fires payment_updated after 5 paypal api fails" 


    it "supports async running" 

  end

  context "#void" do
    before(:each) do
      @payment_total = Money.new(1200, "EUR")
      token = @payments.request(@cid, @req_info)[:data]
      @payments.create(@cid, token[:token])[:data]
      @events.clear
    end

    it "voids an authorized payment" 


    it "triggers a payment updated event" 


    it "will retry at least 5 times" 


    it "cannot void the same payment twice" 


    it "cannot void a captured payment" 


    it "does nothing if called for non-existent payment" 


    it "support async running" 

  end

  context "#get_payment" do
    it "returns payment for given commmunity_id and transaction_id" 

  end

  context "#retry_and_clean_tokens" do
    it "retries payment and completes if payment now authorized" 


    it "leaves token in place if op fails but clean time limit not reached" 


    it "removes token if op fails and clean time limit reached" 


    it "doesn't remove token when op fails, clean time limit reached but payment in :payment-review state" 

  end

end

