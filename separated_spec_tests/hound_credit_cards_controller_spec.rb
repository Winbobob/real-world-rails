require "rails_helper"

describe CreditCardsController, "#update" do
  context "when credit card is updated" do
    it "responds with 200" 

  end

  context "when credit card fails to update" do
    it "responds with 422" 


    it "captures exception" 

  end

  def request_credit_card_update_and_fail
    customer = double("PaymentGatewayCustomer", update_card: false)
    allow(PaymentGatewayCustomer).to receive(:new).and_return(customer)
    stub_sign_in(create(:user))

    put :update, params: { card_token: "cardtoken" }, format: :json
  end
end

