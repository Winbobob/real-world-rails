require 'rails_helper'
require 'score_calculator'

describe ScoreCalculator do

  let!(:post) { Fabricate(:post, reads: 111) }
  let!(:another_post) { Fabricate(:post, topic: post.topic, reads: 222) }
  let(:topic) { post.topic }

  context 'with weightings' do
    before do
      ScoreCalculator.new(reads: 3).calculate
      post.reload
      another_post.reload
    end

    it 'takes the supplied weightings into effect' 


    it "creates the percent_ranks" 


    it "gives the topic a score" 


    it "gives the topic a percent_rank" 


  end

  context 'summary' do

    it "won't update the site settings when the site settings don't match" 


    it "removes the summary flag if the topic no longer qualifies" 


    it "respects the min_topic_age" 


    it "respects the max_topic_length" 


    it "won't update the site settings when the site settings don't match" 


  end

end

