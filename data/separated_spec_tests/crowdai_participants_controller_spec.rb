require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  render_views

  let(:valid_attributes) {
    FactoryBot.attributes_for(:participant)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:participant, :invalid)
  }

  context 'as a participant' do
    let(:participant) { create :participant }

    before do
      sign_in participant
    end

    describe "GET #show" do
      it "assigns the requested participant as @participant" 

    end

    describe "GET #edit" do
      it "assigns the requested participant as @participant" 

    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { name: 'Sean' }
        }

        it "updates the requested participant" 


        it "assigns the requested participant as @participant" 


        #it "redirects to the participant" do
        #  put :update, params: { id: participant.id, participant: valid_attributes }
        #  expect(response).to redirect_to(participant)
        #end
      end

      context "with invalid params" do
        it "assigns the participant as @participant" 


        it "re-renders the 'edit' template" 

      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested participant" 


      it "redirects to the root" 

    end
  end

end

