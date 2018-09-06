require 'rails_helper'

describe Organizer::ParticipantsController, type: :controller do
  describe 'POST #create' do
    let(:event) { create(:event) }
    let(:organizer_user) { create(:person) }
    let!(:organizer_participant) { create(:participant,
                                         event: event,
                                         person: organizer_user,
                                         role: 'organizer')
    }
    let!(:other_user) { create(:person, email: 'foo@bar.com') }


    context "A valid organizer" do
      before { allow(controller).to receive(:current_user).and_return(organizer_user) }

      it "creates a new participant" 


      it "can retrieve autocompleted emails" 


      it "cannot set a participant's id" 

    end

    context "A non-organizer" do
      before { allow(controller).to receive(:current_user).and_return(other_user) }

      it "returns 404" 

    end

    context "An unauthorized organizer" do
      let(:event2) { create(:event) }
      let(:sneaky_organizer) { create(:person) }

      before do
        create(:participant, person: sneaky_organizer, event: event2,
               role: 'organizer')
        allow(controller).to receive(:current_user).and_return(sneaky_organizer)
      end

      it "cannot create participants for different events" 

    end
  end
end


