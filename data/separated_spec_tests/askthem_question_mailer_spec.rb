require "spec_helper"

describe QuestionMailer do
  it "sends question posted e-mail" 


  context "if queston needs_confirmation" do
    it "sends question posted e-mail w/ please confirm message" 

  end

  it "sends signed on to question e-mail" 


  it "sends author question answered e-mail" 


  it "sends signer question answered e-mail" 


  it "sends email to person that signature threshold is met" 


  it "sends email to staff members that question threshold has been met" 


  it "sends email to staff members that question has been answered" 


  context "when email_is_disabled is true" do
    it "does not send question posted e-mail" 


    it "does not send signed on to question e-mail" 


    it "does not send author question answered e-mail" 


    it "does not send signer question answered e-mail" 

  end
end

