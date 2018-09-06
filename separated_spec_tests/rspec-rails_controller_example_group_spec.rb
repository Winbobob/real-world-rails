require "spec_helper"

class ::ApplicationController
  def self.abstract?; false; end
end

module RSpec::Rails
  describe ControllerExampleGroup do
    it_behaves_like "an rspec-rails example group mixin", :controller,
      './spec/controllers/', '.\\spec\\controllers\\'

    def group_for(klass)
      RSpec::Core::ExampleGroup.describe klass do
        include ControllerExampleGroup
      end
    end

    let(:group) { group_for ApplicationController }

    it "includes routing matchers" 


    context "with implicit subject" do
      it "uses the controller as the subject" 


      it "doesn't cause let definition priority to be changed" 

    end

    context "with explicit subject" do
      it "uses the specified subject instead of the controller" 

    end

    describe "#controller" do
      let(:controller) { double('controller') }
      let(:example) { group.new }
      let(:routes) do
        routes = nil
        with_isolated_stderr do
          routes = ActionDispatch::Routing::RouteSet.new
          routes.draw { resources :foos }
        end
        routes
      end

      before do
        group.class_exec do
          controller(Class.new) { }
        end

        allow(controller).to receive(:foos_url).and_return('http://test.host/foos')
        allow(example).to receive_messages(:controller => controller)
        example.instance_variable_set(:@orig_routes, routes)
      end

      it "delegates named route helpers to the underlying controller" 


      if Rails.version.to_f >= 4.2
        it "calls NamedRouteCollection#route_defined? when it checks that given route is defined or not" 

      else
        it "calls NamedRouteCollection#helpers#include? when it checks that given route is defined or not" 

      end
    end

    describe "#bypass_rescue" do
      it "overrides the rescue_with_handler method on the controller to raise submitted error" 

    end

    describe "with inferred anonymous controller" do
      let(:anonymous_klass) { Class.new }
      let(:group) { group_for(anonymous_klass) }

      it "defaults to inferring anonymous controller class" 


      context "when infer_base_class_for_anonymous_controllers is true" do
        around(:example) do |ex|
          with_isolated_config do |config|
            config.infer_base_class_for_anonymous_controllers = true
            ex.run
          end
        end

        it "infers the anonymous controller class" 


        it "infers the anonymous controller class when no ApplicationController is present" 

      end

      context "when infer_base_class_for_anonymous_controllers is false" do
        around(:example) do |ex|
          with_isolated_config do |config|
            config.infer_base_class_for_anonymous_controllers = false
            ex.run
          end
        end

        it "sets the anonymous controller class to ApplicationController" 


        it "sets the anonymous controller class to ActiveController::Base when no ApplicationController is present" 

      end
    end

    describe "controller name" do
      let(:controller_class) { group.controller_class }

      it "sets the name as AnonymousController if it's anonymous" 


      it "sets the name according to defined controller if it is not anonymous" 


      it "sets name as AnonymousController if defined as ApplicationController" 


      it "sets name as AnonymousController if the controller is abstract" 


      it "sets name as AnonymousController if it inherits outer group's anonymous controller" 

    end

    context "in a namespace" do
      describe "controller name" do
        let(:controller_class) { group.controller_class }

        it "sets the name according to the defined controller namespace if it is not anonymous" 


        it "sets the name as 'AnonymousController' if the controller is abstract" 

      end

      pending "sets up resourceful routes on the example"
    end
  end
end

