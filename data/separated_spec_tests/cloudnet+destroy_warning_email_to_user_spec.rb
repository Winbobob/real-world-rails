require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe DestroyWarningEmailToUser do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {DestroyWarningEmailToUser.new(user)}
  
  it "should initialize properly" 

  
  it "should send destroy warning email to user" 

end

