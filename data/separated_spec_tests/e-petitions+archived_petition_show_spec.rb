require 'rails_helper'

RSpec.describe "API request to show an archived petition", type: :request, show_exceptions: true do
  let(:petition) { FactoryBot.create :archived_petition }
  let(:attributes) { json["data"]["attributes"] }

  let(:access_control_allow_origin) { response.headers['Access-Control-Allow-Origin'] }
  let(:access_control_allow_methods) { response.headers['Access-Control-Allow-Methods'] }
  let(:access_control_allow_headers) { response.headers['Access-Control-Allow-Headers'] }

  describe "format" do
    it "responds to JSON" 


    it "sets CORS headers" 


    it "does not respond to XML" 


    context "when accessing the old url" do
      before do
        get "/petitions/#{petition.id}.json"
      end

      it "redirects to the archive url" 

    end
  end

  describe "links" do
    let(:links) { json["links"] }

    it "returns a link to itself" 

  end

  describe "data" do
    it "returns the petition with the expected fields" 


    it "includes the rejection section for rejected petitions" 


    it "includes the government_response section for petitions with a government_response" 


    it "includes the date and time at which the thresholds were reached" 


    it "includes the date when a petition is scheduled for a debate" 


    it "includes the debate section for petitions that have been debated" 


    it "includes the signatures by constituency data" 


    it "doesn't include the signatures by constituency data in rejected petitions" 


    it "includes the signatures by country data" 


    it "doesn't include the signatures by country data in rejected petitions" 

  end
end

