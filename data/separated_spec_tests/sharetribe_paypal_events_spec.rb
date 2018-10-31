require 'spec_helper'

describe TransactionService::PaypalEvents do

  let(:token_store) { PaypalService::Store::Token }
  let(:payment_store) { PaypalService::Store::PaypalPayment }
  let(:transaction_model) { ::Transaction }
  let(:paypal_account_model) { ::PaypalAccount }

  def run_worker!(quiet: true)
    Delayed::Worker.new(
      quiet: quiet # you might want to change this to false for debugging
    ).work_off
  end

  # Simulate TransactionService::Transactions.create but without calling to paypal payments API
  def create_test_transaction(opts)
    transaction = transaction_model.new(
      community_id: opts[:community_id],
      community_uuid: opts[:community_uuid],
      listing_id: opts[:listing_id],
      listing_uuid: opts[:listing_uuid],
      listing_title: opts[:listing_title],
      listing_author_id: opts[:listing_author_id],
      listing_author_uuid: opts[:listing_author_uuid],
      starter_id: opts[:starter_id],
      starter_uuid: opts[:starter_uuid],
      unit_price: opts[:unit_price],
      listing_quantity: Maybe(opts)[:listing_quantity].or_else(1),
      payment_gateway: opts[:payment_gateway],
      payment_process: opts[:payment_process],
      commission_from_seller: Maybe(opts[:commission_from_seller]).or_else(0),
      automatic_confirmation_after_days: 14,
      minimum_commission: opts[:minimum_commission])

    conversation = transaction.build_conversation(
      community_id: opts[:community_id],
      listing_id: opts[:listing_id])

    conversation.participations.build(
      person_id: opts[:listing_author_id],
      is_starter: false,
      is_read: false)

    conversation.participations.build(
      person_id: opts[:starter_id],
      is_starter: true,
      is_read: true)

    if opts[:content].present?
      conversation.messages.build({
          content: opts[:content],
          sender_id: opts[:starter_id]})
    end

    transaction.save!
    transaction.reload
  end

  before(:each) do
    @community = FactoryGirl.create(:community)
    @cid = @community.id
    @payer = FactoryGirl.create(:payer)
    @listing = FactoryGirl.create(:listing,
                                  price: Money.new(45000, "EUR"),
                                  listing_shape_id: 123, # This is not used, but needed because the Entity value is mandatory
                                  transaction_process_id: 123) # This is not used, but needed because the Entity value is mandatory

    @paypal_account = paypal_account_model.create(person_id: @listing.author, community_id: @cid, email: "author@sharetribe.com", payer_id: "abcdabcd")

    @transaction_info = {
      payment_process: :preauthorize,
      payment_gateway: :paypal,
      community_id: @cid,
      community_uuid: @community.uuid, # raw UUID
      starter_id: @payer.id,
      starter_uuid: @payer.uuid, # raw UUID
      listing_id: @listing.id,
      listing_title: @listing.title,
      listing_uuid: @listing.uuid, # raw UUID
      unit_price: @listing.price,
      listing_author_id: @listing.author_id,
      listing_author_uuid: @listing.author.uuid, # raw UUID
      listing_quantity: 1,
      automatic_confirmation_after_days: 3,
      commission_from_seller: 10,
      minimum_commission: Money.new(20, "EUR")
    }

    @transaction_no_msg = create_test_transaction(@transaction_info)
    TransactionService::StateMachine.transition_to(@transaction_no_msg, "initiated")
    @conversation_no_msg = @transaction_no_msg.conversation

    @transaction_with_msg = create_test_transaction(@transaction_info.merge(content: "A test message"))
    TransactionService::StateMachine.transition_to(@transaction_with_msg, "initiated")
    @conversation_with_msg = @transaction_with_msg.conversation

    token_code_no_msg = SecureRandom.uuid
    token_store.create({
        community_id: @cid,
        token: token_code_no_msg,
        transaction_id: @transaction_no_msg.id,
        merchant_id: @transaction_no_msg.starter_id,
        receiver_id: @paypal_account.payer_id,
        item_name: @listing.title,
        item_quantity: 1,
        item_price: Money.new(45000, "EUR"),
        express_checkout_url: "htts://test.com/#{token_code_no_msg}"
      })

    token_code_with_msg = SecureRandom.uuid
    token_store.create({
        community_id: @cid,
        token: token_code_with_msg,
        transaction_id: @transaction_with_msg.id,
        merchant_id: @transaction_with_msg.starter_id,
        receiver_id: @paypal_account.payer_id,
        item_name: @listing.title,
        item_quantity: 1,
        item_price: Money.new(45000, "EUR"),
        express_checkout_url: "htts://test.com/#{token_code_with_msg}"
      })

    @token_no_msg = token_store.get(@cid, token_code_no_msg)
    @token_with_msg = token_store.get(@cid, token_code_with_msg)
  end


  context "#request_cancelled" do
    it "marks the transaction associated with the cancelled token as deleted" 


    it "calling with token that doesn't match a transaction is a no-op" 

  end

  context "#payment_updated - initiated => payment-review" do
    before(:each) do
      @payment_review_payment = payment_store.create(@cid, @transaction_with_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "payment-review",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
          authorization_id: SecureRandom.uuid,
          authorization_date: Time.now,
          authorization_total: Money.new(22000, "EUR"),
        })
    end

    it "keeps transaction in initiated state" 

  end

  context "#payment_updated - initiated => authorized" do
    before(:each) do
      @authorized_payment = payment_store.create(@cid, @transaction_with_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "authorization",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
          authorization_id: SecureRandom.uuid,
          authorization_date: Time.now,
          authorization_total: Money.new(22000, "EUR"),
        })
    end

    it "transitions transaction to preauthorized state" 


    it "is safe to call for non-existent transaction" 

  end

  context "#payment_updated - initiated => voided" do
    before(:each) do
      payment_store.create(@cid, @transaction_no_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "authorization",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
        })
      @voided_payment_no_msg = payment_store.update(community_id: @cid, transaction_id: @transaction_no_msg.id, data: {
          pending_reason: :none,
          payment_status: :voided
        })

      payment_store.create(@cid, @transaction_with_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "authorization",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
        })
      @voided_payment_with_msg = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          pending_reason: :none,
          payment_status: :voided
        })
    end

    it "removes the associated transaction" 


    it "is safe to call for non-existent transaction" 

  end

  context "#update_transaction_details" do
    before(:each) do
      @order_details = {
        status: "Confirmed",
        city: "city",
        country: "country",
        country_code: "CC",
        name: "name",
        phone: "123456",
        postal_code: "WX1GQ",
        state_or_province: "state",
        street1: "street1",
        street2: "street2"
      }

    end

    it "saves address details" 


    it "doesn't record shipping address with no fields" 


    it "doesn't record shipping address with only status field" 

  end

  context "#payment_updated - preauthorized => voided" do
    before(:each) do
      payment_store.create(@cid, @transaction_with_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "authorization",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
        })

      @authorized_payment = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          payment_status: "pending",
          pending_reason: "authorization",
          authorization_id: "12345678",
          authorization_date: Time.now,
          authorization_total: Money.new(22000, "EUR")
        })

      TransactionService::PaypalEvents.payment_updated(:success, @authorized_payment)
      run_worker!

      @voided_payment_with_msg = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          pending_reason: :none,
          payment_status: :voided
        })
    end

    it "on error transitions the associated transaction to errored" 

  end

  context "#payment_preauthorized -> expired" do
    before(:each) do
      payment_store.create(@cid, @transaction_with_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "authorization",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
        })

      @authorized_payment = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          payment_status: "pending",
          pending_reason: "authorization",
          authorization_id: "12345678",
          authorization_date: Time.now,
          authorization_total: Money.new(22000, "EUR")
        })

      TransactionService::PaypalEvents.payment_updated(:success, @authorized_payment)
      run_worker!

      @expired_payment = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          payment_status: "expired",
          authorization_id: "12345678"
        })

    end

    it "transitions associated transaction to rejected on expiration" 

  end

  context "#payment_updated preauthorized -> denied" do
    before(:each) do
      payment_store.create(@cid, @transaction_with_msg.id, {
          payer_id: "sduyfsudf",
          receiver_id: "98ysdf98ysdf",
          merchant_id: "asdfasdf",
          pending_reason: "authorization",
          order_id: SecureRandom.uuid,
          order_date: Time.now,
          order_total: Money.new(22000, "EUR"),
        })

      @authorized_payment = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          payment_status: "pending",
          pending_reason: "authorization",
          authorization_id: "12345678",
          authorization_date: Time.now,
          authorization_total: Money.new(22000, "EUR")
        })

      TransactionService::PaypalEvents.payment_updated(:success, @authorized_payment)
      run_worker!

      @pending_ext_payment = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          payment_status: "pending",
          pending_reason: "multicurrency",
          authorization_id: "12345678"
        })

      TransactionService::PaypalEvents.payment_updated(:success, @pending_ext_payment)
      run_worker!

      @denied_payment_with_msg = payment_store.update(community_id: @cid, transaction_id: @transaction_with_msg.id, data: {
          pending_reason: :none,
          payment_status: :denied
      })
    end

    it "on payment deny transitions the associated transaction to rejected" 

  end
end

