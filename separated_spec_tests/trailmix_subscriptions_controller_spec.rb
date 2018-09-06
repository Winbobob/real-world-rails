require "rails_helper"

describe SubscriptionsController, sidekiq: :inline do
  describe "#create" do
    before do
      stub_sign_in
      stub_stripe_customer_create
    end

    context "with valid params" do
      it "creates a user, subscription, stripe customer, and email" 


      it "saves the Stripe customer id on the subscription" 

    end

    context "when the user is invalid" do
      it "does not create a new user, subscription, or stripe customer" 

    end

    context "when the credit card fails to charge" do
      it "does not create a user, subscription, or stripe customer" 

    end

    def default_params
      {
        email: 'foo@bar.com',
        password: 'password',
        stripe_card_id: 'abc123'
      }
    end

    def stub_stripe_charge_failure
      error = Stripe::CardError.new(double, double, double)
      allow(error).to(receive(:message).and_return("Failed to charge card"))

      allow(Stripe::Customer).to(receive(:create).and_raise(error))
    end

    def stub_stripe_customer_create(stripe_customer_id = "cus_123")
      allow(Stripe::Customer).to(
        receive(:create).and_return(
          double("Stripe::Customer", id: stripe_customer_id)))
    end

    def stub_sign_in
      allow(controller).to receive(:sign_in)
    end

    def stub_invalid_user
      user = double("user",
                    valid?: false,
                    errors: double('errors').as_null_object)
      allow(User).to(receive(:new).and_return(user))
    end
  end
end

