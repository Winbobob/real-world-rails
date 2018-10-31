describe BackfillSubscriptionsTransition do
  describe "#perform" do
    context "for users missing a Subscription" do
      it "creates one with the correct Stripe customer id" 

    end

    context "for users that already have a Subscription" do
      it "does nothing" 

    end
  end

  def stub_stripe_customers(customers)
    customer_list = double("Stripe::ListObject")
    iterator = allow(customer_list).to(receive(:each))

    customers.inject(iterator) do |iterator, customer|
      iterator.and_yield(
        double("Stripe::Customer", email: customer[:email], id: customer[:id]))
    end

    allow(Stripe::Customer).to(receive(:all).and_return(customer_list))
  end
end

