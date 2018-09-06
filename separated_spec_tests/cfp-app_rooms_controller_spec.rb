require 'rails_helper'

describe Organizer::RoomsController, type: :controller do
  let(:event) { create(:event) }
  before { login(create(:organizer, event: event)) }

  describe "DELETE 'destroy'" do
    it "destroys the room with ajax" 

  end

end

