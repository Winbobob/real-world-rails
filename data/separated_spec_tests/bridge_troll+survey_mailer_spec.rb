require 'rails_helper'

describe SurveyMailer do
  let(:rsvp) { create(:rsvp) }
  let(:user) { rsvp.user }
  let(:event) { rsvp.event }
  let(:mail) { SurveyMailer.notification(rsvp) }

  describe "the survey email" do
    it_behaves_like 'a mailer view'

    it "is sent to the RSVP'd person" 


    it "includes the survey link" 

  end
end

