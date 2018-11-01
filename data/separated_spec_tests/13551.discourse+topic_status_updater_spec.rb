# encoding: UTF-8

require 'rails_helper'
require_dependency 'post_destroyer'

# TODO - test pinning, create_moderator_post

describe TopicStatusUpdater do

  let(:user) { Fabricate(:user) }
  let(:admin) { Fabricate(:admin) }

  it "avoids notifying on automatically closed topics" 


  it "adds an autoclosed message" 


  it "triggers a DiscourseEvent on close" 


  it "adds an autoclosed message based on last post" 


  describe "repeat actions" do

    shared_examples "an action that doesn't repeat" do
      it "does not perform the update twice" 


    end

    it_behaves_like "an action that doesn't repeat" do
      let(:status_name) { "closed" }
    end

    it_behaves_like "an action that doesn't repeat" do
      let(:status_name) { "visible" }
    end

    it_behaves_like "an action that doesn't repeat" do
      let(:status_name) { "archived" }
    end

    it "updates autoclosed" 


  end
end

