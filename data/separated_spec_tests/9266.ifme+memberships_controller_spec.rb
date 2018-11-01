# frozen_string_literal: true

RSpec.describe Groups::MembershipsController, type: :controller do
  include StubCurrentUserHelper

  before do
    create_current_user
  end

  describe '#create' do
    context 'new group member for existing group' do
      let!(:leader_user) { create :user2 }
      let!(:group_leader) { create :group_member, user_id: leader_user.id, leader: true }
      let!(:group) { group_leader.group }

      it 'adds new member' 

    end

    context 'new group member for non-existent group' do
      it "doesn't new member" 

    end
  end

  describe '#kick' do
    context 'when current_user is a leader' do
      let!(:group_leader) { create :group_member, user_id: controller.current_user.id, leader: true }
      let!(:group) { group_leader.group }
      let!(:another_user) { create :user2 }
      let!(:another_member) { create :group_member, user_id: another_user.id, leader: false, group: group }

      it 'can kick another group member out' 

    end

    context 'when current_user is not a leader' do
      let!(:group_member) { create :group_member, user_id: controller.current_user.id, leader: false }
      let!(:group) { group_member.group }
      let!(:another_user) { create :user2 }
      let!(:another_member) { create :group_member, user_id: another_user.id, leader: false, group: group }

      it 'cannot kick another group member out' 

    end
  end

  describe '#leave' do
    context 'when current_user is not a leader' do
      let!(:leader_user) { create :user2 }
      let!(:leader_member) { create :group_member, user_id: leader_user.id, leader: true }
      let!(:another_member) { create :group_member, user_id: controller.current_user.id, leader: false }
      let!(:group) { another_member.group }

      it 'can leave group' 

    end

    context 'when current_user is a leader' do
      let!(:group_member) { create :group_member, user_id: controller.current_user.id, leader: true }

      it 'can leave the group when user is not the only leader' 


      it 'cannot leave the group when user is the only leader' 

    end
  end
end

