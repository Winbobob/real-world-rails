module RSpec
  module Mocks
    RSpec.describe "an expectation set on nil" do
      it "issues a warning with file and line number information" 


      it "issues a warning when the expectation is negative" 


      it 'does not issue a warning when expectations are set to be allowed' 


      context 'configured to allow expectation on nil' do
        include_context 'with isolated configuration'

        it 'does not issue a warning when expectations are set to be allowed' 

      end

      context 'configured to disallow expectations on nil' do
        include_context 'with isolated configuration'

        it "raises an error when expectations on nil are disallowed" 

      end

      it 'does not call #nil? on a double extra times' 

    end

    RSpec.describe "#allow_message_expectations_on_nil" do
      include_context "with monkey-patched marshal"

      it "does not affect subsequent examples" 


      it 'doesnt error when marshalled' 

    end
  end
end

