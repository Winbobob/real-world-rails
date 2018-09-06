require 'rails_helper'

describe Events::StudentsController do
  let(:student_rsvp) { create(:student_rsvp) }
  let(:event) { student_rsvp.event }
  let(:organizer) { create(:user) }

  before do
    event.organizers << organizer
    sign_in organizer
  end

  describe '#index' do
    it 'responds successfully, with the right headers' 

  end
end

