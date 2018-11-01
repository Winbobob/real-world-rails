require "rails_helper"

RSpec.describe TweetTag, type: :liquid_template do
  let(:twitter_id)  { "1018911886862057472" }

  setup             { Liquid::Template.register_tag("tweet", TweetTag) }

  def generate_tweet_liquid_tag(id)
    Liquid::Template.parse("{% tweet #{id} %}")
  end

  it "accepts valid tweet id", :vcr do
    VCR.use_cassette("twitter_gem") do
      liquid = generate_tweet_liquid_tag(twitter_id)
      expect(liquid.root.nodelist[0].tweet.text).not_to eq(nil)
    end
  end

  context "when given invalid id" do
    it "rejects it (normal invalid id)" 


    it "rejects it (xss content)" 

  end
end

