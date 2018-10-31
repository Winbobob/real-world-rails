require 'support/doubled_classes'

module RSpec
  module Mocks
    RSpec.describe 'A class double with the doubled class loaded' do
      include_context "with isolated configuration"

      before do
        RSpec::Mocks.configuration.verify_doubled_constant_names = true
      end

      it 'only allows class methods that exist to be stubbed' 


      it 'only allows class methods that exist to be expected' 


      USE_INSTANCE_DOUBLE_MSG = "Perhaps you meant to use `instance_double`"

      it "suggests using `instance_double` when an instance method is stubbed" 


      it "doesn't suggest `instance_double` when a non-instance method is stubbed'" 


      it 'gives a descriptive error message for NoMethodError' 


      it 'checks that stubbed methods are invoked with the correct arity' 


      it 'allows dynamically defined class method stubs with arguments' 


      it 'allows dynamically defined class method mocks with arguments' 


      it 'allows dynamically defined class methods to be expected' 


      it 'allows class to be specified by constant' 


      it 'can replace existing constants for the duration of the test' 


      it 'can transfer nested constants to the double' 


      it 'correctly verifies expectations when constant is removed' 


      it 'only allows defined methods for null objects' 


      it 'verifies arguments for null objects' 


      it 'validates `with` args against the method signature when stubbing a method' 


      context "when `.new` is stubbed" do
        before do
          expect(LoadedClass.instance_method(:initialize).arity).to eq(2)
        end

        it 'uses the method signature from `#initialize` for arg verification' 


        context "on a class that has redefined `new`" do
          it "uses the method signature of the redefined `new` for arg verification" 

        end

        context "on a class that has undefined `new`" do
          it "prevents it from being stubbed" 

        end

        context "on a class with a private `new`" do
          it 'uses the method signature from `#initialize` for arg verification' 

        end
      end

      context "when given an anonymous class" do
        it 'properly verifies' 

      end

      context "when given a class that has an overridden `#name` method" do
        it "properly verifies" 


        it "can still stub the const" 


        def check_verification(o)
          allow(o).to receive(:defined_class_method)
          prevents { allow(o).to receive(:undefined_method) }
        end
      end

      context "when the class const has been previously stubbed" do
        before { stub_const("LoadedClass", Class.new) }

        it "uses the original class to verify against for `class_double('ClassName')`" 


        it "uses the original class to verify against for `instance_double(ClassName)`" 

      end
    end
  end
end

