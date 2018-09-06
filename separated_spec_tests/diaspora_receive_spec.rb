# frozen_string_literal: true

describe Diaspora::Federation::Receive do
  let(:sender) { FactoryGirl.create(:person) }
  let(:post) { FactoryGirl.create(:status_message, text: "hello", public: true, author: alice.person) }

  describe ".account_deletion" do
    let(:account_deletion_entity) { Fabricate(:account_deletion_entity, author: sender.diaspora_handle) }

    it "saves the account deletion" 


    it "ignores duplicate the account deletion" 


    it "handles race conditions on parallel receive" 

  end

  describe ".account_migration" do
    let(:new_person) { FactoryGirl.create(:person) }
    let(:profile_entity) { Fabricate(:profile_entity, author: new_person.diaspora_handle) }
    let(:account_migration_entity) {
      Fabricate(:account_migration_entity, author: sender.diaspora_handle, profile: profile_entity)
    }

    it "saves the account deletion" 


    it "ignores duplicate the account migrations" 


    it "handles race conditions on parallel receive" 

  end

  describe ".comment" do
    let(:comment_entity) {
      build_relayable_federation_entity(
        :comment,
        {
          author:           sender.diaspora_handle,
          parent_guid:      post.guid,
          author_signature: "aa"
        },
        "new_property" => "data"
      )
    }

    it "saves the comment" 


    it "attaches the comment to the post" 


    it "saves the signature data" 


    let(:entity) { comment_entity }
    it_behaves_like "it ignores existing object received twice", Comment
    it_behaves_like "it rejects if the root author ignores the author", Comment
    it_behaves_like "it relays relayables", Comment
  end

  describe ".contact" do
    let(:contact_entity) {
      Fabricate(:contact_entity, author: sender.diaspora_handle, recipient: alice.diaspora_handle)
    }

    it "creates the contact if it doesn't exist" 


    it "updates the contact if it exists" 


    it "does nothing, if already sharing" 


    context "sharing=false" do
      let(:unshare_contact_entity) {
        Fabricate(
          :contact_entity,
          author:    sender.diaspora_handle,
          recipient: alice.diaspora_handle,
          sharing:   false
        )
      }

      it "disconnects, if currently connected" 


      it "does nothing, if already disconnected" 

    end
  end

  describe ".conversation" do
    let(:conv_guid) { Fabricate.sequence(:guid) }
    let(:message_entity) {
      Fabricate(
        :message_entity,
        author:            alice.diaspora_handle,
        parent_guid:       conv_guid,
        conversation_guid: conv_guid
      )
    }
    let(:conversation_entity) {
      Fabricate(
        :conversation_entity,
        guid:         conv_guid,
        author:       alice.diaspora_handle,
        messages:     [message_entity],
        participants: "#{alice.diaspora_handle};#{bob.diaspora_handle}"
      )
    }

    it "saves the conversation" 


    it "saves the message" 


    it "creates appropriate visibilities" 


    it_behaves_like "it ignores existing object received twice", Conversation do
      let(:entity) { conversation_entity }
    end
  end

  describe ".like" do
    let(:like_entity) {
      build_relayable_federation_entity(
        :like,
        {
          author:           sender.diaspora_handle,
          parent_guid:      post.guid,
          author_signature: "aa"
        },
        "new_property" => "data"
      )
    }

    it "saves the like" 


    it "attaches the like to the post" 


    it "saves the signature data" 


    let(:entity) { like_entity }
    it_behaves_like "it ignores existing object received twice", Like
    it_behaves_like "it rejects if the root author ignores the author", Like
    it_behaves_like "it relays relayables", Like

    context "like for a comment" do
      let(:comment) { FactoryGirl.create(:comment, post: post) }
      let(:like_entity) {
        build_relayable_federation_entity(
          :like,
          {
            author:           sender.diaspora_handle,
            parent_guid:      comment.guid,
            parent_type:      "Comment",
            author_signature: "aa"
          },
          "new_property" => "data"
        )
      }

      it "attaches the like to the comment" 


      it "saves the signature data" 


      let(:entity) { like_entity }
      it_behaves_like "it ignores existing object received twice", Like
      it_behaves_like "it rejects if the root author ignores the author", Like
      it_behaves_like "it relays relayables", Like
    end
  end

  describe ".message" do
    let(:conversation) {
      FactoryGirl.build(:conversation, author: alice.person).tap do |conv|
        conv.participants << sender
        conv.save!
      end
    }
    let(:message_entity) {
      Fabricate(
        :message_entity,
        author:            sender.diaspora_handle,
        parent_guid:       conversation.guid,
        conversation_guid: conversation.guid
      )
    }

    it "saves the message" 


    it "attaches the message to the conversation" 


    let(:entity) { message_entity }
    it_behaves_like "it ignores existing object received twice", Message
  end

  describe ".participation" do
    let(:participation_entity) {
      Fabricate(:participation_entity, author: sender.diaspora_handle, parent_guid: post.guid)
    }

    it "saves the participation" 


    it "attaches the participation to the post" 


    it_behaves_like "it ignores existing object received twice", Participation do
      let(:entity) { participation_entity }
    end
  end

  describe ".photo" do
    let(:photo_entity) { Fabricate(:photo_entity, author: sender.diaspora_handle) }

    it "saves the photo if it does not already exist" 


    it "updates the photo if it is already persisted" 


    it "does not update the photo if the author mismatches" 

  end

  describe ".poll_participation" do
    let(:post_with_poll) { FactoryGirl.create(:status_message_with_poll, author: alice.person) }
    let(:poll_participation_entity) {
      build_relayable_federation_entity(
        :poll_participation,
        {
          author:           sender.diaspora_handle,
          parent_guid:      post_with_poll.poll.guid,
          poll_answer_guid: post_with_poll.poll.poll_answers.first.guid,
          author_signature: "aa"
        },
        "new_property" => "data"
      )
    }

    it "saves the poll participation" 


    it "attaches the poll participation to the poll" 


    it "saves the signature data" 


    let(:entity) { poll_participation_entity }
    it_behaves_like "it ignores existing object received twice", PollParticipation
    it_behaves_like "it rejects if the root author ignores the author", PollParticipation
    it_behaves_like "it relays relayables", PollParticipation
  end

  describe ".profile" do
    let(:profile_entity) { Fabricate(:profile_entity, author: sender.diaspora_handle) }

    it "updates the profile of the person" 

  end

  describe ".reshare" do
    let(:reshare_entity) { Fabricate(:reshare_entity, author: sender.diaspora_handle, root_guid: post.guid) }

    it "saves the reshare" 


    it "attaches the reshare to the post" 


    it_behaves_like "it ignores existing object received twice", Reshare do
      let(:entity) { reshare_entity }
    end

    it_behaves_like "it sends a participation to the author" do
      let(:entity) { reshare_entity }
    end
  end

  describe ".retraction" do
    it "destroys the post" 


    it "raises when the post does not exist" 


    it "disconnects on Person-Retraction" 


    context "Relayable" do
      it "relays the retraction and destroys the relayable when the parent-author is local" 


      it "destroys the relayable when the parent-author is not local" 

    end
  end

  describe ".status_message" do
    context "basic status message" do
      let(:status_message_entity) { Fabricate(:status_message_entity, author: sender.diaspora_handle) }

      it "saves the status message" 


      it "returns the status message if it already exists" 


      it "does not change anything if the status message already exists" 

    end

    context "with poll" do
      let(:poll_entity) { Fabricate(:poll_entity) }
      let(:status_message_entity) {
        Fabricate(:status_message_entity, author: sender.diaspora_handle, poll: poll_entity)
      }

      it "saves the status message" 

    end

    context "with location" do
      let(:location_entity) { Fabricate(:location_entity) }
      let(:status_message_entity) {
        Fabricate(:status_message_entity, author: sender.diaspora_handle, location: location_entity)
      }

      it "saves the status message" 

    end

    context "with photos" do
      let(:status_message_guid) { Fabricate.sequence(:guid) }
      let(:photo1) {
        Fabricate(:photo_entity, author: sender.diaspora_handle, status_message_guid: status_message_guid)
      }
      let(:photo2) {
        Fabricate(:photo_entity, author: sender.diaspora_handle, status_message_guid: status_message_guid)
      }
      let(:status_message_entity) {
        Fabricate(
          :status_message_entity,
          author: sender.diaspora_handle,
          guid:   status_message_guid,
          photos: [photo1, photo2]
        )
      }

      it "saves the status message and photos" 


      it "receives a status message only with photos and without text" 


      it "does not overwrite the photos if they already exist" 


      it_behaves_like "it sends a participation to the author" do
        let(:entity) { status_message_entity }
      end

      it "doesn't send participations for a private post" 

    end
  end
end

