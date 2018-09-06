require 'spec_helper'

describe AccessTokenValidationService do
  describe ".include_any_scope?" do
    let(:request) { double("request") }

    it "returns true if the required scope is present in the token's scopes" 


    it "returns true if more than one of the required scopes is present in the token's scopes" 


    it "returns true if the list of required scopes is an exact match for the token's scopes" 


    it "returns true if the list of required scopes contains all of the token's scopes, in addition to others" 


    it 'returns true if the list of required scopes is blank' 


    it "returns false if there are no scopes in common between the required scopes and the token scopes" 


    context "conditions" do
      it "ignores any scopes whose `if` condition returns false" 


      it "does not ignore scopes whose `if` condition is not set" 


      it "does not ignore scopes whose `if` condition returns true" 

    end
  end
end

