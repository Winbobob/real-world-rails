require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe ShutdownActionEmailToUser do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {ShutdownActionEmailToUser.new(user)}
  
  it "should initialize properly" 

  
  it "should send shutdown action email to user" 

end

