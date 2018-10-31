require "rails_helper"

RSpec.describe PodcastTag, type: :liquid_template do
  let(:podcast) { create(:podcast) }
  let(:podcast_episode) { create(:podcast_episode, podcast_id: podcast.id) }
  let(:valid_long_slug) { "/#{podcast.slug}/#{podcast_episode.slug}" }

  before { Liquid::Template.register_tag("podcast", PodcastTag) }

  def generate_podcast_liquid_tag(link)
    Liquid::Template.parse("{% podcast #{link} %}")
  end

  context "when given valid link" do
    it "fetches target podcast" 


    it "raises error if podcast does not exist" 

  end

  it "rejects invalid link" 

end

