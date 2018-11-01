require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /about" do
    it "has proper headline" 

  end

  describe "GET /privacy" do
    it "has proper headline" 

  end

  describe "GET /terms" do
    it "has proper headline" 

  end

  describe "GET /security" do
    it "has proper headline" 

  end

  describe "GET /code-of-conduct" do
    it "has proper headline" 

  end

  describe "GET /rly" do
    it "has proper headline" 

  end

  describe "GET /sponsorship-info" do
    it "has proper headline" 

  end

  describe "GET /membership" do
    it "has proper headline" 

  end

  describe "GET /welcome" do
    it "has proper headline" 

  end

  describe "GET /live" do
    let(:user) { create(:user) }

    context "when nothing is live" do
      it "shows the correct message" 

    end

    context "when live is starting soon" do
      before do
        test_strategy = Flipflop::FeatureSet.current.test!
        test_strategy.switch!(:live_starting_soon, true)
        get "/live"
      end

      after do
        test_strategy = Flipflop::FeatureSet.current.test!
        test_strategy.switch!(:live_starting_soon, false)
      end

      it "shows the correct message" 

    end

    context "when live is live" do
      before do
        test_strategy = Flipflop::FeatureSet.current.test!
        test_strategy.switch!(:live_is_live, true)
        create(:chat_channel, :workshop)
      end

      after do
        test_strategy = Flipflop::FeatureSet.current.test!
        test_strategy.switch!(:live_is_live, false)
      end

      it "shows a sign in page for logged out users" 


      it "shows the video for logged in users" 


      it "shows the chat for logged in users" 

    end
  end
end

