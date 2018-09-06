require "spec_helper"

describe PaypalService::Store::PaypalPayment do
  order = {
    community_id: 1,
    transaction_id: 1,
    payer_id: "7LFUVCDKGARH4",
    receiver_id: "URAPMR7WHFAWY",
    merchant_id: "asdfasdf",
    pending_reason: "order",
    order_id: "O-2ES620817J8424036",
    order_date: Time.now,
    order_total: Money.new(1000, "GBP")
  }

  auth_created = {:type=>:authorization_created,
    authorization_date: "2014-10-01 09:04:07 +0300",
    authorization_expires_date: "2014-10-04 09:50:00 +0300",
    order_id: "O-2ES620817J8424036",
    authorization_id: "0L584749FU2628910",
    payer_email: "foobar@barfoo.com",
    payer_id: "7LFUVCDKGARH4",
    receiver_email: "dev+paypal-user1@sharetribe.com",
    receiver_id: "URAPMR7WHFAWY",
    payment_status: "Pending",
    pending_reason: "authorization",
    receipt_id: "3609-0935-6989-4532",
    order_total: Money.new(120, "GBP"),
    authorization_total: Money.new(120, "GBP")
  }
  voided = {
    :type=>:payment_voided,
    :authorization_id=>"0L584749FU2628910",
    :order_id=>"O-2ES620817J8424036",
    :payer_id=>"7LFUVCDKGARH4",
    :payer_email=>"dev+paypal-user2@sharetribe.com",
    :receiver_id=>"URAPMR7WHFAWY",
    :receiver_email=>"dev+paypal-user1@sharetribe.com",
    :payment_status=>"Voided"
  }

  it "should return updated payment on ipn update" 


  it "should update status on ipn order created" 


  it "should void payment on ipn payment voided" 


  it "should create only one payment on duplicate create call" 

end

