require 'rails_helper'

RSpec.describe PetitionsController, type: :controller do
  describe "GET /petitions/new" do
    it "should assign a petition creator" 


    it "is on stage 'petition'" 


    it "fills in the action if given as query parameter 'q'" 


    context "when parliament is dissolved" do
      before do
        allow(Parliament).to receive(:dissolved?).and_return(true)
      end

      it "redirects to the home page" 

    end

    context "when parliament has not yet opened" do
      before do
        allow(Parliament).to receive(:opened?).and_return(false)
      end

      it "redirects to the home page" 

    end
  end

  describe "POST /petitions/new" do
    let(:params) do
      {
        action: "Save the planet",
        background: "Limit temperature rise at two degrees",
        additional_details: "Global warming is upon us",
        name: "John Mcenroe", email: "john@example.com",
        postcode: "SE3 4LL", location_code: "GB",
        uk_citizenship: "1"
      }
    end

    let(:constituency) do
      FactoryBot.create(:constituency, external_id: "54321", name: "North Creatorshire")
    end

    before do
      allow(Constituency).to receive(:find_by_postcode).with("SE34LL").and_return(constituency)
    end

    context "valid post" do
      let(:petition) { Petition.find_by_action("Save the planet") }

      it "should successfully create a new petition and a signature" 


      it "should successfully create a new petition and a signature even when email has white space either end" 


      it "should strip a petition action on petition creation" 


      it "should send gather sponsors email to petition's creator" 


      it "should successfully point the signature at the petition" 


      it "should set user's ip address on signature" 


      it "should not be able to set the state of a new petition" 


      it "should not be able to set the state of a new signature" 


      it "should set notify_by_email to false on the creator signature" 


      it "sets the constituency_id on the creator signature, based on the postcode" 


      context "invalid post" do
        it "should not create a new petition if no action is given" 


        it "should not create a new petition if email is invalid" 


        it "should not create a new petition if UK citizenship is not confirmed" 


        it "has stage of 'petition' if there is an error on action" 


        it "has stage of 'petition' if there is an error on background" 


        it "has stage of 'petition' if there is an error on additional_details" 


        it "has stage of 'creator' if there is an error on name" 


        it "has stage of 'creator' if there is an error on uk_citizenship" 


        it "has stage of 'creator' if there is an error on postcode" 


        it "has stage of 'creator' if there is an error on location_code" 


        it "has stage of 'replay_email' if there are errors on email and we came from the 'replay_email' stage" 


        it "has stage of 'creator' if there are errors on email and we came from the 'creator' stage" 

      end
    end

    context "when parliament is dissolved" do
      before do
        allow(Parliament).to receive(:dissolved?).and_return(true)
      end

      it "redirects to the home page" 

    end

    context "when parliament has not yet opened" do
      before do
        allow(Parliament).to receive(:opened?).and_return(false)
      end

      it "redirects to the home page" 

    end
  end

  describe "GET /petitions/:id" do
    let(:petition) { double }

    it "assigns the given petition" 


    it "does not allow hidden petitions to be shown" 


    it "does not allow stopped petitions to be shown" 


    context "when the petition is archived" do
      let!(:petition) { FactoryBot.create(:closed_petition, archived_at: 1.hour.ago) }
      let!(:archived_petition) { FactoryBot.create(:archived_petition, id: petition.id, parliament: parliament) }

      context "and the parliament is not archived" do
        let!(:parliament) { FactoryBot.create(:parliament, archived_at: nil) }

        it "assigns the given petition" 

      end

      context "and the parliament is archived" do
        let(:parliament) { FactoryBot.create(:parliament, archived_at: 1.hour.ago) }

        it "redirects to the archived petition page" 

      end
    end
  end

  describe "GET /petitions" do
    context "when no state param is provided" do
      it "is successful" 


      it "exposes a search scoped to the all facet" 

    end

    context "when a state param is provided" do
      context "but it is not a public facet from the locale file" do
        it "redirects to itself with state=all" 


        it "preserves other params when it redirects" 

      end

      context "and it is a public facet from the locale file" do
        it "is successful" 


        it "exposes a search scoped to the state param" 

      end
    end

    context "when parliament has not yet opened" do
      before do
        allow(Parliament).to receive(:opened?).and_return(false)
      end

      it "redirects to the home page" 

    end
  end

  describe "GET /petitions/check" do
    it "is successful" 


    context "when parliament is dissolved" do
      before do
        allow(Parliament).to receive(:dissolved?).and_return(true)
      end

      it "redirects to the home page" 

    end

    context "when parliament has not yet opened" do
      before do
        allow(Parliament).to receive(:opened?).and_return(false)
      end

      it "redirects to the home page" 

    end
  end

  describe "GET /petitions/check_results" do
    it "is successful" 


    context "when parliament is dissolved" do
      before do
        allow(Parliament).to receive(:dissolved?).and_return(true)
      end

      it "redirects to the home page" 

    end

    context "when parliament has not yet opened" do
      before do
        allow(Parliament).to receive(:opened?).and_return(false)
      end

      it "redirects to the home page" 

    end
  end
end

