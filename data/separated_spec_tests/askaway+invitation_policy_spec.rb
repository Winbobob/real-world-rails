require 'policy_helper'

describe InvitationPolicy do
  subject { InvitationPolicy }
  let(:party) { FactoryGirl.create(:party) }
  let(:rep) { FactoryGirl.create(:rep, party: party) }
  let(:site_admin) { FactoryGirl.create(:user, is_admin: true) }
  let(:user) { FactoryGirl.create(:user) }
  let(:invitation) { FactoryGirl.create(:invitation, invitable: party) }

  permissions :destroy? do
    it 'permits site admin to destroy invitation' 


    it "permits party rep to destroy invitation to party" 


    it 'does not permit user to destroy invitation' 

  end
end

