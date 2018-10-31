require 'rails_helper'

RSpec.describe LocalPetitionsController, type: :controller do
  let(:constituency) { FactoryBot.create(:constituency, external_id: "99999", name: "Holborn") }

  describe "GET /petitions/local" do
    context "when the postcode is valid" do
      before do
        expect(Constituency).to receive(:find_by_postcode).with("N11TY").and_return(constituency)

        get :index, postcode: "n1 1ty"
      end

      it "assigns the sanitized postcode" 


      it "redirects to the constituency page for current popular petitions" 

    end

    context "when the postcode is valid but parliament is dissolved" do
      before do
        expect(Parliament).to receive(:dissolved?).and_return(true)
        expect(Constituency).to receive(:find_by_postcode).with("N11TY").and_return(constituency)

        get :index, postcode: "n1 1ty"
      end

      it "redirects to the constituency page for all popular petitions" 

    end

    context "when the postcode is invalid" do
      before do
        expect(Constituency).to receive(:find_by_postcode).with("SW1A1AA").and_return(nil)
        get :index, postcode: "sw1a 1aa"
      end

      it "assigns the sanitized postcode" 


      it "responds successfully" 


      it "renders the index template" 


      it "doesn't assign the constituency" 


      it "doesn't assign the petitions" 

    end

    context "when the postcode is blank" do
      before do
        expect(Constituency).not_to receive(:find_by_postcode)
        get :index, postcode: ""
      end

      it "responds successfully" 


      it "renders the index template" 

    end

    context "when the postcode is not set" do
      before do
        expect(Constituency).not_to receive(:find_by_postcode)
        get :index
      end

      it "responds successfully" 


      it "renders the index template" 

    end
  end

  describe "GET /petitions/local/:id" do
    let(:petitions) { double(:petitions) }

    before do
      expect(Constituency).to receive(:find_by_slug!).with("holborn").and_return(constituency)
      expect(Petition).to receive(:popular_in_constituency).with("99999", 50).and_return(petitions)

      get :show, id: "holborn"
    end

    it "renders the show template" 


    it "assigns the constituency" 


    it "assigns the petitions" 

  end

  describe "GET /petitions/local/:id/all" do
    let(:petitions) { double(:petitions) }

    before do
      expect(Constituency).to receive(:find_by_slug!).with("holborn").and_return(constituency)
      expect(Petition).to receive(:all_popular_in_constituency).with("99999", 50).and_return(petitions)

      get :all, id: "holborn"
    end

    it "renders the all template" 


    it "assigns the constituency" 


    it "assigns the petitions" 

  end
end

