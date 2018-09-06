require 'rails_helper'

RSpec.describe DiscourseNarrativeBot::AdvancedUserNarrative do
  let(:discobot_user) { User.find(-2) }
  let(:first_post) { Fabricate(:post, user: discobot_user) }
  let(:user) { Fabricate(:user) }

  let(:topic) do
    Fabricate(:private_message_topic, first_post: first_post,
                                      topic_allowed_users: [
        Fabricate.build(:topic_allowed_user, user: discobot_user),
        Fabricate.build(:topic_allowed_user, user: user),
      ]
    )
  end

  let(:post) { Fabricate(:post, topic: topic, user: user) }
  let(:narrative) { described_class.new }
  let(:other_topic) { Fabricate(:topic) }
  let(:other_post) { Fabricate(:post, topic: other_topic) }
  let(:skip_trigger) { DiscourseNarrativeBot::TrackSelector.skip_trigger }
  let(:reset_trigger) { DiscourseNarrativeBot::TrackSelector.reset_trigger }

  before do
    SiteSetting.discourse_narrative_bot_enabled = true
  end

  describe '#notify_timeout' do
    before do
      narrative.set_data(user,
        state: :tutorial_poll,
        topic_id: topic.id,
        last_post_id: post.id
      )
    end

    it 'should create the right message' 

  end

  describe '#reset_bot' do
    before do
      narrative.set_data(user, state: :tutorial_images, topic_id: topic.id)
    end

    context 'when trigger is initiated in a PM' do
      let(:user) { Fabricate(:user) }

      let(:topic) do
        topic_allowed_user = Fabricate.build(:topic_allowed_user, user: user)
        bot = Fabricate.build(:topic_allowed_user, user: discobot_user)
        Fabricate(:private_message_topic, topic_allowed_users: [topic_allowed_user, bot])
      end

      let(:post) { Fabricate(:post, topic: topic) }

      it 'should reset the bot' 

    end

    context 'when trigger is not initiated in a PM' do
      it 'should start the new track in a PM' 

    end
  end

  describe "#input" do
    context 'edit tutorial' do
      before do
        narrative.set_data(user,
          state: :tutorial_edit,
          topic_id: topic.id,
          track: described_class.to_s,
          tutorial_edit: {
            post_id: first_post.id
          }
        )
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when user replies to the post' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      describe 'when user edits the right post' do
        let(:post_2) { Fabricate(:post, user: post.user, topic: post.topic) }

        it 'should create the right reply' 

      end
    end

    context 'delete tutorial' do
      before do
        narrative.set_data(user,
          state: :tutorial_delete,
          topic_id: topic.id,
          track: described_class.to_s
        )
      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      describe 'when user destroys a post in a different topic' do
        it 'should not do anything' 

      end

      describe 'when user deletes a post in the right topic' do
        it 'should create the right reply' 


        context 'when user is an admin' do
          it 'should create the right reply' 

        end
      end
    end

    context 'undelete post tutorial' do
      before do
        narrative.set_data(user,
          state: :tutorial_recover,
          topic_id: topic.id,
          track: described_class.to_s
        )
      end

      describe 'when posts are configured to be deleted immediately' do
        before do
          SiteSetting.delete_removed_posts_after = 0
        end

        it 'should set up the tutorial correctly' 

      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      describe 'when user recovers a post in a different topic' do
        it 'should not do anything' 

      end

      describe 'when user recovers a post in the right topic' do
        it 'should create the right reply' 

      end
    end

    context 'category hashtag tutorial' do
      before do
        narrative.set_data(user,
          state: :tutorial_category_hashtag,
          topic_id: topic.id,
          track: described_class.to_s
        )
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      it 'should create the right reply' 

    end

    context 'topic notification level tutorial' do
      before do
        narrative.set_data(user,
          state: :tutorial_change_topic_notification_level,
          topic_id: topic.id,
          track: described_class.to_s
        )
      end

      describe 'when notification level is changed for another topic' do
        it 'should not do anything' 

      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      describe 'when user changed the topic notification level' do
        it 'should create the right reply' 

      end

      describe 'when poll is disabled' do
        before do
          SiteSetting.poll_enabled = false
        end

        it 'should create the right reply' 

      end
    end

    context 'poll tutorial' do
      before do
        narrative.set_data(user,
          state: :tutorial_poll,
          topic_id: topic.id,
          track: described_class.to_s
        )
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      it 'should create the right reply' 

    end

    context "details tutorial" do
      before do
        narrative.set_data(user,
          state: :tutorial_details,
          topic_id: topic.id,
          track: described_class.to_s
        )
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      it 'should create the right reply' 

    end
  end
end

