require 'rails_helper'

describe AnnouncementService do

  describe 'resend_pending_memberships' do
    let(:discussion) { create :discussion }
    let(:membership) { create :membership, accepted_at: nil, group: discussion.guest_group, created_at: (24.hours.ago - 30.minutes) }
    let(:event) {
      Events::AnnouncementCreated.publish!(
        discussion,
        discussion.author,
        Membership.where(id: membership.id),
        :new_discussion
      )
    }

    before { event.update created_at: (24.hours.ago.beginning_of_hour - 30.minutes) }

    it 'resends invitations after a specified period' 


    it 'can specify a time period' 


    it 'does not resend accepted invitations' 


    it 'does not resend invitations outside specified period' 

  end

  describe 'create' do
    let!(:group) { create :formal_group }
    let!(:discussion) { create :discussion, group: group }
    let!(:poll) { create :poll, discussion: discussion }
    let!(:user) { create :user }

    describe 'undecided_count' do
      before do
        poll.update_undecided_count
        group.add_admin! user
      end

      it 'updates poll undecided count when inviting to group' 


      it 'updates poll undecided count when inviting to discussion' 


      it 'updates poll undecided count when inviting to poll' 


      it 'updates poll undecided count when making an invitation' 


      it 'does not change the undecided count of a closed poll' 

    end
  end
end

