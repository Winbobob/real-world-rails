require "spec_helper"

describe "be_routable" do
  include RSpec::Rails::Matchers::RoutingMatchers
  attr_reader :routes

  before { @routes = double("routes") }

  it "provides a description" 


  context "with should" do
    it "passes if routes recognize the path" 


    it "fails if routes do not recognize the path" 

  end

  context "with should_not" do

    it "passes if routes do not recognize the path" 


    it "fails if routes recognize the path" 

  end
end

