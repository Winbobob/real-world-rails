module RSpec
  module Mocks
    RSpec.describe ".allow_message" do
      let(:subject) { Object.new }

      it "sets up basic message allowance" 


      it "sets up message allowance with params and return value" 


      it "supports block implementations" 


      it "does not set an expectation that the message will be received" 


      it 'does not get confused when the string and symbol message form are both used' 

    end

    RSpec.describe ".expect_message" do
      let(:subject) { Object.new }

      it "sets up basic message expectation, verifies as uncalled" 


      it "fails if never is specified and the message is called" 


      it "sets up basic message expectation, verifies as called" 


      it "sets up message expectation with params and return value" 


      it "accepts a block implementation for the expected message" 


      it 'does not get confused when the string and symbol message form are both used' 

    end
  end
end

