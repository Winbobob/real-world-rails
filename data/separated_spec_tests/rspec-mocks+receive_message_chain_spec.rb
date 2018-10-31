module RSpec::Mocks::Matchers
  RSpec.describe "receive_message_chain" do
    let(:object) { double(:object) }

    context "with only the expect syntax enabled" do
      include_context "with syntax", :expect

      it "errors with a negative allowance" 


      it "errors with a negative expectation" 


      it "errors with a negative any_instance expectation" 


      it "errors with a negative any_instance allowance" 


      it "works with a do block" 


      it "works with a {} block" 


      it "gives the { } block prescedence over the do block" 


      it "works with and_return" 


      it "can constrain the return value by the argument to the last call" 


      it "works with and_call_original", :pending => "See https://github.com/rspec/rspec-mocks/pull/467#issuecomment-28631621" 


      it "fails with and_call_original when the entire chain is not called", :pending => "See https://github.com/rspec/rspec-mocks/pull/467#issuecomment-28631621" 


      it "works with and_raise" 


      it "works with and_throw" 


      it "works with and_yield" 


      it "works with a string of messages to chain" 


      it "works with a hash return as the last argument in the chain" 


      it "accepts any number of arguments to the stubbed messages" 


      it "accepts any number of arguments to the stubbed messages with an inline hash return value" 


      it "raises when expect is used and some of the messages in the chain aren't called" 


      it "raises when expect is used and all but the last message in the chain are called" 


      it "does not raise when expect is used and the entire chain is called" 


      it "works with allow_any_instance" 


      it "stubs already stubbed instances when using `allow_any_instance_of`" 


      it "fails when with expect_any_instance_of is used and the entire chain is not called" 


      it "affects previously stubbed instances when `expect_any_instance_of` is called" 


      it "passes when with expect_any_instance_of is used and the entire chain is called" 


      it "works with expect where the first level of the chain is already expected" 


      it "works with allow where the first level of the chain is already expected" 


      it "works with expect where the first level of the chain is already stubbed" 


      it "works with allow where the first level of the chain is already stubbed" 


      it "provides a matcher description (when passing a string)" 


      it "provides a matcher description (when passing symbols)" 


      it "provides a matcher description (when passing symbols and a hash)" 

    end

    context "when the expect and should syntaxes are enabled" do
      include_context "with syntax", [:expect, :should]

      it "stubs the message correctly" 

    end
  end
end

