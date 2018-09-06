require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe DestroyActionEmailToAdmin do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {DestroyActionEmailToAdmin.new(user)}
  
  it "should initialize properly" 

  
  it "should send shutdown action email to admin" 

end

