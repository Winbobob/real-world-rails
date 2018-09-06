module RSpec
  module Mocks
    RSpec.describe "stub implementation" do
      describe "with no args" do
        it "execs the block when called" 

      end

      describe "with one arg" do
        it "execs the block with that arg when called" 

      end

      describe "with variable args" do
        it "execs the block when called" 

      end
    end

    RSpec.describe "unstubbing with `and_call_original`" do
      it "replaces the stubbed method with the original method" 


      it "removes all stubs with the supplied method name" 


      it "does not remove any expectations with the same method name" 


      shared_examples_for "stubbing `new` on class objects" do
        it "restores the correct implementations when stubbed and unstubbed on a parent and child class" 


        it "restores the correct implementations when stubbed and unstubbed on a grandparent and grandchild class" 

      end

      context "when partial doubles are not verified" do
        before { expect(RSpec::Mocks.configuration.verify_partial_doubles?).to be false }
        include_examples "stubbing `new` on class objects"
      end

      context "when partial doubles are verified" do
        include_context "with isolated configuration"
        before { RSpec::Mocks.configuration.verify_partial_doubles = true }
        include_examples "stubbing `new` on class objects"
      end
    end
  end
end

