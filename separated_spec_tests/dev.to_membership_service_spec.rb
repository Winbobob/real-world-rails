require "rails_helper"

RSpec.describe MembershipService do
  let(:user_one)            { create(:user, :super_admin) }
  let(:user_two)            { create(:user, :super_admin) }
  let(:stripe_helper)       { StripeMock.create_test_helper }
  let(:stripe_source_token) { stripe_helper.generate_card_token }

  before { StripeMock.start }

  after { StripeMock.stop }

  def valid_instance(user = user_one, amount = 1200)
    customer = Stripe::Customer.create(
      email: "stripe_tester@dev.to",
      source: stripe_helper.generate_card_token,
    )
    user.update(stripe_id_code: customer.id)
    described_class.new(Stripe::Customer.retrieve(user.stripe_id_code), user, amount)
  end

  describe "#find_or_create_plan" do
    it "creates a new plan if there is no previous plan" 


    # it "uses an existing plan if the amount has been previously used" do
    #   plan = stripe_helper.create_plan(id: "membership-1200", amount: 1200)
    #   expect(valid_instance.plan).to eq(plan)
    # end
  end

  describe "#initialize" do
    context "when evoked on a user that already has subscription" do
      # rubocop:disable RSpec/ExampleLength
      it "returns an object with subscription" 

      # rubocop:enable RSpec/ExampleLength
    end
  end

  describe "#assign_membership_role" do
    context "when amount is 25 dollars" do
      it "adds level_3_member role" 

    end

    context "when amount is 10 dollars" do
      it "adds level_2_member role" 

    end

    context "when amount is 1 dollar" do
      it "adds level_1_member role" 

    end
  end

  describe "#find_subscription" do
    it "returns user's subscription" 


    it "returns nil if there's no subscription" 

  end

  describe "#create_subscription" do
    it "creates a subscription for a user" 

  end
end

