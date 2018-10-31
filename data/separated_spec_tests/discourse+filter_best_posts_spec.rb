require 'rails_helper'
require 'filter_best_posts'
require 'topic_view'

describe FilterBestPosts do

  let(:topic) { Fabricate(:topic) }
  let(:coding_horror) { Fabricate(:coding_horror) }
  let(:first_poster) { topic.user }

  let(:topic_view) { TopicView.new(topic.id, coding_horror) }

  let!(:p1) { Fabricate(:post, topic: topic, user: first_poster, percent_rank: 1) }
  let!(:p2) { Fabricate(:post, topic: topic, user: coding_horror, percent_rank: 0.5) }
  let!(:p3) { Fabricate(:post, topic: topic, user: first_poster, percent_rank: 0) }

  let(:moderator) { Fabricate(:moderator) }
  let(:admin) { Fabricate(:admin) }

  it "can find the best responses" 


  describe "processing options" do
    before { @filtered_posts = TopicView.new(topic.id, nil, best: 99).filtered_posts }

    it "should not get the status post" 


    it "should get no results for trust level too low" 


    it "should filter out the posts with a score that is too low" 


    it "should filter out everything if min replies not met" 


    it "should punch through posts if the score is high enough" 


    it "should bypass trust level score" 


    it "should return none if restricted to posts a moderator liked" 


    it "doesn't count likes from admins" 


    it "should find the post liked by the moderator" 


  end
end

