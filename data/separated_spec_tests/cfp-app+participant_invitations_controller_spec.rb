require 'rails_helper'

describe Organizer::ParticipantInvitationsController, type: :controller do
  let(:event) { create(:event) }
  let(:organizer) { create(:organizer, event: event) }
  before { login(organizer) }

  describe "POST #create" do
    let(:valid_params) do
      {
        event_id: event,
        participant_invitation: attributes_for(:participant_invitation)
      }
    end

    it "creates a participant invitation" 


    it "sends an invitation email" 

  end
end

