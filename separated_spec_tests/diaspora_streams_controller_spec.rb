# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe StreamsController, :type => :controller do
  include_context :gon

  context "with a logged in user" do
    before do
      sign_in alice
    end

    describe "#public" do
      it "succeeds" 

    end

    describe "#multi" do
      it "succeeds" 


      it "succeeds on mobile" 


      context "getting started" do
        it "add the inviter to gon" 

      end
    end

    streams = {
      liked:         Stream::Likes,
      mentioned:     Stream::Mention,
      followed_tags: Stream::FollowedTag,
      activity:      Stream::Activity
    }

    streams.each do |stream_path, stream_class|
      describe "a GET to #{stream_path}" do
        it "assigns a stream of the proper class" 

      end
    end
  end

  context "with no user signed in" do
    describe "#public" do
      it "succeeds" 


      it "succeeds on mobile" 

    end

    describe "other streams" do
      it "redirects to the login page" 

    end
  end
end

