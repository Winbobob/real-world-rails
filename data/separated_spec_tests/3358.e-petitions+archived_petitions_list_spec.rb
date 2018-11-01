require 'rails_helper'

RSpec.describe "API request to list archived petitions", type: :request, show_exceptions: true do
  let(:access_control_allow_origin) { response.headers['Access-Control-Allow-Origin'] }
  let(:access_control_allow_methods) { response.headers['Access-Control-Allow-Methods'] }
  let(:access_control_allow_headers) { response.headers['Access-Control-Allow-Headers'] }

  before do
    FactoryBot.create(:parliament, :archived)
  end

  describe "format" do
    it "responds to JSON" 


    it "sets CORS headers" 


    it "does not respond to XML" 

  end

  describe "links" do
    let(:links) { json["links"] }

    before do
      FactoryBot.create_list :archived_petition, 3
    end

    it "returns a link to itself" 


    it "returns a link to the first page of results" 


    it "returns a link to the last page of results" 


    it "returns a link to the next page of results if there is one" 


    it "returns a link to the previous page of results if there is one" 


    it "returns no link to the previous page of results when on the first page of results" 


    it "returns no link to the next page of results when on the last page of results" 


    it "returns the last link == first link for empty results" 


    it "returns previous page link == last link when paging off the end of the results" 

  end

  describe "data" do
    let(:data) { json["data"] }

    it "returns an empty response if no petitions are public" 


    it "returns a list of serialized petitions in the expected order" 


    it "includes a link to each petitions details" 


    it "includes the rejection section for rejected petitions" 


    it "includes the government_response section for petitions with a government_response" 


    it "includes the debate section for petitions that have been debated" 

  end
end

