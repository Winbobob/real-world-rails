require 'rails_helper'
include NegativeBalanceProtection::ActionStrategies

describe BaseStrategy do
  let(:user) { FactoryGirl.create(:user) }
  let!(:server) {FactoryGirl.create(:server, user: user)}
  let(:strategy) {BaseStrategy}
  
  before(:each) do
    allow_any_instance_of(Account).
        to receive(:remaining_balance).and_return(200_000)
  end
  
  it "should initialize correctly" 

  
  it "should set no actions array" 

  
  it "should check for no servers" 

  
  it "should check for positive balance" 

  
  it "should return actions for no servers" 

  
  context "#shutdown_less_emails_sent_than_defined_in_user_profile?" do
    it "should be true when delivered less notifications than in profile" 

    
    it "should be false when delivered more notifications than in profile" 

  end
  
  context "#minimum_time_passed_since_last_warning_email?" do
    it "should be true if no notification sent" 

    
    it "should be false if last notification sent in less then specified hours" 

    
    it "should be true if last notification sent in more then specified hours" 

  end
  
  context "#emails_sent_as_in_profile_for_shutdown?" do
    it "it should be false when delivered less notifications than in profile" 

    
    it "it should be false when delivered more notifications than in profile" 

    
    it "it should be true when delivered notifications as in profile" 

  end
  
  context "#shutdown_more_emails_sent_than_defined_in_user_profile?" do
    it "it should be false when delivered less notifications than in profile" 

    
    it "it should be false when delivered notifications as in profile" 

    
    it "it should be true when delivered more notifications than in profile" 

  end
  
  context "#destroy_less_emails_sent_than_defined_in_user_profile?" do
    it "should be true when delivered less notifications than in profile" 

    
    it "should be false when delivered more notifications than in profile" 

  end
  
  context "#emails_sent_as_in_profile_for_destroy_or_more?" do
    it "it should be false when delivered less notifications than in profile" 

    
    it "it should be true when delivered more notifications than in profile" 

    
    it "it should be true when delivered notifications as in profile" 

  end
end

