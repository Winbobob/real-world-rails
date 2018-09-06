module RSpec
  module Mocks
    RSpec.describe "ordering" do
      before { @double = double("test double") }
      after  { reset @double }

      it "passes when messages are received in order" 


      it "passes when messages are received in order" 


      it "passes when messages are received in order across objects" 


      it "fails when messages are received out of order (2nd message 1st)" 


      it "fails when messages are received out of order (3rd message 1st)" 


      it "fails when messages are received out of order (3rd message 2nd)" 


      it "fails when messages are out of order across objects" 


      it "ignores order of non ordered messages" 


      it "supports duplicate messages" 

    end
  end
end

