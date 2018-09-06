require 'rails_helper'
require_dependency 'jobs/base'
require 'jobs/regular/process_post'

describe Jobs::FeatureTopicUsers do

  it "raises an error without a topic_id" 


  it "raises no error with a missing topic_id" 


  context 'with a topic' do
    let!(:post) { create_post }
    let(:topic) { post.topic }
    let!(:coding_horror) { Fabricate(:coding_horror) }
    let!(:evil_trout) { Fabricate(:evil_trout) }
    let!(:second_post) { create_post(topic: topic, user: coding_horror) }
    let!(:third_post) { create_post(topic: topic, user: evil_trout) }

    it "won't feature the OP" 


    it "features the second poster" 


    it "won't feature the last poster" 


  end

  context "participant count" do

    let!(:post) { create_post }
    let(:topic) { post.topic }

    it "it works as expected" 


  end

end

