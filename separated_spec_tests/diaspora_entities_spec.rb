# frozen_string_literal: true

describe Diaspora::Federation::Entities do
  describe ".build" do
    it "builds an account deletion" 


    it "builds an account migration" 


    it "builds a comment" 


    it "builds a comment with signature" 


    it "builds a comment with edited_at" 


    it "builds a contact" 


    it "builds a contact for a block" 


    context "Conversation" do
      let(:participant) { FactoryGirl.create(:person) }
      let(:diaspora_entity) { FactoryGirl.create(:conversation_with_message, participants: [participant]) }
      let(:federation_entity) { described_class.build(diaspora_entity) }

      it "builds a conversation" 


      it "adds the participants" 


      it "includes the message" 

    end

    it "builds a like" 


    it "builds a like with signature" 


    it "builds a message" 


    it "builds a participation" 


    it "builds a photo" 


    it "builds a poll participation" 


    it "builds a poll participation with signature" 


    it "builds a profile" 


    it "builds a reshare" 


    context "Retraction" do
      it "builds a Retraction entity for a Photo retraction" 


      it "builds a Contact for a Contact retraction" 


      it "builds a Contact for a Contact retraction with block" 


      it "builds a Contact for a Block retraction" 

    end

    context "StatusMessage" do
      it "builds a status message" 


      it "includes the photos" 


      it "includes the location" 


      it "includes the poll" 

    end
  end
end

