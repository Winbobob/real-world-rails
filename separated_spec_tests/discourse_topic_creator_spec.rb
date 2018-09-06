require 'rails_helper'

describe TopicCreator do

  let(:user)      { Fabricate(:user, trust_level: TrustLevel[2]) }
  let(:moderator) { Fabricate(:moderator) }
  let(:admin)     { Fabricate(:admin) }

  let(:valid_attrs) { Fabricate.attributes_for(:topic) }
  let(:pm_valid_attrs)  { { raw: 'this is a new post', title: 'this is a new title', archetype: Archetype.private_message, target_usernames: moderator.username } }

  let(:pm_to_email_valid_attrs) do
    {
      raw: 'this is a new email',
      title: 'this is a new subject',
      archetype: Archetype.private_message,
      target_emails: 'moderator@example.com'
    }
  end

  describe '#create' do
    context 'topic success cases' do
      before do
        TopicCreator.any_instance.expects(:save_topic).returns(true)
        TopicCreator.any_instance.expects(:watch_topic).returns(true)
        SiteSetting.allow_duplicate_topic_titles = true
      end

      it "should be possible for an admin to create a topic" 


      it "should be possible for a moderator to create a topic" 


      context 'regular user' do
        before { SiteSetting.min_trust_to_create_topic = TrustLevel[0] }

        it "should be possible for a regular user to create a topic" 


        it "should be possible for a regular user to create a topic with blank auto_close_time" 


        it "ignores auto_close_time without raising an error" 


        it "category name is case insensitive" 

      end
    end

    context 'tags' do
      let!(:tag1) { Fabricate(:tag, name: "fun") }
      let!(:tag2) { Fabricate(:tag, name: "fun2") }

      before do
        SiteSetting.tagging_enabled = true
        SiteSetting.min_trust_to_create_tag = 0
        SiteSetting.min_trust_level_to_tag_topics = 0
      end

      context 'regular tags' do
        it "user can add tags to topic" 

      end

      context 'staff-only tags' do
        before do
          create_staff_tags(['alpha'])
        end

        it "regular users can't add staff-only tags" 


        it 'staff can add staff-only tags' 

      end

      context 'minimum_required_tags is present' do
        let!(:category) { Fabricate(:category, name: "beta", minimum_required_tags: 2) }

        it "fails for regular user if minimum_required_tags is not satisfied" 


        it "lets admin create a topic regardless of minimum_required_tags" 


        it "works for regular user if minimum_required_tags is satisfied" 


        it "lets new user create a topic if they don't have sufficient trust level to tag topics" 

      end
    end

    context 'private message' do

      context 'success cases' do
        before do
          TopicCreator.any_instance.expects(:save_topic).returns(true)
          TopicCreator.any_instance.expects(:watch_topic).returns(true)
          SiteSetting.allow_duplicate_topic_titles = true
          SiteSetting.enable_staged_users = true
        end

        it "should be possible for a regular user to send private message" 


        it "min_trust_to_create_topic setting should not be checked when sending private message" 


        it "should be possible for a trusted user to send private messages via email" 

      end

      context 'failure cases' do
        it "should be rollback the changes when email is invalid" 


        it "min_trust_to_send_messages setting should be checked when sending private message" 


        it "min_trust_to_send_email_messages should be checked when sending private messages via email" 

      end
    end
  end
end

