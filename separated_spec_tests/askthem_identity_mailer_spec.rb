require "spec_helper"

describe IdentityMailer do
  let(:identity) { FactoryGirl.create(:identity) }

  before { ActionMailer::Base.deliveries.clear }

  it ".identity_submitted sends user e-mail" 


  it ".identity_needs_inspection sends staff member e-mail" 


  it ".identity_verified sends user e-mail" 


  it ".identity_rejected sends user e-mail" 

end

