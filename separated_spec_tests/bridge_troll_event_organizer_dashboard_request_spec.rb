require 'rails_helper'

describe "the organizer dashboard" do
  before do
    @organizer = create(:user)
    @event = create(:event, title: 'RailsBridge for Dik Diks')
    @event.organizers << @organizer
    sign_in_as(@organizer)
  end

  it "displays the event title" 


  it "lets the user manage organizers" 


  it "lets the user preview the student RSVP page" 


  it "lets the user preview the volunteer RSVP page" 


  it "lets the user assign students and volunteers to sections" 


  it "lets the user review sent emails" 


  it 'lets the user download a CSV of student rsvps' 


  it "lets the user check in attendees", js: true do
    user1 = create(:user, first_name: 'Anthony')
    user2 = create(:user, first_name: 'Bapp')

    session1 = @event.event_sessions.first
    session1.update_attribute(:name, 'Installfest')
    session2 = create(:event_session, event: @event, name: 'Curriculum')

    rsvp1 = create(:rsvp, user: user1, event: @event)
    rsvp2 = create(:rsvp, user: user2, event: @event)

    rsvp_session1 = rsvp1.rsvp_sessions.first
    rsvp_session2 = rsvp2.rsvp_sessions.first

    visit event_organizer_tools_path(@event)

    expect(page).to have_content("Check in for Installfest")
    expect(page).to have_content("Check in for Curriculum")

    click_link("Check in for Installfest")
    expect(page).to have_content(user1.first_name)

    within "#rsvp_session_#{rsvp_session1.id}" do
      within '.create' do
        click_on 'Check In'
      end
      expect(page).to have_content('Checked In!')
    end

    within '.checkin-counts' do
      expect(page).to have_content("1")
    end

    expect(rsvp_session1.reload).to be_checked_in
    expect(rsvp_session2.reload).not_to be_checked_in

    within "#rsvp_session_#{rsvp_session2.id}" do
      within '.create' do
        click_on 'Check In'
      end
      expect(page).to have_content('Checked In!')
    end

    within '.checkin-counts' do
      expect(page).to have_content("2")
    end

    expect(rsvp_session1.reload).to be_checked_in
    expect(rsvp_session2.reload).to be_checked_in

    visit event_event_session_checkins_path(@event, session1)

    within "#rsvp_session_#{rsvp_session1.id}" do
      expect(page).to have_content 'Checked In'
    end
    within "#rsvp_session_#{rsvp_session2.id}" do
      expect(page).to have_content 'Checked In'
    end

    within "#rsvp_session_#{rsvp_session1.id}" do
      within '.destroy' do
        click_on 'Un-Check In'
      end
      expect(page).not_to have_content 'Saving'
    end

    within '.checkin-counts' do
      expect(page).to have_content("1")
    end

    expect(rsvp_session1.reload).not_to be_checked_in
  end

  it "lets the organizer update the survey greeting" 

end

