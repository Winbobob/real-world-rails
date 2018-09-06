require 'rails_helper'

describe Organizer::TracksController, type: :controller do
  let(:event) { create(:event) }
  before { login(create(:organizer, event: event)) }

  describe "Delete 'destroy'" do
    it "destroys the track with ajax" 

  end

end

