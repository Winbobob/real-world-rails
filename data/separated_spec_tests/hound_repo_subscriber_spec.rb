require "rails_helper"

describe RepoSubscriber do
  describe ".subscribe" do
    context "when Stripe customer exists" do
      context "when a subscription doesn't exist" do
        it "creates a new Stripe subscription and repo subscription" 


        it "creates a Stripe subscription using new card" 

      end

      context "when a subscription exists" do
        it "increments the Stripe subscription and updates repo subscription" 

      end
    end

    context "when Stripe customer does not exist" do
      it "creates a new Stripe customer, subscription and repo subscription" 

    end

    context "when Stripe subscription fails" do
      it "returns false" 


      it "reports raised exceptions to Sentry" 

    end

    context "when repo subscription fails to create" do
      it "deleted the stripe subscription" 

    end

    context "when repo already has a subscription" do
      context "and it is not marked as deleted" do
        it "returns the existing subscription" 

      end
    end
  end

  describe ".unsubscribe" do
    it "downgrades the Stripe plan" 


    context "when Stripe unsubscription fails" do
      it "returns false" 


      it "reports raised exceptions to Sentry" 

    end
  end

  def subscription_with_user
    user = create(:user, stripe_customer_id: stripe_customer_id)
    repo = create(:repo, :private, users: [user])
    create(
      :subscription,
      stripe_subscription_id: stripe_subscription_id,
      user: user,
      repo: repo,
    )
  end
end

