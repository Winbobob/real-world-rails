# frozen_string_literal: true

require "integration/federation/federation_helper"
require "integration/federation/shared_receive_relayable"
require "integration/federation/shared_receive_retraction"
require "integration/federation/shared_receive_stream_items"

describe "Receive federation messages feature" do
  before do
    allow_callbacks(%i(queue_public_receive queue_private_receive receive_entity fetch_related_entity))
  end

  let(:sender) { remote_user_on_pod_b }
  let(:sender_id) { sender.diaspora_handle }

  context "with public receive" do
    let(:recipient) { nil }

    context "account deletion" do
      it "receives account deletion correctly" 


      it "rejects account deletion with wrong author" 

    end

    context "account migration" do
      # In case when sender is unknown we should just ignore the migration
      # but this depends on https://github.com/diaspora/diaspora_federation/issues/72
      # which is low-priority, so we just discover the sender profile in this case.
      # But there won't be a spec for that.

      let(:entity) { create_account_migration_entity(sender_id, new_user) }

      def run_migration
        post_message(generate_payload(entity, sender))
      end

      context "with undiscovered new user profile" do
        before do
          allow_callbacks(%i[fetch_public_key])
          allow_private_key_fetch(new_user)
          expect_person_discovery(new_user)
        end

        let(:new_user) { create_undiscovered_user("example.org") }

        it "receives account migration correctly" 


        it "doesn't run the same migration for the second time" 


        it "doesn't accept second migration for the same sender" 


        it "doesn't accept second migration for the same new user profile" 


        context "when our pod was left" do
          let(:sender) { FactoryGirl.create(:user) }

          it "locks the old user account access" 

        end
      end

      context "with discovered profile" do
        let(:new_user) { create_remote_user("example.org") }

        it "updates person profile with data from entity" 

      end
    end

    context "reshare" do
      it "reshare of public post passes" 


      it "reshare of private post fails" 

    end

    it_behaves_like "messages which are indifferent about sharing fact"

    context "with sharing" do
      before do
        contact = alice.contacts.find_or_initialize_by(person_id: sender.person.id)
        contact.sharing = true
        contact.save
      end

      it_behaves_like "messages which are indifferent about sharing fact"
      it_behaves_like "messages which can't be send without sharing"
    end
  end

  context "with private receive" do
    let(:recipient) { alice }

    it "treats sharing request receive correctly" 


    context "with sharing" do
      before do
        contact = alice.contacts.find_or_initialize_by(person_id: sender.person.id)
        contact.sharing = true
        contact.save
      end

      it_behaves_like "messages which are indifferent about sharing fact"
      it_behaves_like "messages which can't be send without sharing"

      it "treats profile receive correctly" 


      it "receives conversation correctly" 


      context "with message" do
        context "local" do
          let(:parent) {
            FactoryGirl.build(:conversation, author: alice.person).tap do |target|
              target.participants << remote_user_on_pod_b.person
              target.participants << remote_user_on_pod_c.person
              target.save
            end
          }
          let(:message) {
            Fabricate(
              :message_entity,
              conversation_guid: parent.guid,
              author:            sender_id,
              parent:            Diaspora::Federation::Entities.related_entity(parent)
            )
          }

          it "receives the message correctly" 

        end

        context "remote" do
          let(:parent) {
            FactoryGirl.build(:conversation, author: remote_user_on_pod_b.person).tap do |target|
              target.participants << alice.person
              target.participants << remote_user_on_pod_c.person
              target.save
            end
          }
          let(:message) {
            Fabricate(
              :message_entity,
              conversation_guid: parent.guid,
              author:            remote_user_on_pod_c.diaspora_handle,
              parent:            Diaspora::Federation::Entities.related_entity(parent)
            )
          }

          it "receives the message correctly" 

        end
      end
    end
  end
end

