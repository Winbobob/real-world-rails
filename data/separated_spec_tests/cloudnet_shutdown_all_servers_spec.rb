require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe ShutdownAllServers do
  let(:user) { FactoryGirl.create(:user) }
  let!(:server1) {FactoryGirl.create(:server, user: user)} 
  let!(:server2) {FactoryGirl.create(:server, user: user)} 
  let(:scope) {ShutdownAllServers.new(user)}
  
  it "should initialize properly" 

  
  it "should send shutdown requests for all servers" 

  
  it "should call server shutdown task" 

  
  it "should handle errors" 

end

