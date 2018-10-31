require 'support/doubled_classes'

module RSpec
  module Mocks
    RSpec.describe 'An object double' do
      let(:loaded_instance) { LoadedClass.new(1, 2) }

      it 'can replace an unloaded constant' 


      it 'can replace a constant by name and verify instance methods' 


      it 'can create a double that matches the interface of any arbitrary object' 


      it 'does not allow transferring constants to an object' 


      it 'does not allow as_stubbed_constant for real objects' 


      it 'is not a module' 


      it 'validates `with` args against the method signature when stubbing a method' 


      context "when a loaded object constant has previously been stubbed with an object" do
        before { stub_const("LoadedClass::INSTANCE", Object.new) }

        it "uses the original object to verify against for `object_double('ConstName')`" 


        it "uses the stubbed const value to verify against for `object_double(ConstName)`, " \
           "which probably isn't what the user wants, but there's nothing else we can do since " \
           "we can't get the constant name from the given object and thus cannot interrogate " \
           "our stubbed const registry to see it has been stubbed" do
          o = object_double(LoadedClass::INSTANCE)
          prevents { allow(o).to receive(:defined_instance_method) }
        end
      end

      context "when a loaded object constant has previously been stubbed with a class" do
        before { stub_const("LoadedClass::INSTANCE", Class.new) }

        it "uses the original object to verify against for `object_double('ConstName')`" 


        it "uses the original object to verify against for `object_double(ConstName)`" 

      end

      context "when an unloaded object constant has previously been stubbed with an object" do
        before { stub_const("LoadedClass::NOINSTANCE", LoadedClass::INSTANCE) }

        it "treats it as being unloaded for `object_double('ConstName')`" 


        it "uses the stubbed const value to verify against for `object_double(ConstName)`, " \
           "which probably isn't what the user wants, but there's nothing else we can do since " \
           "we can't get the constant name from the given object and thus cannot interrogate " \
           "our stubbed const registry to see it has been stubbed" do
          o = object_double(LoadedClass::NOINSTANCE)
          allow(o).to receive(:defined_instance_method)
          prevents { allow(o).to receive(:undefined_method) }
        end
      end

      context "when an unloaded object constant has previously been stubbed with a class" do
        before { stub_const("LoadedClass::NOINSTANCE", Class.new) }

        it "treats it as being unloaded for `object_double('ConstName')`" 


        it "treats it as being unloaded for `object_double(ConstName)`" 

      end
    end
  end
end

