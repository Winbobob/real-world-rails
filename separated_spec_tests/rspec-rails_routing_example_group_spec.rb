require "spec_helper"

module RSpec::Rails
  describe RoutingExampleGroup do
    it_behaves_like "an rspec-rails example group mixin", :routing,
      './spec/routing/', '.\\spec\\routing\\'

    describe "named routes" do
      it "delegates them to the route_set" 

    end
  end
end

