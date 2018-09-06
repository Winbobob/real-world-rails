# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe "making sure the spec runner works" do
  it "factory creates a user with a person saved" 


  describe "fixtures" do
    it "loads fixtures" 

  end

  describe "#connect_users" do
    before do
      @user1 = User.where(username: "alice").first
      @user2 = User.where(username: "eve").first

      @aspect1 = @user1.aspects.first
      @aspect2 = @user2.aspects.first

      connect_users(@user1, @aspect1, @user2, @aspect2)
    end

    it "connects the first user to the second" 


    it "connects the second user to the first" 


    it "allows posting after running" 

  end

  describe "#add_contact_to_aspect" do
    let(:contact) { alice.contact_for(bob.person) }

    it "adds the contact to the aspect" 


    it "does nothing if they are already in the aspect" 

  end

  describe "#post" do
    it "creates a notification with a mention" 

  end

  describe "#create_conversation_with_message" do
    it "creates a conversation and a message" 

  end
end

