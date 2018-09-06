require 'rails_helper'

describe RsvpMailer do
  let(:user) { rsvp.user }
  let(:event) { rsvp.event }

  describe 'the confirmation email' do
    let(:mail) { RsvpMailer.confirmation(rsvp) }

    describe "for a volunteer" do
      let(:rsvp) { create(:volunteer_rsvp) }

      it "is sent to the volunteer" 


      it "includes information about the workshop" 


      it "includes both locations for a multi-location event" 


      it_behaves_like 'a mailer view'
    end

    describe "for a student" do
      let(:rsvp) { create(:student_rsvp) }

      it "is sent to the student" 


      it "includes information about the workshop" 


      it "does not include the phrase 'You'll get an email if a slot opens up for you.'" 

    end

    describe "for a waitlisted student" do
      let(:rsvp) { create(:student_rsvp, waitlist_position: 195) }

      it "is sent to the student" 


      it "includes information about the workshop" 


      it "includes the waitlist position and the word 'waitlist'" 

    end
  end

  describe 'the reminder email' do
    let(:rsvp) { FactoryBot.create(:rsvp) }
    let(:mail) { RsvpMailer.reminder(rsvp) }

    it 'is sent to the user' 


    it 'includes information about the workshop' 


    it_behaves_like 'a mailer view'
  end

  describe 'the email when someone gets off the waitlist' do
    let(:rsvp) { FactoryBot.create(:student_rsvp) }
    let(:mail) { RsvpMailer.off_waitlist(rsvp) }

    it 'is sent to the user' 


    it 'includes information about the workshop' 


    it_behaves_like 'a mailer view'
  end
end

