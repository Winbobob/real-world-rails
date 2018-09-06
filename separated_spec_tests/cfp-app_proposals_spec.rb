require 'rails_helper'

feature "Organizers can manage proposals" do

  let(:event) { create(:event, review_tags: ['intro', 'advanced']) }
  let(:proposal) { create(:proposal, event: event) }

  let(:organizer_person) { create(:person) }
  let!(:organizer_participant) { create(:participant, :organizer, person: organizer_person, event: event) }

  let(:speaker_person) { create(:person) }
  let!(:speaker) { create(:speaker, proposal: proposal, person: speaker_person) }

  before :each do
    login_user(organizer_person)
  end

  after { ActionMailer::Base.deliveries.clear }

  context "Proposals Page" do
    before { visit organizer_event_proposals_path(event) }

    context "Soft accepting a proposal" do
      before { click_link 'Accept' }

      it "sets proposal state to soft accepted" 


      it "does not send an email notification to the speaker" 

    end

    context "Soft rejecting a proposal" do
      before { click_link 'Reject' }

      it "sets proposal state to soft rejected" 


      it "sends an email notification to the speaker" 

    end

    context "Soft waitlisting a proposal" do
      before { click_link 'Waitlist' }

      it "sets proposal state to soft waitlisted" 


      it "sends an email notification to the speaker" 

    end
  end

  context "Edit a proposal" do
    before do
      proposal.last_change = ['abstract']
      proposal.save!
      visit edit_organizer_event_proposal_path(event, proposal)
      fill_in "Title", with: "A New Title"
      click_button 'Save'
      proposal.reload
    end

    it "changes the title of the proposal" 


    it "clears out the last_change array" 

  end

  context "Viewing a proposal" do
    it_behaves_like "a proposal page", :organizer_event_proposal_path

    before do
      visit organizer_event_proposal_path(event, proposal)
    end

    it "links back button to the proposals page" 


    context "Accepting a proposal" do
      before do
        click_link 'Accept'
        visit organizer_event_proposal_path(event, proposal)
        click_link 'Finalize State'
      end

      it "sets proposal state to accepted" 


      it "sends an email notification to the speaker" 

    end

    context "Rejecting a proposal" do
      before do
        click_link 'Reject'
        visit organizer_event_proposal_path(event, proposal)
        click_link 'Finalize State'
      end

      it "sets proposal state to rejected" 


      it "sends an email notification to the speaker" 

    end

    context "Waitlisting a proposal" do
      before do
        click_link 'Waitlist'
        visit organizer_event_proposal_path(event, proposal)
        click_link 'Finalize State'
      end

      it "sets proposal state to waitlisted" 


      it "sends an email notification to the speaker" 

    end

    context "Promoting a waitlisted proposal" do
      let(:proposal) { create(:proposal, state: Proposal::State::WAITLISTED) }

      before do
        visit organizer_event_proposal_path(event, proposal)
        click_link 'Promote'
      end

      it "sets proposal state to waitlisted" 


      it "doesn't send an email notification" 

    end

    context "Declining a waitlisted proposal" do
      let(:proposal) { create(:proposal, state: Proposal::State::WAITLISTED) }

      before do
        visit organizer_event_proposal_path(event, proposal)
        click_link 'Decline'
      end

      it "sets proposal state to waitlisted" 


      it "doesn't send an email notification" 

    end
  end

  context "update_without_touching_updated_by_speaker_at" do
    it "doesn't update the update_by_speaker_at column" 

  end
end

