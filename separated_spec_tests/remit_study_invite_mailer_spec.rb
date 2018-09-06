# encoding: utf-8
require "rails_helper"

RSpec.describe StudyInviteMailer, type: :mailer do
  describe "#invite" do
    let(:inviting_user) do
      FactoryGirl.create(:user, name: "Theodor Corraidhín",
                                email: "tc@example.com")
    end
    let(:invited_user) do
      FactoryGirl.create(:user, name: "Isaia Wubbe",
                                email: "iw@example.com",
                                invite_token: "invite-token")
    end
    let(:study) do
      FactoryGirl.create(:study, title: "Test inviting study",
                                 reference_number: "OCA123",
                                 id: 1)
    end
    let(:study_invite) do
      FactoryGirl.create(:study_invite, study: study,
                                        invited_user: invited_user,
                                        inviting_user: inviting_user)
    end
    let(:mail) { StudyInviteMailer.invite(study_invite) }

    it "sends to the invited users email address" 


    it "sets the subject" 


    it "has the right body" 

  end
end

