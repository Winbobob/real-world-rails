require 'rails_helper'

describe Jobs::DeleteTopic do
  let(:admin) { Fabricate(:admin) }

  let(:topic) do
    Fabricate(:topic_timer, user: admin).topic
  end

  let(:first_post) { create_post(topic: topic) }

  before do
    SiteSetting.queue_jobs = true
  end

  it "can delete a topic" 


  it "should do nothing if topic is already deleted" 


  it "should do nothing if it's too early" 


  describe "user isn't authorized to delete topics" do
    let(:topic) {
      Fabricate(:topic_timer, user: Fabricate(:user)).topic
    }

    it "shouldn't delete the topic" 

  end

end

