require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe ShutdownWarningEmailToUser do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {ShutdownWarningEmailToUser.new(user)}
  
  it "should initialize properly" 

  
  it "should send shutdown warning email to user" 

end

