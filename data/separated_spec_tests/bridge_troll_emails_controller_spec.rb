require 'rails_helper'

describe Events::EmailsController do
  describe "#create" do
    before do
      @event = create(:event)
      @organizer = create(:user)
      @event.organizers << @organizer

      @volunteer = create(:volunteer_rsvp, event: @event).user
      @student = create(:student_rsvp, event: @event).user
      @waitlisted = create(:student_rsvp, event: @event, waitlist_position: 1).user

      sign_in @organizer
    end

    let(:mail_params) do
      {subject: "What's up, rails", body: 'Hello!'}
    end

    let(:recipients) { JSON.parse(ActionMailer::Base.deliveries.last.header['X-SMTPAPI'].to_s)['to'] }

    it "sends no emails if a subject or body is omitted" 


    describe 'including organizers' do
      let(:recipients) { JSON.parse(ActionMailer::Base.deliveries.last.header['X-SMTPAPI'].to_s)['to'] }
      let(:another_organizer) { create :user }

      before do
        @event.organizers << another_organizer
      end

      context "when cc_organizers flag is true" do
        it "cc's all organizers" 

      end

      context "when cc_organizers flag is falsy" do
        it "cc's the current user organizer" 

      end
    end

    it "keeps a record of the email recipients and content" 


    describe "time text" do
      describe "before the event has happened" do
        before do
          @event.update_attribute(:ends_at, 5.days.from_now)
        end

        it "describes the event as 'upcoming'" 

      end

      describe "after the event has happened" do
        before do
          @event.update_attribute(:ends_at, 5.days.ago)
        end

        it "describes the event as 'past'" 

      end
    end
  end
end

