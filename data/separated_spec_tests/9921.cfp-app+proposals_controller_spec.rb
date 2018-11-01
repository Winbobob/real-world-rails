require 'rails_helper'

describe Organizer::ProposalsController, type: :controller do

  let(:event) { create(:event) }
  let(:person) do
    create(:person,
           organizer_participants:
             [ build(:participant, role: 'organizer', event: event) ],
          )
  end
  let(:proposal) { create(:proposal, event: event) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(person)
  end

  describe "GET 'show'" do
    it "marks all notifications for this proposal as read" 

  end

  describe "POST 'update_state'" do
    it "returns http redirect" 

  end

  describe "POST 'finalize'" do
    it "returns http redirect" 


    it "finalizes the state" 


    it "sends appropriate emails" 

  end
end

