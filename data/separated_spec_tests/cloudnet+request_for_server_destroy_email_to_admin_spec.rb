require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe RequestForServerDestroyEmailToAdmin do
  let(:user) { FactoryGirl.create(:user) }
  let(:scope) {RequestForServerDestroyEmailToAdmin.new(user)}
  let(:r_not_sent) {RequestForServerDestroyEmailToAdmin::REQUEST_NOT_SENT}
  let(:r_sent) {RequestForServerDestroyEmailToAdmin::REQUEST_SENT_NOT_CONFIRMED}
  
  it "should initialize properly" 

  
  it "should have constants defined" 

  
  it "should send request for destroy email to admin" 

  
  it "should set sent_email attribute in user" 

end

