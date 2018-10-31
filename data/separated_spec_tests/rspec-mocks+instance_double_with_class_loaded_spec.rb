require 'support/doubled_classes'

module RSpec
  module Mocks
    RSpec.describe 'An instance double with the doubled class loaded' do
      include_context "with isolated configuration"

      before do
        RSpec::Mocks.configuration.verify_doubled_constant_names = true
      end

      it 'only allows instance methods that exist to be stubbed' 


      it 'only allows instance methods that exist to be expected' 


      USE_CLASS_DOUBLE_MSG = "Perhaps you meant to use `class_double`"

      it "suggests using `class_double` when a class method is stubbed" 


      it "doesn't suggest `class_double` when a non-class method is stubbed" 


      it 'allows `send` to be stubbed if it is defined on the class' 


      it 'gives a descriptive error message for NoMethodError' 


      it 'does not allow dynamic methods to be expected' 


      it 'checks the arity of stubbed methods' 


      it 'checks that stubbed methods are invoked with the correct arity' 


      if required_kw_args_supported?
        it 'allows keyword arguments' 


        context 'for a method that only accepts keyword args' do
          it 'allows hash matchers like `hash_including` to be used in place of the keywords arg hash' 


          it 'allows anything matcher to be used in place of the keywords arg hash' 


          it 'still checks positional arguments when matchers used for keyword args' 


          it 'does not allow matchers to be used in an actual method call' 

        end

        context 'for a method that accepts a mix of optional keyword and positional args' do
          it 'allows hash matchers like `hash_including` to be used in place of the keywords arg hash' 

        end

        it 'checks that stubbed methods with required keyword args are ' \
           'invoked with the required arguments' do
          o = instance_double('LoadedClass', :kw_args_method => true)
          expect {
            o.kw_args_method(:optional_arg => 'something')
          }.to raise_error(ArgumentError)
        end
      end

      it 'validates `with` args against the method signature when stubbing a method' 


      it 'allows class to be specified by constant' 


      context "when the class const has been previously stubbed" do
        before { class_double(LoadedClass).as_stubbed_const }

        it "uses the original class to verify against for `instance_double('LoadedClass')`" 


        it "uses the original class to verify against for `instance_double(LoadedClass)`" 

      end

      context "when given a class that has an overridden `#name` method" do
        it "properly verifies" 

      end

      context 'for null objects' do
        let(:obj) { instance_double('LoadedClass').as_null_object }

        it 'only allows defined methods' 


        it 'verifies arguments' 


        it "includes the double's name in a private method error" 


        it 'reports what public messages it responds to accurately' 


        it 'reports that it responds to defined private methods when the appropriate arg is passed' 


        if RUBY_VERSION.to_f < 2.0 # respond_to?(:protected_method) changed behavior in Ruby 2.0.
          it 'reports that it responds to protected methods' 

        else
          it 'reports that it responds to protected methods when the appropriate arg is passed' 

        end
      end
    end
  end
end

