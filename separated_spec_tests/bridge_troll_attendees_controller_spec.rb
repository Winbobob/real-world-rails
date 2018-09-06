require 'rails_helper'

describe Events::AttendeesController do
  before do
    @event = create(:event)
    @organizer = create(:user, first_name: 'Apple', last_name: 'Pearson')
    @event.organizers << @organizer

    rsvp_user = create(:user, first_name: 'Snake', last_name: 'Snakeson')
    @rsvp = create(:rsvp, event: @event, user: rsvp_user, dietary_info: 'paleo')
    create(:dietary_restriction, rsvp: @rsvp, restriction: 'vegan')

    sign_in @organizer
  end

  describe '#index' do
    it 'responds to csv' 


    it 'includes organizers in csv' 


    it 'includes all dietary info in the dietary info field' 


    it 'orders RSVPs by user name' 

  end

  describe "#update" do
    let!(:section) { create(:section, event: @event) }

    let(:do_request) do
      put :update, params: { event_id: @event.id, id: @rsvp.id, attendee: {
        section_id: section.id,
        subject_experience: 'Some awesome string'
      } }
    end

    it 'allows organizers to update an attendee\'s section_id' 


    it 'does not allow updates to columns other than section_id' 

  end
end

