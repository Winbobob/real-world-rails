# frozen_string_literal: true

describe NotificationsHelper do
  let(:uniqueid) { 'uniqueid' }

  describe '#comment_link' do
    it 'returns correct link' 

  end

  describe '#accepted_ally_link' do
    it 'returns correct link' 

  end

  describe '#new_ally_request_link' do
    it 'returns correct link' 

  end

  describe '#group_link' do
    let(:data) do
      {
        type: type,
        user: 'Julia Nguyen',
        group: 'Group name',
        group_id: 1
      }
    end
    context 'type is new_group' do
      let(:type) { 'new_group' }
      it 'returns correct link' 

    end

    context 'type is new_group_member' do
      let(:type) { 'new_group_member' }
      it 'returns correct link' 

    end

    context 'type is add_group_leader' do
      let(:type) { 'add_group_leader' }
      it 'returns correct link' 

    end

    context 'type is remove_group_leader' do
      let(:type) { 'remove_group_leader' }
      it 'returns correct link' 

    end
  end

  describe '#meeting_link' do
    let(:data) do
      {
        type: type,
        user: 'Julia Nguyen',
        group: 'Group name',
        typename: 'Meeting name',
        group_id: 1,
        typeid: 1
      }
    end
    context 'type is new_meeting' do
      let(:type) { 'new_meeting' }
      it 'returns correct link' 

    end

    context 'type is remove_meeting' do
      let(:type) { 'remove_meeting' }
      it 'returns correct link' 

    end

    context 'type is update_meeting' do
      let(:type) { 'update_meeting' }
      it 'returns correct link' 

    end

    context 'type is join_meeting' do
      let(:type) { 'join_meeting' }
      it 'returns correct link' 

    end
  end
end

