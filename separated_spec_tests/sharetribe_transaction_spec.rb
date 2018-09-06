require 'spec_helper'

describe TransactionService::Store::Transaction do

  let(:paypal_account_model) { ::PaypalAccount }
  let(:transaction_store) { TransactionService::Store::Transaction }
  let(:transaction_model) { ::Transaction }

  before(:each) do
    @community = FactoryGirl.create(:community)
    @cid = 3
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
      community_uuid: @community.uuid_object,
      starter_id: @payer.id,
      starter_uuid: @payer.uuid_object,
      listing_id: @listing.id,
      listing_uuid: @listing.uuid_object,
      listing_title: @listing.title,
      unit_price: @listing.price,
      availability: @listing.availability,
      listing_author_id: @listing.author_id,
      listing_author_uuid: @listing.author.uuid_object,
      listing_quantity: 1,
      automatic_confirmation_after_days: 3,
      commission_from_seller: 10,
      minimum_commission: Money.new(20, "EUR")
    }

    @booking_fields = {
      start_on: Date.new(2016, 11, 2),
      end_on: Date.new(2016, 11, 3)
    }
  end

  context "#create" do
    it "creates transactions with deleted set to false" 


    it "creates a transaction with booking" 

  end

  context "#delete" do
    it "sets deleted flag for the given transaction_id" 


    it "deleted transaction are not returned by get" 


    it "deleted transaction are not returned by get_in_community" 

  end
end
