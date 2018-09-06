require "rails_helper"

describe CancellationsController do
  describe "#create" do
    context "when signed in" do
      it "destroys the current user" 


      it "creates a Cancellation" 


      it "cancels the Stripe subscription" 

    end

    context "when signed out" do
      it "redirects to sign in" 

    end

    def stub_stripe(customer_id)
      double("Stripe::Subscription", delete: true).tap do |subscription|
        customer = double(
          "Stripe::Customer",
          id: customer_id,
          subscriptions: [subscription]
        )

        allow(Stripe::Customer).to(
          receive(:retrieve).with(customer_id).and_return(customer)
        )
      end
    end
  end
end

