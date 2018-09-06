require 'rails_helper'

RSpec.describe 'Sending an event email', js: true do
  let(:recipients) do
    JSON.parse(ActionMailer::Base.deliveries.last.header['X-SMTPAPI'].to_s)['to']
  end
  let!(:event) { FactoryBot.create(:event, student_rsvp_limit: 1) }
  let(:organizer) { FactoryBot.create(:user) }

  def choose_dropdown_option(dropdown_name, dropdown_option)
    click_button dropdown_name
    within "#recipients-#{dropdown_name.downcase}-dropdown" do
      click_on(dropdown_option)
    end
  end

  before do
    FactoryBot.create(:rsvp, user: organizer, event: event, role: Role::ORGANIZER)

    no_show_volunteer = FactoryBot.create(:user)
    FactoryBot.create(:volunteer_rsvp, user: no_show_volunteer, event: event)

    reliable_volunteer = FactoryBot.create(:user, first_name: 'Sheila', last_name: 'Cool')
    reliable_rsvp = FactoryBot.create(:volunteer_rsvp, user: reliable_volunteer, event: event)
    reliable_rsvp.rsvp_sessions.first.update(checked_in: true)

    accepted_student = FactoryBot.create(:user, first_name: 'Mark', last_name: 'Mywords')
    FactoryBot.create(:student_rsvp, user: accepted_student, event: event)

    waitlisted_student = FactoryBot.create(:user)
    FactoryBot.create(:student_rsvp, user: waitlisted_student, event: event, waitlist_position: 1)

    FactoryBot.create(:user, email: 'unrelated_user@example.com')

    sign_in_as(organizer)
    visit event_organizer_tools_path(event)
    click_link 'Email Attendees'
  end

  it 'shows an accurate count of the # of people to be emailed when clicking buttons' 


  it 'preserves form fields on error' 


  it 'sends an email to the selected people' 


  it 'lets organizers send emails to individuals' 


  it 'has a "CC Organizers" checkbox' 


  it "shows an accurate count of the # of cc'd recipients when selecting cc checkboxes" 


  it 'lets the user review sent emails' 

end

