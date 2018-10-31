require 'rails_helper'
require 'post_merger'

describe PostMerger do
  let(:moderator) { Fabricate(:moderator) }
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let(:post) { create_post }
  let(:topic) { post.topic }

  describe ".merge" do
    it "should merge posts into the latest post correctly" 


    it "should not allow the first post in a topic to be merged" 


    it "should only allow staff user to merge posts" 


    it "should not allow posts from different topics to be merged" 


    it "should not allow posts from different users to be merged" 

  end
end

