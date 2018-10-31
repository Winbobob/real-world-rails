# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResultsSubmissionController, type: :request do
  let(:delegate) { FactoryBot.create :delegate }
  let(:comp) { FactoryBot.create(:competition, delegates: [delegate]) }

  context "not logged in" do
    it "redirects to sign in" 

  end

  context "logged in as a regular user" do
    sign_in { FactoryBot.create(:user) }

    it "redirects to home page" 

  end

  context "logged in as a regular delegate" do
    sign_in { FactoryBot.create(:delegate) }

    it "redirects to home page" 

  end

  context "logged in as THE delegate" do
    let(:user) { comp.delegates.first }
    let(:submission_message) { "Hello, here are the results" }
    let(:file_contents) { '{ "results": "good" }' }
    let(:file) do
      temp_file = Tempfile.new(["sometmpfilename", ".json"])
      temp_file.write(file_contents)
      temp_file.rewind
      Rack::Test::UploadedFile.new(temp_file.path, "application/json")
    end

    before :each do
      sign_in user
    end

    describe "Seeing results submission page" do
      it "returns http success" 

    end

    describe "Posting results" do
      it "sends the 'results submitted' email immediately" 


      it "redirects to competition page" 

    end

    describe "Posting results with missing message" do
      it "flashes an error and doesn't send an email" 

    end

    describe "Posting results with missing file" do
      it "flashes an error and doesn't send an email" 

    end

    describe "Posting results with a non-JSON file" do
      it "flashes an error and doesn't send an email" 

    end
  end
end

