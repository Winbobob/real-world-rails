# frozen_string_literal: true

require "rails_helper"

describe TopicsController, type: :controller do
  render_views
  let(:topic) { create :topic, user: user }
  let(:user) { create :avatar_user }
  let(:newbie) { create :newbie }
  let(:node) { create :node }
  let(:admin) { create :admin }
  let(:team) { create :team }

  describe ":index" do
    it "should have an index action" 


    it "should work when login" 


    it "should 404 with non integer :page value" 

  end

  describe ":feed" do
    it "should have a feed action" 

  end

  describe ":last" do
    it "should have a recent action" 

  end

  describe ":excellent" do
    it "should have a excellent action" 

  end

  describe ":favorites" do
    it "should have a recent action" 

  end

  describe ":node" do
    it "should have a node action" 

  end

  describe ":node_feed" do
    it "should have a node_feed action" 

  end

  describe ":no_reply" do
    it "should have a no_reply action" 

  end

  describe ":last_reply" do
    it "should have a no_reply action" 

  end

  describe ":popular" do
    it "should have a popular action" 

  end

  describe ":new" do
    describe "unauthenticated" do
      it "should not allow anonymous access" 

    end

    describe "authenticated" do
      it "should allow access from authenticated user" 


      it "should render 404 for invalid node id" 


      it "should not allow access from newbie user" 

    end
  end

  describe ":edit" do
    context "unauthenticated" do
      it "should not allow anonymous access" 

    end

    context "authenticated" do
      context "own topic" do
        it "should allow access from authenticated user" 

      end

      context "other's topic" do
        it "should not allow edit other's topic" 

      end
    end
  end

  describe ":create" do
    context "unauthenticated" do
      it "should not allow anonymous access" 

    end

    context "authenticated" do
      it "should allow access from authenticated user" 

      it "should allow access from authenticated user with team" 

    end
  end

  describe ":preview" do
    it "should work" 

  end

  describe ":update" do
    it "should work" 


    it "should update with admin user" 

  end

  describe ":destroy" do
    it "should work" 

  end

  describe ":favorite" do
    it "should work" 

  end

  describe ":unfavorite" do
    it "should work" 

  end

  describe ":follow" do
    it "should work" 

  end

  describe ":unfollow" do
    it "should work" 

  end

  describe "#show" do
    it "should clear user mention notification when show topic" 

  end

  describe "#suggest" do
    it "should not allow user suggest" 


    it "should not allow user suggest by admin" 

  end

  describe "#unsuggest" do
    context "suggested topic" do
      let!(:topic) { create(:topic, excellent: 1) }

      it "should not allow user suggest" 


      it "should not allow user suggest by admin" 

    end
  end

  describe "#ban" do
    it "should not allow user ban" 


    it "should allow by admin" 

  end

  describe "#close" do
    it "should not allow user close" 


    it "should not allow user suggest by admin" 

  end

  describe "#open" do
    it "should not allow user close" 


    it "should not allow user suggest by admin" 

  end
end

