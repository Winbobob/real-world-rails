require 'rails_helper'

feature "Organizers can manage the program" do

  let(:proposal) { create(:proposal, state: Proposal::State::ACCEPTED) }
  let(:organizer) { create(:organizer, event: proposal.event) }

  before { login_user(organizer) }

  context "Viewing the program" do
    it "can view the program" 

  end

  context "Viewing a proposal" do
    it "links back button to the program page" 

  end

  context "Organizers can see confirmation feedback clearly" do
    it "shows speakers confirmation feedback" 

  end
end

