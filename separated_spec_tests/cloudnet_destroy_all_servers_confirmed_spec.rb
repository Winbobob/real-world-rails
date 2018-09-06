require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::Actions

describe DestroyAllServersConfirmed do
  let(:user) { FactoryGirl.create(:user) }
  let!(:server1) {FactoryGirl.create(:server, user: user)} 
  let!(:server2) {FactoryGirl.create(:server, user: user)} 
  let(:scope) {DestroyAllServersConfirmed.new(user)}
  
  it "should initialize properly" 

  
  it "should send destroy requests for all servers" 

  
  it "should call server shutdown task" 

  
  it "should handle errors" 

  
  it "should label user at Sift science" 

end

