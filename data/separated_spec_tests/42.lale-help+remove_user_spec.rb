require 'rails_helper'

describe "WorkingGroup::RemoveUser" do

  let!(:working_group) { create(:working_group) }
  let!(:circle)        { working_group.circle }
  # admin 1 is only admin
  let!(:admin_1)       { create(:working_group_admin_role, working_group: working_group).user }
  # admin 2 is admin and member
  let!(:admin_2)       { create(:working_group_admin_role, working_group: working_group).user }
  let!(:admin_2_membership) { create(:working_group_member_role, working_group: working_group, user: admin_2) }
  # member is only members
  let!(:member)        { create(:working_group_member_role, working_group: working_group).user }

  matcher :have_member do |expected|
    match { |working_group| working_group.members.exists?(id: expected.id) }
  end

  matcher :have_admin do |expected|
    match { |working_group| working_group.admins.exists?(id: expected.id) }
  end

  context "Test setup" do
    it "is what is expected" 

  end 

  context "Removing an admin role" do
    
    context "when group has more than one admin" do
      it "removes the admin role" 


      it "keeps the member role" 

    end

    context "when group has only one admin" do
      before { admin_1.destroy }
      it "doesn't remove the admin role" 

    end

    context "admin has other group memberships" do
      # add a "control" working group for verifying that only the correct adminships are removed
      let!(:other_wg) { create(:working_group, circle: circle, admin: admin_2) }

      it "removes only the right admin role" 

    end

  end

  context 'Removing a member role' do

    context "when user is only member" do
      it "removes the member role" 

    end
    context "when user is admin as well" do
      it "removes both roles" 

    end

    context "when user is only member" do

      context "member has other group memberships" do
        # add a "control" working group for verifying that only the correct memberships are removed
        let!(:other_wg) { create(:working_group, circle: circle, member: member) }

        it "removes only the right member role" 

      end

    end

  end

end

