require 'rails_helper'

describe "the attendee details modal", js: true do
  before do
    @organizer = create(:user)

    @event = create(:event)
    @event.organizers << @organizer
    @student_rsvp = create(:student_rsvp, user: create(:user), event: @event)

    sign_in_as(@organizer)

    visit event_organize_sections_path(@event)

    within 'ul.students' do
      find('i').click
    end
  end

  it "lists the student's RSVP details" 

end

