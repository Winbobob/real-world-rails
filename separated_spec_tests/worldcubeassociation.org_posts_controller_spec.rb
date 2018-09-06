# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController do
  let!(:post1) { FactoryBot.create(:post, created_at: 1.hours.ago) }
  let!(:hidden_post) { FactoryBot.create(:post, created_at: 1.hours.ago, world_readable: false) }
  let!(:sticky_post) { FactoryBot.create(:post, sticky: true, created_at: 2.hours.ago) }
  let!(:wdc_post) { FactoryBot.create(:post, created_at: 3.hours.ago, tags: "wdc,othertag", show_on_homepage: false) }

  context "not logged in" do
    describe "GET #index" do
      it "populates an array of posts with sticky posts first" 


      it "filters by tag" 

    end

    describe "GET #rss" do
      it "populates an array of posts ignoring sticky bit" 

    end

    describe "GET #show" do
      it "finds a post by slug" 


      it "only matches exact ids" 


      it "cannot find not world_readable posts" 

    end

    describe "GET #new" do
      it "redirects to login" 

    end

    describe "POST #create" do
      it "redirects to login" 

    end
  end

  context "logged in as wrc member" do
    sign_in { FactoryBot.create :user, :wrc_member }

    describe "GET #new" do
      it "works" 

    end

    describe "POST #create" do
      it "creates a post" 

    end
  end

  context "logged in as wdc member" do
    sign_in { FactoryBot.create :user, :wdc_member }

    describe "GET #new" do
      it "returns 200" 

    end

    describe "POST #create" do
      it "creates a tagged post" 

    end
  end
end

