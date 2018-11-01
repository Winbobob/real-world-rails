require 'rails_helper'

describe DiscourseNarrativeBot::NewUserNarrative do
  let!(:welcome_topic) { Fabricate(:topic, title: 'Welcome to Discourse') }
  let(:discobot_user) { User.find(-2) }
  let(:first_post) { Fabricate(:post, user: discobot_user) }
  let(:user) { Fabricate(:user) }

  let(:topic) do
    Fabricate(:private_message_topic,
      first_post: first_post,
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
  let(:profile_page_url) { "#{Discourse.base_url}/users/#{user.username}" }
  let(:skip_trigger) { DiscourseNarrativeBot::TrackSelector.skip_trigger }
  let(:reset_trigger) { DiscourseNarrativeBot::TrackSelector.reset_trigger }

  before do
    SiteSetting.queue_jobs = false
    SiteSetting.discourse_narrative_bot_enabled = true
  end

  describe '#notify_timeout' do
    before do
      narrative.set_data(user,
        state: :tutorial_images,
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

  describe '#input' do
    before do
      SiteSetting.title = "This is an awesome site!"
      narrative.set_data(user, state: :begin)
    end

    describe 'when an error occurs' do
      before do
        narrative.set_data(user, state: :tutorial_flag, topic_id: topic.id)
      end

      it 'should revert to the previous state' 

    end

    describe 'when input does not have a valid transition from current state' do
      before do
        narrative.set_data(user, state: :begin)
      end

      it 'should raise the right error' 

    end

    describe 'when [:begin, :init]' do
      it 'should create the right post' 

    end

    describe "bookmark tutorial" do
      before do
        narrative.set_data(user, state: :tutorial_bookmark, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe "when bookmark is not on bot's post" do
        it 'should not do anything' 

      end

      describe 'when user replies to the topic' do
        it 'should create the right reply' 


        describe 'when rate_limit_new_user_create_post site setting is disabled' do
          before do
            SiteSetting.rate_limit_new_user_create_post = 0
          end

          it 'should create the right reply' 

        end

        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      it 'should create the right reply' 

    end

    describe 'onebox tutorial' do
      before do
        narrative.set_data(user, state: :tutorial_onebox, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when post does not contain onebox' do
        it 'should create the right reply' 

      end

      describe "when user has not liked bot's post" do
        it 'should create the right reply' 

      end

      describe 'when user replies to the topic' do
        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end

        describe 'when emoji is disabled' do
          before do
            SiteSetting.enable_emoji = false
          end

          it 'should create the right reply' 

        end

        it 'should create the right reply' 

      end
    end

    describe 'images tutorial' do
      let(:post_2) { Fabricate(:post, topic: topic) }

      before do
        narrative.set_data(user,
          state: :tutorial_images,
          topic_id: topic.id,
          last_post_id: post_2.id,
          track: described_class.to_s
        )
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when user replies to the topic' do
        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 


          describe 'when allow_flagging_staff is false' do
            it 'should go to the right state' 

          end
        end
      end

      context 'when image is not found' do
        it 'should create the right replies' 

      end

      it 'should create the right replies' 

    end

    describe 'fomatting tutorial' do
      before do
        narrative.set_data(user, state: :tutorial_formatting, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when post does not contain any formatting' do
        it 'should create the right reply' 

      end

      describe 'when user replies to the topic' do
        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      ["**bold**", "__italic__", "[b]bold[/b]", "[i]italic[/i]"].each do |raw|
        it 'should create the right reply' 

      end
    end

    describe 'quote tutorial' do
      before do
        narrative.set_data(user, state: :tutorial_quote, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when post does not contain any quotes' do
        it 'should create the right reply' 

      end

      describe 'when user replies to the topic' do
        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 


          it "should use correct path to images on subfolder installs" 

        end

        it 'should create the right reply' 

      end
    end

    describe 'emoji tutorial' do
      before do
        narrative.set_data(user, state: :tutorial_emoji, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when post does not contain any emoji' do
        it 'should create the right reply' 

      end

      describe 'when user replies to the topic' do
        describe 'when reply contains the skip trigger' do
          it 'should create the right reply' 

        end
      end

      describe 'when user mentions is disabled' do
        before do
          SiteSetting.enable_mentions = false
        end

        it 'should skip the mention tutorial step' 

      end

      it 'should create the right reply' 

    end

    describe 'mention tutorial' do
      before do
        narrative.set_data(user, state: :tutorial_mention, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when post does not contain any mentions' do
        it 'should create the right reply' 

      end

      describe 'when reply contains the skip trigger' do
        it 'should create the right reply' 

      end

      it 'should create the right reply' 

    end

    describe 'flag tutorial' do
      let(:post) { Fabricate(:post, user: discobot_user, topic: topic) }
      let(:flag) { Fabricate(:flag, post: post, user: user) }
      let(:other_post) { Fabricate(:post, user: user, topic: topic) }

      before do
        flag
        narrative.set_data(user, state: :tutorial_flag, topic_id: topic.id)
      end

      describe 'when post flagged is not for the right topic' do
        it 'should not do anything' 

      end

      describe 'when post being flagged does not belong to discobot ' do
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

    describe 'search tutorial' do
      before do
        narrative.set_data(user, state: :tutorial_search, topic_id: topic.id)
      end

      describe 'when post is not in the right topic' do
        it 'should not do anything' 

      end

      describe 'when post does not contain the right answer' do
        it 'should create the right reply' 

      end

      describe 'when post contain the right answer' do
        let(:post) { Fabricate(:post, user: discobot_user, topic: topic) }
        let(:flag) { Fabricate(:flag, post: post, user: user) }

        before do
          narrative.set_data(user,
            state: :tutorial_flag,
            topic_id: topic.id
          )

          DiscourseNarrativeBot::TrackSelector.new(:flag, user, post_id: flag.post_id).select

          expect(narrative.get_data(user)[:state].to_sym).to eq(:tutorial_search)

          expect(post.reload.topic.first_post.raw).to include(I18n.t(
            "discourse_narrative_bot.new_user_narrative.search.hidden_message", base_uri: ''
          ))
        end

        it 'should clean up if the tutorial is skipped' 


        it 'should create the right reply' 

      end
    end
  end
end

