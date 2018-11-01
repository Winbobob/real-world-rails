# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ConversationsController, :type => :controller do
  before do
    sign_in alice, scope: :user
  end

  describe '#new' do
    it 'redirects to #index' 

  end

  describe "#new modal" do
    context "desktop" do
      it "succeeds" 

    end

    context "mobile" do
      before do
        controller.session[:mobile_view] = true
      end

      it "assigns a json list of contacts that are sharing with the person" 


      it "does not allow XSS via the name parameter" 


      it "does not allow XSS via the profile name" 

    end
  end

  describe "#index" do
    before do
      hash = {
        author:              alice.person,
        participant_ids:     [alice.contacts.first.person.id, alice.person.id],
        subject:             "not spam",
        messages_attributes: [{author: alice.person, text: "**cool stuff**"}]
      }
      @conversations = Array.new(3) { Conversation.create(hash) }
      @visibilities = @conversations.map {|conversation|
        conversation.conversation_visibilities.find {|visibility| visibility.person == alice.person }
      }
    end

    it "succeeds" 


    it "succeeds with json" 


    it "retrieves all conversations for a user" 


    it "retrieves a conversation" 


    it "does not let you access conversations where you are not a recipient" 


    it "retrieves a conversation message with out markdown content " 

  end

  describe "#create" do
    context "desktop" do
      context "with a valid conversation" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            person_ids:   alice.contacts.first.person.id.to_s
          }
        }

        it "creates a conversation" 


        it "creates a message" 


        it "responds with the conversation id as JSON" 


        it "sets the author to the current_user" 


        it "dispatches the conversation" 

      end

      context "with empty subject" do
        let(:params) {
          {
            conversation: {subject: " ", text: "text debug"},
            person_ids:   alice.contacts.first.person.id.to_s
          }
        }

        it "creates a conversation" 


        it "creates a message" 


        it "responds with the conversation id as JSON" 

      end

      context "with empty text" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "  "},
            person_ids:   alice.contacts.first.person.id.to_s
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end

      context "with empty contact" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            person_ids:   " "
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end

      context "with nil contact" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            person_ids:   nil
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end

      context "with non-mutual contact" do
        let(:person1) { FactoryGirl.create(:person) }
        let(:person2) { FactoryGirl.create(:person) }
        let(:person3) { FactoryGirl.create(:person) }
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            person_ids:   [person1.id, person2.id, person3.id].join(",")
          }
        }

        before do
          alice.contacts.create!(receiving: false, sharing: true, person: person2)
          alice.contacts.create!(receiving: true, sharing: false, person: person3)
        end

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end
    end

    context "mobile" do
      before do
        controller.session[:mobile_view] = true
      end

      context "with a valid conversation" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            contact_ids:  alice.contacts.first.id.to_s
          }
        }

        it "creates a conversation" 


        it "creates a message" 


        it "responds with the conversation id as JSON" 


        it "sets the author to the current_user" 


        it "dispatches the conversation" 

      end

      context "with empty subject" do
        let(:params) {
          {
            conversation: {subject: " ", text: "text debug"},
            contact_ids:  alice.contacts.first.id.to_s
          }
        }

        it "creates a conversation" 


        it "creates a message" 


        it "responds with the conversation id as JSON" 

      end

      context "with empty text" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: " "},
            contact_ids:  alice.contacts.first.id.to_s
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end

      context "with empty contact" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            contact_ids:  " "
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end

      context "with nil contact" do
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            contact_ids:  nil
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end

      context "with non-mutual contact" do
        let(:contact1) { alice.contacts.create(receiving: false, sharing: true, person: FactoryGirl.create(:person)) }
        let(:contact2) { alice.contacts.create(receiving: true, sharing: false, person: FactoryGirl.create(:person)) }
        let(:params) {
          {
            conversation: {subject: "secret stuff", text: "text debug"},
            contact_ids:  [contact1.id, contact2.id].join(",")
          }
        }

        it "does not create a conversation" 


        it "does not create a message" 


        it "responds with an error message" 

      end
    end
  end

  describe "#show" do
    let(:conversation) {
      Conversation.create(
        author:              alice.person,
        participant_ids:     [alice.contacts.first.person.id, alice.person.id],
        subject:             "not spam",
        messages_attributes: [{author: alice.person, text: "cool stuff"}]
      )
    }

    it "succeeds with json" 


    it "redirects to index" 

  end

  describe "#raw" do
    let(:conversation) {
      Conversation.create(
        author:              alice.person,
        participant_ids:     [alice.contacts.first.person.id, alice.person.id],
        subject:             "not spam",
        messages_attributes: [{author: alice.person, text: "cool stuff"}]
      )
    }

    it "returns html of conversation" 


    it "returns 404 when requesting non-existant conversation" 

  end
end

