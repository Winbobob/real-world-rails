require "spec_helper"

module RSpec
  module Mocks
    RSpec.describe ErrorGenerator do
      context "when inserting a backtrace line" do
        def has_java_frames?
          yield
        rescue RSpec::Mocks::MockExpectationError => e
          e.backtrace.grep(/\.java:/).any?
        else
          raise "got no exception"
        end

        it "produces stacktraces that match how `raise` produces stacktraces (on JRuby `caller` and `raise` can differ about the presence of java frames)" 

      end

      def unexpected_failure_message_for(object_description)
        /received unexpected message :bees with \(#{object_description}\)/
      end

      describe "formatting arguments" do
        it 'formats time objects with increased precision' 


        context "on non-matcher objects that define #description" do
          it "does not use the object's description" 

        end

        context "on matcher objects" do
          context "that define description" do
            it "uses the object's description" 

          end

          context "that do not define description" do
            it "does not use the object's description" 

          end

          context "on default method stub" do
            it "error message display starts in new line" 

          end
        end
      end
    end
  end
end

