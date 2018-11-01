require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe ShutdownActionEmailToAdmin do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {ShutdownActionEmailToAdmin.new(user)}
  
  it "should initialize properly" 

  
  it "should send shutdown action email to admin" 

end

