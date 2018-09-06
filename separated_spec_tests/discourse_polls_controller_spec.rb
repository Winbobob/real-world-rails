require "rails_helper"
require_relative "../helpers"

describe ::DiscoursePoll::PollsController do
  routes { ::DiscoursePoll::Engine.routes }

  let!(:user) { log_in }
  let(:topic) { Fabricate(:topic) }
  let(:poll)  { Fabricate(:post, topic_id: topic.id, user_id: user.id, raw: "[poll]\n- A\n- B\n[/poll]") }
  let(:multi_poll)  { Fabricate(:post, topic_id: topic.id, user_id: user.id, raw: "[poll min=1 max=2 type=multiple public=true]\n- A\n- B\n[/poll]") }

  describe "#vote" do

    it "works" 


    it "requires at least 1 valid option" 


    it "supports vote changes" 


    it "works even if topic is closed" 


    it "ensures topic is not archived" 


    it "ensures post is not trashed" 


    it "ensures user can post in topic" 


    it "ensures polls are associated with the post" 


    it "checks the name of the poll" 


    it "ensures poll is open" 


    it "doesn't discard anonymous votes when someone votes" 


    it "tracks the users ids for public polls" 

  end

  describe "#toggle_status" do

    it "works for OP" 


    it "works for staff" 


    it "ensures post is not trashed" 


  end

  describe "votes" do

    it "correctly handles offset" 


  end

end

