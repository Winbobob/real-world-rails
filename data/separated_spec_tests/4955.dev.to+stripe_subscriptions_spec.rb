# rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
require "rails_helper"

RSpec.describe "StripeSubscriptions", type: :request do
  let(:user) { create(:user, :super_admin) }
  let(:mock_instance) { instance_double(MembershipService) }
  let(:stripe_helper) { StripeMock.create_test_helper }

  before do
    StripeMock.start
    sign_in user
  end

  after { StripeMock.stop }

  describe "POST StripeSubscriptions#create" do
    context "when a valid request is made" do
      # Amount is a string here because Stripe returns a string when form is submitted
      before do
        post "/stripe_subscriptions", params: {
          amount: "12",
          stripe_token: stripe_helper.generate_card_token
        }
      end

      it "creates a customer in Stripe and assigns it to the correct user" 


      it "assigns the proper role based on the amount" 


      it "updates the user's monthly_dues with the proper amount" 


      it "redirects to /settings/membership" 

    end

    it "can't accept anything less than $1" 


    # only one type of invalid request right now
    context "when an invalid request is made" do
      it "redirects to /enter if there's no current_user" 


      it "errors if amount is less than 0" 


      it "errors if amount is 0" 


      it "denies requests without credit card" 

    end

    it "handles errors if MembershipService#subscribe_customer fails" 

  end

  describe "PUT StripeSubscriptions#update" do
    before do
      user.add_role(:level_2_member)
    end

    context "when there's a subscription for update" do
      before do
        post "/stripe_subscriptions", params: {
          amount: "12",
          stripe_token: stripe_helper.generate_card_token
        }
      end

      it "assigns the proper role with a new subscription" 


      it "updates the user's monthly_dues with the proper amount" 


      it "handles errors if MembershipService#update_subscription fails" 


      it "can't accept anything less than $1" 

    end
  end

  describe "DESTROY StripeSubscriptions#destroy" do
    before do
      user.add_role(:level_2_member)
      post "/stripe_subscriptions", params: {
        amount: "12",
        stripe_token: stripe_helper.generate_card_token
      }
    end

    context "when a valid request is made" do
      it "deletes membership" 


      it "returns user monthly dues to zero" 


      it "handles errors if MembershipService#unsubscribe_customer fails" 

    end
  end
end
# rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

