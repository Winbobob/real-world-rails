require "rails_helper"

RSpec.describe DeleteSubscriptions do
  describe ".call" do
    context "when event is for deleted Stripe subscription" do
      it "deletes all subscription records and deactivates their repos" 

    end

    context "when event is not for deleted Stripe subscription" do
      it "does not delete subscription" 

    end
  end
end

