require "rails_helper"

describe SubscriptionsController, "#create" do
  context "when subscription succeeds" do
    it "subscribes the user to the repo" 


    it "updates the current user's email address" 

  end

  context "when subscription fails" do
    it "deactivates repo" 

  end

  context "when the current plan is full" do
    it "notifies that payment is required" 

  end

  describe "#update" do
    context "when the subscription cannot be created" do
      it "returns 'Bad Gateway'" 

    end
  end
end

describe SubscriptionsController, "#destroy" do
  context "when there is no subscription" do
    it "returns 409 conflict" 

  end

  context "when there is a subscription" do
    it "deletes subscription associated with subscribing user" 

  end
end

