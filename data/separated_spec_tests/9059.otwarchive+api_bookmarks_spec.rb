require "spec_helper"
require "controllers/api/api_helper"

describe "API v2 BookmarksController", type: :request do
  include ApiHelper

  bookmark = { id: "123",
               url: "http://example.com",
               author: "Thing",
               title: "Title Thing",
               summary: "<p>blah blah blah</p>",
               fandom_string: "Testing",
               rating_string: "General Audiences",
               category_string: ["M/M"],
               relationship_string: "Starsky/Hutch",
               character_string: "Starsky,hutch",
               notes: "<p>Notes</p>",
               tag_string: "youpi",
               collection_names: "",
               private: "0",
               rec: "0" }

  before do
    mock_external
  end

  after do
    WebMock.reset!
  end

  context "Valid API bookmark import" do
    let!(:archivist) { create(:archivist) }

    it "returns 200 OK when all bookmarks are created" 


    it "returns 200 OK when no bookmarks are created" 


    it "does not create duplicate bookmarks for the same archivist and external URL" 


    it "passes back any original references unchanged" 


    it "returns the URL of the created bookmark" 


    WebMock.allow_net_connect!
  end

  describe "Invalid API bookmark import" do
    let(:archivist) { create(:archivist) }
    
    it "returns 400 Bad Request if no bookmarks are specified" 


    it "returns an error message if no URL is specified" 


    it "returns an error message if the URL is on AO3" 


    it "returns an error message if there is no fandom" 


    it "returns an error message if there is no title" 


    it "returns an error message if there is no author" 

  end

  describe "Unit tests - import_bookmark" do
    it "returns an error message when an Exception is raised" 

  end
  WebMock.allow_net_connect!
end

