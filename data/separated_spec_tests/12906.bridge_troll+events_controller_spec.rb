require 'rails_helper'

describe Users::EventsController do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }
  let!(:rsvp) { FactoryBot.create(:rsvp, user: user, event: event,
                                   checkins_count: 1) }

  describe "#index" do
    it 'should respond successfully with json' 


    it 'should respond with the correct count' 

  end
end

