require "rails_helper"

vcr_option = {
  cassette_name: "se_daily_rss_feed",
  allow_playback_repeats: "true",
}

RSpec.describe PodcastFeed, vcr: vcr_option do
  let(:feed_url) { "http://softwareengineeringdaily.com/feed/podcast/" }
  let(:podcast) { create(:podcast, feed_url: feed_url) }

  before do
    podcast
  end

  it "fetches podcast episodes" 


  it "does not refetch already fetched episodes" 

end

