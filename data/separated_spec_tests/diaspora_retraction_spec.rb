# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Retraction do
  let(:post) { alice.post(:status_message, text: "destroy!", public: true) }
  let(:retraction) { Retraction.for(post) }

  describe "#subscribers" do
    it "contains all remote-subscribers of target object" 

  end

  describe "#data" do
    it "contains the hash with all data from the federation-retraction" 

  end

  describe ".retraction_data_for" do
    it "creates the retraction data for a post" 


    it "creates the retraction data for a relayable" 

  end

  describe ".for" do
    it "creates a retraction for a post" 


    it "creates a retraction for a relayable" 

  end

  describe ".defer_dispatch" do
    it "queues a job to send the retraction later" 


    it "adds service metadata to queued job for deletion" 


    it "queues also a job if subscribers is empty" 


    it "queues a job with empty opts for non-StatusMessage" 


    context "relayable" do
      let(:post) { local_luke.post(:status_message, text: "hello", public: true) }
      let(:comment) { FactoryGirl.create(:comment, post: post, author: remote_raphael) }

      it "sends retraction to target author if deleted by parent author" 


      it "don't sends retraction back to target author if relayed by parent author" 

    end
  end

  describe "#perform" do
    it "destroys the target object" 

  end

  describe "#public?" do
    it "returns true for a public post" 


    it "returns true for a public comment if parent post is local" 


    it "returns true for a public comment if parent post is not local" 


    it "returns false for a private target" 

  end
end

