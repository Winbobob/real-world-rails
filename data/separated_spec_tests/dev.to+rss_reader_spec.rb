require "rails_helper"
require "rss"

vcr_option = {
  cassette_name: "rss_feeds",
  allow_playback_repeats: "true"
}

RSpec.describe RssReader, vcr: vcr_option do
  let(:link) { "https://medium.com/feed/@vaidehijoshi" }
  let(:nonmedium_link) { "https://circleci.com/blog/feed.xml" }
  let(:nonpermanent_link) { "https://medium.com/feed/@macsiri/" }
  let(:rss_data) { RSS::Parser.parse(HTTParty.get(link).body, false) }

  describe "#get_all_articles" do
    before do
      [link, nonmedium_link, nonpermanent_link].each do |feed_url|
        create(:user, feed_url: feed_url)
      end
    end

    it "fetch only articles from an feed_url" 


    it "does not re-create article if it already exist" 


    it "gets articles for user" 


    it "does not set featured_number" 

  end

  describe "#valid_feed_url?" do
    it "returns true on valid feed url" 


    it "returns false on invalid feed url" 

  end
end

