# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe MessagesController, :type => :controller do
  before do
    sign_in(alice, scope: :user)
  end

  describe '#create' do
    before do
      @conversation_params = {
        :author              => alice.person,
        :participant_ids     => [alice.contacts.first.person.id, alice.person.id],
        :subject             => 'cool stuff',
        :messages_attributes => [ {:author => alice.person, :text => 'stuff'} ]
      }
    end

    context "on my own post" do
      before do
        @conversation = Conversation.create!(@conversation_params)
      end

      context "with a valid message" do
        before do
          @message_params = {
            :conversation_id => @conversation.id,
            :message         => { :text => "here is something else" }
          }
        end

        it 'redirects to conversation' 


        it "dispatches the message" 

      end

      context "with an empty message" do
        before do
          @message_params = {
            :conversation_id => @conversation.id,
            :message         => { :text => " " }
          }
        end

        it 'does not create the message' 

      end
    end

    context "on a post from a contact" do
      before do
        @conversation_params[:author] = bob.person
        @conversation = Conversation.create!(@conversation_params)
        @message_params = {
          :conversation_id => @conversation.id,
          :message         => { :text => "here is something else" }
        }
      end

      it 'comments' 


      it "doesn't overwrite author_id" 


      it "doesn't overwrite id" 


      it "dispatches the message" 

    end

    context 'on a post from a stranger' do
      before do
        conversation = Conversation.create!(
          :author          => eve.person,
          :participant_ids => [eve.person.id, bob.person.id]
        )
        @message_params = {
          :conversation_id => conversation.id,
          :message         => { :text => "here is something else" }
        }
      end

      it 'does not create the message' 

    end
  end
end

