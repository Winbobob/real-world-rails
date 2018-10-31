require 'spec_helper'

describe OrderCyclesHelper, type: :helper do
  let(:oc) { double(:order_cycle) }

  describe "finding producer enterprise options" do
    before do
      helper.stub(:permitted_producer_enterprises_for) { "enterprise list" }
    end

    it "asks for a validation option list" 

  end

  describe "finding coodinator enterprise options" do
    before do
      helper.stub(:permitted_coordinating_enterprises_for) { "enterprise list" }
    end

    it "asks for a validation option list" 

  end

  describe "finding hub enterprise options" do
    before do
      helper.stub(:permitted_hub_enterprises_for) { "enterprise list" }
    end

    it "asks for a validation option list" 

  end

  describe "building a validated enterprise list" do
    let(:e) { create(:distributor_enterprise, name: 'enterprise') }

    it "returns enterprises without shipping methods as disabled" 


    it "returns enterprises without payment methods as disabled" 


    it "returns enterprises with unavailable payment methods as disabled" 


    it "returns enterprises with neither shipping nor payment methods as disabled" 

  end

  describe "pickup time" do
    it "gives me the pickup time for the current order cycle" 


    it "gives me the pickup time for any order cycle" 

  end
end

