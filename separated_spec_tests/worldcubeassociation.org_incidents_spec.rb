# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Incidents management", type: :request do
  let(:incident) { FactoryBot.create(:sent_incident, created_at: Time.now) }
  let(:valid_attributes) {
    {
      title: "My new incident",
      public_summary: "Public statement",
      private_description: "Private statement",
      private_wrc_decision: "Private resolution",
    }
  }

  let(:invalid_attributes) {
    {
      title: "",
      public_summary: "invalid",
      private_description: "description for invalid",
      private_wrc_decision: "resolution for invalid",
    }
  }

  let(:wrc_member) { FactoryBot.create(:user, :wrc_member) }

  describe "GET #show" do
    let!(:pending_incident) { FactoryBot.create(:incident) }

    context "when logged in as a user" do
      sign_in { FactoryBot.create(:user) }
      it "shows a resolved incident" 

      it "does not show a pending incident" 

    end

    context "when logged in as a Delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "shows a pending incident" 

    end

    context "when logged in as a WDC member" do
      sign_in { FactoryBot.create(:user, :wdc_member) }
      it "shows a pending incident" 

    end

    context "when logged in as a WQAC member" do
      sign_in { FactoryBot.create(:user, :wqac_member) }
      it "shows a pending incident" 

    end
  end

  describe "GET #new" do
    context "when not signed in" do
      sign_out
      it "redirects to the sign in page" 

    end

    context "when signed in as a delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "does not allow access" 

    end

    context "when signed in as a wrc_member" do
      before do
        sign_in wrc_member
      end
      it "shows the incident creation form" 

    end
  end

  describe "GET #edit" do
    context "when signed in as a delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "does not allow access" 

    end

    context "when signed in as a wrc_member" do
      before do
        sign_in wrc_member
      end
      it "renders the edit page" 

    end
  end

  describe "POST #create" do
    before :each do
      sign_in wrc_member
    end

    context "when signed in as a delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "does not allow access" 

    end

    context "with valid params" do
      it "creates a new Incident" 


      it "redirects to the created incident" 

    end

    context "with invalid params" do
      it "renders the new incident form" 

    end
  end

  describe "PUT #update" do
    let!(:competition) { FactoryBot.create(:competition, :confirmed) }
    before :each do
      sign_in wrc_member
    end

    context "when signed in as a delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "does not allow access" 

    end

    context "with valid params" do
      let(:new_attributes) {
        {
          tags: "a,b",
          private_wrc_decision: "Private resolution",
          incident_competitions_attributes: { "0": { competition_id: competition.id, comments: "some text" } },
        }
      }

      it "updates the requested incident and redirect to the incident" 

    end

    context "with invalid params" do
      it "doesn't update the incident" 

    end
  end

  describe "DELETE #destroy" do
    context "when signed in as a delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "does not allow access" 

    end

    context "when signed in as a WRC member" do
      it "destroys the requested incident and redirects to the incident list" 

    end
  end

  describe "PATCH #mark_as" do
    context "when signed in as a delegate" do
      sign_in { FactoryBot.create(:delegate) }
      it "does not allow access" 

    end

    context "when signed in as a WRC member" do
      before :each do
        sign_in wrc_member
      end

      it "can mark as resolved" 


      it "can mark as digest sent" 


      it "does not mark as digest sent when incident is not resolved" 

    end
  end
end

