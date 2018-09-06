require 'spec_helper'

describe ApiV1::ConversationsController do
  before do
    make_a_typical_project

    @conversation = @project.new_conversation(@owner, {:name => 'Something needs to be done'})
    @conversation.body = 'Hell yes!'
    @conversation.save!

    @another_conversation = @project.new_conversation(@user, {:name => 'We need a meeting!'})
    @another_conversation.simple = true
    @another_conversation.body = 'Hell yes!'
    @another_conversation.save!
  end

  describe "#index" do
    it "shows conversations in the project" 


    it "shows conversations with a JSONP callback" 


    it "shows conversations as JSON when requested with :text format" 


    it "shows conversations in all projects" 


    it "shows no conversations for archived projects" 


    it "shows conversations created by a user" 


    it "shows no conversations created by a fictious user" 


    it "shows threads if specified" 


    it "shows conversations only if specified" 


    it "limits conversations" 


    it "limits and offsets conversations" 


    it "returns references for linked objects" 


    it "does not show unwatched private conversations in a project" 

  end

  describe "#show" do
    it "shows a conversation with references" 


    it "does not show private conversations unwatched by the user" 


    it "shows private conversations watched by the user" 

  end

  describe "#create" do
    it "should allow participants to create conversations" 


    it "should not allow observers to create conversations" 

  end

  describe "#update" do
    it "should allow participants to modify a conversation" 


    it "should allow participants to convert a conversation to a task" 


    it "should not allow observers to modify a conversation" 


    it "should not allow hacking the comment author" 


    it "should not allow participants not watching to modify a private conversation" 


    it "should return updated conversation and any references" 

  end

  describe "#watch" do
    it "should not allow participants to watch private conversations" 

  end

  describe "#destroy" do
    it "should allow admins to destroy a conversation" 


    it "should allow the creator to destroy a conversation" 


    it "should not allow participants to destroy a conversation" 


    it "should not allow admins not watching to destroy a private conversation" 

  end
end

