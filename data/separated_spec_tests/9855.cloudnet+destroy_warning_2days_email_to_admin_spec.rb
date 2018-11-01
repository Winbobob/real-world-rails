require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe DestroyWarning2daysEmailToAdmin do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {DestroyWarning2daysEmailToAdmin.new(user)}
  
  it "should initialize properly" 

  
  it "should not send email if more than 2 days for destroy" 

  
  it "should send destroy warning email to user" 

end

