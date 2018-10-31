# frozen_string_literal: true

describe MeetingNotificationsService do
  let(:user) { create :user2, :with_allies }
  let(:ally) { user.allies.first }

  context '#handle_members' do
    subject { described_class.handle_members(params) }
    let!(:group) { create :group }
    let!(:meeting) { create :meeting, group_id: group.id }
    let!(:member1) { create :meeting_member, user_id: user.id, leader: true, meeting_id: meeting.id }
    let!(:member2) { create :meeting_member, user_id: ally.id, leader: false, meeting_id: meeting.id }
    let!(:members) { meeting.members }
    let!(:uniqueid) { "#{type}_#{user.id}" }
    let!(:params) do
      {
        current_user: user,
        meeting: meeting,
        type: type,
        members: members
      }
    end

    context 'when type is remove_meeting' do
      let!(:type) { 'remove_meeting' }

      it 'create the correct notification' 

    end

    context 'when type is new_meeting' do
      let!(:type) { 'new_meeting' }

      it 'create the correct notification' 

    end

    context 'when type is update_meeting' do
      let!(:type) { 'update_meeting' }

      it 'create the correct notification' 

    end

    context 'when type is invalid' do
      let!(:type) { 'fake_type' }

      it 'raises the correct error' 

    end
  end
end

