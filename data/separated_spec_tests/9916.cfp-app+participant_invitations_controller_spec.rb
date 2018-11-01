require 'rails_helper'

describe ParticipantInvitationsController, type: :controller do
  let(:invitation) { create(:participant_invitation, role: 'organizer') }

  describe "GET 'accept'" do
    let(:user) { create(:person) }

    before { login(user) }

    it "creates a new participant for current user" 

  end

  describe "GET 'refuse'" do
    it "redirects to root url" 


    it "sets invitation state to refused" 

  end

end

