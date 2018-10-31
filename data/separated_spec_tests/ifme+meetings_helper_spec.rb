# frozen_string_literal: true

describe MeetingsHelper do
  let(:meeting) { create(:meeting) }
  let(:current_user) { create(:meeting_member, meeting: meeting).user }

  describe '#get_meeting_members' do
    it 'displays not attending with a link to join' 


    it 'displays attending with a link to leave' 


    it 'displays there is one spot to join with a link' 


    it 'displays there are spots to join with a link' 


    it 'displays there is no room to join ' 

  end
end

