# frozen_string_literal: true

require "rails_helper"

describe RepliesController, type: :controller do
  describe "#index" do
    it "should work" 


    it "render blank for params last_id 0" 

  end

  describe "#create" do
    it "should error if save fail" 


    it "should create reply and set topic read" 

  end

  describe "#update" do
    let(:topic) { create :topic }
    let(:user) { create :user }
    let(:reply) { create :reply, user: user, topic: topic }

    it "should not change topic's last reply info to previous one" 

  end

  describe "#destroy" do
    let(:topic) { create :topic }
    let(:admin) { create :admin }
    let(:user) { create :user }
    let(:user1) { create :user }
    let(:reply) { create :reply, user: user, topic: topic }
    let(:reply1) { create :reply, user: user1, topic: topic }

    it "should require login to destroy reply" 


    it "user1 should not allow destroy reply" 


    it "user should destroy reply with itself" 


    it "admin should destroy reply" 


    it "should redirect if failure" 

  end

  describe "#reply_to" do
    let(:topic) { create :topic }
    let(:reply1) { create :reply, topic: topic }
    let(:reply) { create :reply, topic: topic, reply_to: reply1 }

    it "should work" 

  end
end

