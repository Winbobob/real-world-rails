module RSpec
  module Mocks
    RSpec.describe "a double _not_ acting as a null object" do
      before(:each) do
        @double = double('non-null object')
      end

      it "says it does not respond to messages it doesn't understand" 


      it "says it responds to messages it does understand" 


      it "raises an error when interpolated in a string as an integer" 

    end

    RSpec.describe "a double acting as a null object" do
      before(:each) do
        @double = double('null object').as_null_object
      end

      it "says it responds to everything" 


      it "allows explicit stubs" 


      it "allows explicit expectation" 


      it 'returns a string from `to_str`' 


      it 'continues to return self from an explicit expectation' 


      it 'returns an explicitly stubbed value from an expectation with no implementation' 


      it "fails verification when explicit exception not met" 


      it "ignores unexpected methods" 


      it 'allows unexpected message sends using `send`' 


      it 'allows unexpected message sends using `__send__`' 


      it "allows expected message with different args first" 


      it "allows expected message with different args second" 


      it "can be interpolated in a string as an integer" 


      it "does not allow null objects to be used outside of examples" 

    end

    RSpec.describe "#as_null_object" do
      it "sets the object to null_object" 

    end

    RSpec.describe "#null_object?" do
      it "defaults to false" 

    end

    RSpec.describe "when using the :expect syntax" do
      include_context "with syntax", :expect

      it 'still supports null object doubles' 

    end
  end
end

