require "rails_helper"

describe RepoSerializer do
  describe "#admin" do
    context "when current user is an admin of the repo" do
      it "returns true" 

    end

    context "when current user is not an admin of the repo" do
      it "returns false" 

    end

    context "when the current user is not a member of the repo" do
      context "and does not have a subscription for the repo" do
        it "returns false" 

      end

      context "and has a subscription for the repo" do
        it "returns true" 

      end
    end
  end

  describe "#price_in_cents" do
    it "returns zero" 


    context "when the repo is private" do
      context "and the repo was activated" do
        it "returns subscription price in cents" 

      end
    end
  end
end

