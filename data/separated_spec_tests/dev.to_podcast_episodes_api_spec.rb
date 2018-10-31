require "rails_helper"

vcr_option = {
  cassette_name: "se_daily_rss_feed",
  allow_playback_repeats: "true",
}

RSpec.describe "ArticlesApi", type: :request, vcr: vcr_option do
  let(:podcast) { create(:podcast, feed_url: "http://softwareengineeringdaily.com/feed/podcast/") }

  before do
    PodcastFeed.new.get_episodes(podcast, 2)
  end

  describe "GET /api/articles" do
    it "returns json response" 


    it "returns podcast episodes" 


    it "returns podcast episodes of specific podcast if passed username" 


    it "returns nothing is passed invalid podcast slug" 

  end
end

