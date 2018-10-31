require "rails_helper"

RSpec.describe PlanPresenter do
  describe "#allowance" do
    it "returns the plan's allowance" 

  end

  describe "#current?" do
    context "when the plan matches the user's current plan" do
      it "returns true" 

    end

    context "when the plan does not match the user's current plan" do
      it "returns false" 

    end
  end

  describe "#next?" do
    context "when the plan matches the user's next plan" do
      it "returns true" 

    end

    context "when the plan does not match the user's next plan" do
      it "returns false" 

    end
  end

  describe "#open_source?" do
    it "returns the plan's open source state" 

  end

  describe "#price" do
    it "returns the plan's price" 

  end

  describe "#to_partial_path" do
    context "when the plan is for open source repos" do
      it "returns 'plans/open_source'" 

    end

    context "when the plan is for private repos" do
      it "returns 'plans/private'" 

    end
  end

  describe "#title" do
    it "returns the plan's title" 

  end
end

