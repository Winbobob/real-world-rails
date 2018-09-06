require 'support/doubled_classes'

module RSpec
  module Mocks
    RSpec.describe 'Expected argument verification (when `#with` is called)' do
      # Note: these specs here aren't meant to be exhaustive. The specs in
      # rspec-support for the method signature verifier are. Here we are just
      # covering the code paths within the `with` implementation, including
      # the special handling for `any_args` and `no_args`.
      context "when doubling an unloaded class" do
        it 'allows any arguments' 

      end

      context "when doubling a loaded class" do
        let(:dbl) { instance_double(LoadedClass) }
        after { reset dbl }

        context "when `any_args` is used" do
          context "as the only argument" do
            it "is allowed regardless of how many args the method requires" 

          end

          context "as the first argument, with too many additional args" do
            it "is disallowed" 

          end

          context "as the first argument, with an allowed number of additional args" do
            it "is allowed" 

          end
        end

        context "when `no_args` is used" do
          it "allows a method expectation on a method that accepts no arguments" 


          it "allows a method expectation on a method that has defaults for all arguments" 


          it "does not allow a method expectation on a method that has required arguments" 


          if RSpec::Support::RubyFeatures.required_kw_args_supported?
            context "for a method with required keyword args" do
              it 'covers the required args when `any_args` is last' 


              it 'does not cover the required args when there are args after `any_args`' 

            end
          end
        end

        if RSpec::Support::RubyFeatures.required_kw_args_supported?
          it 'does not cover required args when `any_args` is not used' 

        end

        context "when a list of args is provided" do
          it "allows a method expectation when the arity matches" 


          it "does not allow a method expectation with an arity mismatch" 

        end

        context "when `with` is called with no args" do
          it "fails with an error suggesting the user use `no_args` instead" 

        end
      end
    end
  end
end

