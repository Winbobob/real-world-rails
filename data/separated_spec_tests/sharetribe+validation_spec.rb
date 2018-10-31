require 'spec_helper'

describe TransactionService::Validation::ItemTotal do

  let(:item_total) { TransactionService::Validation::ItemTotal }

  it "calculates the item total" 

end

describe TransactionService::Validation::ShippingTotal do

  let(:shipping_total) { TransactionService::Validation::ShippingTotal }

  it "calculates the shipping total" 

end

describe TransactionService::Validation::OrderTotal do

  let(:item_total) { TransactionService::Validation::ItemTotal }
  let(:shipping_total) { TransactionService::Validation::ShippingTotal }
  let(:order_total) { TransactionService::Validation::OrderTotal }

  it "calculates the order total (item total + shipping total)" 

end

describe TransactionService::Validation::Validator do

  let(:validator) { TransactionService::Validation::Validator }

  describe "#validate_delivery_method" do

    context "valid" do
      it "passes valid delivery method" 

    end

    context "invalid" do

      it "fails for invalid delivery method" 


      it "fails if delivery method is missing" 

    end
  end

  describe "#validate_booking" do
    context "valid" do
      it "passes for valid booking dates" 


      it "passes if booking is not in use" 

    end

    context "invalid" do
      it "fails if start date is after end date" 


      it "fails if start date equals end date for night selector" 


      it "fails if start date or end date is missing for day selector" 


      it "fails if start date or end date is missing for night selector" 


      it "fails if start date is to late" 


      it "fails if start date is to late. stripe in use" 

    end
  end

  describe "#validate_transaction_agreement" do
    context "valid" do
      it "passes if agreement is in use and agreed" 


      it "passes if agreement is not in use" 


    end

    context "invalid" do
      it "fails if agreement is in use but not agreed" 

    end
  end
end

