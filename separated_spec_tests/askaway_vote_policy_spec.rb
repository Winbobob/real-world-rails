require 'policy_helper'

describe VotePolicy do
  subject { VotePolicy }
  let(:user) { FactoryGirl.create(:user) }
  let(:different_user) { FactoryGirl.create(:user) }

  permissions :destroy? do
    it 'permits user to destroy their own comment' 


    it "does not permit user to destroy another user's comment" 

  end
end

