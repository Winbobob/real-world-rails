  require 'rails_helper'

RSpec.describe OrganizersController, type: :controller do
  render_views

  let(:valid_attributes) {
    FactoryBot.attributes_for(:organizer)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:organizer,:invalid)
  }

  context 'as an admin' do
    let(:participant) { create :participant, :admin }
    let(:organizer) { create :organizer }

    before do
      sign_in participant
    end

    describe "GET #show" do
      it "assigns the requested organizer as @organizer" 

    end

    describe "GET #edit" do
      it "assigns the requested organizer as @organizer" 

    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Organizer" 


        it "assigns a newly created organizer as @organizer" 


        it "redirects to the created organizer" 

      end

      context "with invalid params" do
        it "assigns a newly created but unsaved organizer as @organizer" 


        it "re-renders the 'new' template" 

      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          { organizer: 'new name', description: 'some new description' }
        }

        it "updates the requested organizer" 


        it "assigns the requested organizer as @organizer" 


        it "redirects to the organizer" 

      end

      context "with invalid params" do
        it "assigns the organizer as @organizer" 


        it "re-renders the 'edit' template" 

      end
    end

    #describe "DELETE #destroy" do
    #  it "destroys the requested organizer" do
    #    expect {
    #      delete :destroy, params: { id: organizer.id }
    #    }.to change(Organizer, :count).by(-1)
    #  end
    #
    #  it "redirects to the organizers list" do
    #    delete :destroy, params: { id: organizer.id }
    #    expect(response).to redirect_to('/')
    #  end
    #end
  end

end

