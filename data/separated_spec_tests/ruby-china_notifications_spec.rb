# frozen_string_literal: true

require "rails_helper"

describe "API V3", "notifications", type: :request do
  describe "GET /api/notifications.json" do
    it "must require token" 


    it "should be ok" 


    it "should get notification for a mention in a reply" 


    context "NodeChanged" do
      let!(:node) { create :node }
      let!(:topic) { create :topic, user: current_user }

      it "should work" 

    end

    it "should get notification for a topic" 


    it "should get notification for a reply" 


    it "should get notification for a mention in a topic" 


    it "should return a list of notifications of the current user" 

  end

  describe "POST /api/notifications/read.json" do
    it "must require token" 


    it "should work" 

  end

  describe "GET /api/notifications/unread_count.json" do
    it "should 401 when not login" 


    it "should get count" 

  end

  describe "DELETE /api/notifications/all.json" do
    it "must require token" 


    it "should delete all notifications of current user" 

  end

  describe "DELETE /api/notifications/:id.json" do
    it "must require token" 


    it "should delete the specified notification of current user" 

  end
end

