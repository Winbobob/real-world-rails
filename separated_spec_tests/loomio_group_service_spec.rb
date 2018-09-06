require 'rails_helper'

describe 'GroupService' do
  let(:user) { create(:user) }
  let(:group) { build(:formal_group) }
  let(:guest_group) { build(:guest_group) }
  let(:parent) { create(:formal_group, default_group_cover: create(:default_group_cover))}
  let(:subgroup) { build(:formal_group, parent: parent) }

  describe 'create' do
    it 'creates a new group' 


    it 'assigns a default group cover' 


    it 'does not assign a default group cover if the group is a subgroup' 


    it 'does not assign a default group cover if none have been defined' 


    it 'does not send excessive emails' 



    context "is_referral" do
      it "is false for first group" 


      it "is true for second group" 

    end
  end

  describe' move' do
    let(:group) { create :formal_group, subscription_id: 100 }
    let(:parent) { create :formal_group }
    let(:admin) { create :user, is_admin: true }
    let(:user) { create :user }

    it 'moves a group to a parent as an admin' 


    it 'does not allow nonadmins to move groups' 

  end

  describe 'merge' do
    let!(:source) { create :formal_group }
    let!(:target) { create :formal_group }
    let!(:user) { create :user, is_admin: true }
    let!(:shared_user) { create :user }
    let!(:source_user) { create :user }
    let!(:target_user) { create :user }
    let!(:source_subgroup) { create :formal_group, parent: source }
    let!(:source_discussion) { create :discussion, group: source }
    let!(:source_comment) { create :comment, discussion: source_discussion }
    let!(:source_poll) { create :poll, group: source }
    let!(:source_stance) { create :stance, poll: source_poll }
    let!(:source_identity) { create :group_identity, group: source }
    let!(:source_request) { create :membership_request, group: source }

    before do
      source.add_member! source_user
      target.add_member! target_user
      source.add_member! shared_user
      target.add_member! shared_user
    end

    it 'can merge two groups' 


    it 'does not allow non-admins to merge' 

  end
end

