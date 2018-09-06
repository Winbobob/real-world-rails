require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe DestroyActionEmailToUser do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {DestroyActionEmailToUser.new(user)}
  
  it "should initialize properly" 

  
  it "should send shutdown action email to user" 

end

