require 'rails_helper'

feature 'Speaker Invitations' do
  let(:second_speaker_email) { 'second_speaker@example.com' }
  let(:user) { create(:person) }
  let(:event) { create(:event, state: 'open') }
  let(:proposal) { create(:proposal,
                          title: 'Hello there',
                          abstract: 'Well then.',
                          event: event)
  }
  let!(:speaker) { create(:speaker,
                         person: user,
                         proposal: proposal)
  }

  let(:go_to_proposal) {
    login_user(user)
    visit(proposal_path(slug: proposal.event.slug, uuid: proposal))
  }

  context "Creating an invitation" do
    before :each do
      go_to_proposal
      fill_in 'email', with: second_speaker_email
    end

    scenario "A speaker can invite another speaker" do
      click_button 'Invite'
      expect(page).
        to(have_text(second_speaker_email))
    end

    it "emails the pending speaker" 


    scenario "A speaker can re-invite the same speaker" do
      click_button 'Invite'
      fill_in 'email', with: second_speaker_email
      click_button 'Invite'
      expect(page).
        to(have_text(second_speaker_email))
    end
  end

  context "Removing an invitation" do
    let!(:invitation) { create(:invitation, proposal: proposal, email: second_speaker_email) }

    scenario "A speaker can remove an invitation" do
      go_to_proposal
      click_link 'Remove'
      expect(proposal.reload.invitations).not_to include(invitation)
    end
  end

  context "Resending an invitation" do
    let!(:invitation) { create(:invitation, proposal: proposal, email: second_speaker_email) }
    after { ActionMailer::Base.deliveries.clear }

    scenario "A speaker can resend an invitation" do
      go_to_proposal
      click_link 'Resend'
      expect(ActionMailer::Base.deliveries.last.to).to include(second_speaker_email)
    end
  end

  context "Responding to an invitaiton" do
    let(:second_speaker) { create(:person, email: second_speaker_email) }
    let!(:invitation) { create(:invitation,
                               proposal: proposal,
                               email: second_speaker_email,
                               person: second_speaker)
    }
    let(:other_proposal) { create(:proposal, event: event) }
    let!(:other_invitation) { create(:invitation,
                                     proposal: other_proposal,
                                     email: second_speaker_email)
    }

    before :each do
      login_user(second_speaker)
      visit invitation_url(invitation, invitation_slug: invitation.slug)
    end

    it "shows the proposal" 


    it "shows the invitation on the user's dashboard" 


    context "When accepting" do
      before { click_link 'Accept' }

      it "allows the second speaker to edit her bio" 


      it "marks the invitation as accepted" 

    end

    context "When declining" do
      before { click_link 'Refuse' }

      it "redirects the user back to the proposal page" 


      it "marks the invitation as refused" 

    end
  end
end

