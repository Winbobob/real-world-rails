module RSpec
  module Mocks
    RSpec.describe TestDouble do
      describe "#freeze" do
        subject { double }

        it "gives a warning" 


        it "gives the correct call site for the warning" 


        it "doesn't freeze the object" 


        it "returns the instance of the test double" 

      end

      RSpec.shared_examples_for "a copy method" do |method|
        it "copies the `as_null_object` state when #{method}'d" 

      end

      include_examples "a copy method", :dup
      include_examples "a copy method", :clone

      [[:should, :expect], [:expect], [:should]].each do |syntax|
        context "with syntax #{syntax.inspect}" do
          include_context "with syntax", syntax

          it 'stubs the methods passed in the stubs hash' 

        end
      end
    end
  end
end

