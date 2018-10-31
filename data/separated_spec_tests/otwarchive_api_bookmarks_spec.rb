require "spec_helper"
require "api/api_helper"

describe "API BookmarksController" do
  include ApiHelper

  bookmark = { id: "123",
               url: "http://foo.com",
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
    @user = create_archivist
  end

  after do
    WebMock.reset!
    @user.destroy
  end

  context "Valid API bookmark import" do

    it "should return 200 OK when all bookmarks are created" 


    it "should return 200 OK when no bookmarks are created" 


    it "should not create duplicate bookmarks for the same archivist and external URL" 


    it "should pass back any original references unchanged" 


    it "should respond with the URL of the created bookmark" 


    WebMock.allow_net_connect!
  end

  describe "Invalid API bookmark import" do
    it "should return 400 Bad Request if no bookmarks are specified" 


    it "should return an error message if no URL is specified" 


    it "should return an error message if the URL is on AO3" 


    it "should return an error message if there is no fandom" 


    it "should return an error message if there is no title" 


    it "should return an error message if there is no author" 

  end

  describe "Unit tests - import_bookmark" do
    it "should return an error message when an Exception is raised" 

  end
  WebMock.allow_net_connect!
end

