require "spec_helper"

describe "route_to" do
  include RSpec::Rails::Matchers::RoutingMatchers
  include RSpec::Rails::Matchers::RoutingMatchers::RouteHelpers

  def assert_recognizes(*)
    # no-op
  end

  it "provides a description" 


  it "delegates to assert_recognizes" 


  context "with shortcut syntax" do
    it "routes with extra options" 


    it "routes without extra options" 


    it "routes with one query parameter" 


    it "routes with multiple query parameters" 


    it "routes with nested query parameters" 


  end

  context "with should" do
    context "when assert_recognizes passes" do
      it "passes" 

    end

    context "when assert_recognizes fails with an assertion failure" do
      it "fails with message from assert_recognizes" 

    end

    context "when assert_recognizes fails with a routing error" do
      it "fails with message from assert_recognizes" 

    end

    context "when an exception is raised" do
      it "raises that exception" 

    end
  end

  context "with should_not" do
    context "when assert_recognizes passes" do
      it "fails with custom message" 

    end

    context "when assert_recognizes fails with an assertion failure" do
      it "passes" 

    end

    context "when assert_recognizes fails with a routing error" do
      it "passes" 

    end

    context "when an exception is raised" do
      it "raises that exception" 

    end
  end

  it "uses failure message from assert_recognizes" 

end

