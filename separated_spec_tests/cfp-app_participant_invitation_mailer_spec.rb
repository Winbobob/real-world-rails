require "rails_helper"

describe ParticipantInvitationMailer, type: :mailer do
  describe "create" do
    let(:invitation) { create(:participant_invitation) }
    let(:mail) { ParticipantInvitationMailer.create(invitation) }

    it "renders the headers" 



    it "renders the body" 

  end

end

