module RSpec
  module Mocks
    RSpec.describe "A chained method stub" do
      let(:object) { Object.new }

      it 'does not get confused by symbol vs string usage for the messages' 


      context "with one method in chain" do
        context "using and_return" do
          it "returns expected value from chaining only one method call" 

        end

        context "using a block" do
          it "returns the correct value" 

        end

        context "using a hash" do
          it "returns the value of the key/value pair" 

        end
      end

      context "with two methods in chain" do
        it "accepts any number of arguments to the stubbed messages in the chain" 


        context "using and_return" do
          it "returns expected value from chaining two method calls" 

        end

        context "using a block" do
          it "returns the correct value" 

        end

        context "using a hash" do
          it "returns the value of the key/value pair" 

        end
      end

      context "with four methods in chain" do
        context "using and_return" do
          it "returns expected value from chaining two method calls" 

        end

        context "using a block" do
          it "returns the correct value" 

        end

        context "using a hash" do
          it "returns the value of the key/value pair" 

        end

        context "using a hash with a string key" do
          it "returns the value of the key/value pair" 

        end
      end

      it "returns expected value from chaining four method calls" 


      context "with messages shared across multiple chains" do
        context "using and_return" do
          context "starting with the same message" do
            it "returns expected value" 

          end

          context "starting with the different messages" do
            it "returns expected value" 

          end
        end

        context "using => value" do
          context "starting with the same message" do
            it "returns expected value" 

          end

          context "starting with different messages" do
            it "returns expected value" 

          end
        end
      end

      it "returns expected value when chain is a dot separated string, like stub_chain('msg1.msg2.msg3')" 


      it "returns expected value from two chains with shared messages at the beginning" 


      it "handles private instance methods (like Object#select) in the middle of a chain" 

    end
  end
end

