require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::RouteParams, type: :controller do
  describe "#normalize" do
    context "when the route parameters is a hash" do
      it "stringifies the values in the hash" 

    end

    context "when the route parameters is a string and a hash" do
      it "produces a hash of route parameters" 

    end

    context "when the route params is a string" do
      it "produces a hash of route params" 

    end
  end

  def build_route_params(*params)
    Shoulda::Matchers::ActionController::RouteParams.new(params)
  end
end

