require 'rails_helper'
require 'post_creator'
require 'topic_subtype'

describe PostCreator do

  let(:user) { Fabricate(:user) }
  let(:topic) { Fabricate(:topic, user: user) }

  context "new topic" do
    let(:category) { Fabricate(:category, user: user) }
    let(:basic_topic_params) { { title: "hello world topic", raw: "my name is fred", archetype_id: 1 } }
    let(:image_sizes) { { 'http://an.image.host/image.jpg' => { "width" => 111, "height" => 222 } } }

    let(:creator) { PostCreator.new(user, basic_topic_params) }
    let(:creator_with_category) { PostCreator.new(user, basic_topic_params.merge(category: category.id)) }
    let(:creator_with_meta_data) { PostCreator.new(user, basic_topic_params.merge(meta_data: { hello: "world" })) }
    let(:creator_with_image_sizes) { PostCreator.new(user, basic_topic_params.merge(image_sizes: image_sizes)) }
    let(:creator_with_featured_link) { PostCreator.new(user, title: "featured link topic", archetype_id: 1, featured_link: "http://www.discourse.org", raw: "http://www.discourse.org") }

    it "can create a topic with null byte central" 


    it "can be created with auto tracking disabled" 


    it "can be created with first post as wiki" 


    it "ensures the user can create the topic" 


    context "reply to post number" do
      it "omits reply to post number if received on a new topic" 

    end

    context "invalid title" do
      let(:creator_invalid_title) { PostCreator.new(user, basic_topic_params.merge(title: 'a')) }

      it "has errors" 

    end

    context "invalid raw" do
      let(:creator_invalid_raw) { PostCreator.new(user, basic_topic_params.merge(raw: '')) }

      it "has errors" 

    end

    context "success" do
      before { creator }

      it "doesn't return true for spam" 


      it "triggers extensibility events" 


      it "does not notify on system messages" 


      it "generates the correct messages for a secure topic" 


      it 'generates the correct messages for a normal topic' 


      it 'extracts links from the post' 


      it 'queues up post processing job when saved' 


      it 'passes the invalidate_oneboxes along to the job if present' 


      it 'passes the image_sizes along to the job if present' 


      it 'assigns a category when supplied' 


      it 'adds  meta data from the post' 


      it 'passes the image sizes through' 


      it 'increases topic response counts' 


      it 'sets topic excerpt if first post, but not second post' 


      it 'creates post stats' 


      it "updates topic stats" 


      it 'creates a post with featured link' 


      it 'allows notification email to be skipped' 


      describe "topic's auto close" do
        before do
          SiteSetting.queue_jobs = true
        end

        it "doesn't update topic's auto close when it's not based on last post" 


        describe "topic's auto close based on last post" do
          let(:topic_timer) do
            Fabricate(:topic_timer,
              based_on_last_post: true,
              execute_at: Time.zone.now - 12.hours,
              created_at: Time.zone.now - 24.hours
            )
          end

          let(:topic) { topic_timer.topic }

          let(:post) do
            Fabricate(:post, topic: topic)
          end

          it "updates topic's auto close date" 


          describe "when auto_close_topics_post_count has been reached" do
            before do
              SiteSetting.auto_close_topics_post_count = 2
            end

            it "closes the topic and deletes the topic timer" 

          end
        end
      end

      context "tags" do
        let(:tag_names) { ['art', 'science', 'dance'] }
        let(:creator_with_tags) { PostCreator.new(user, basic_topic_params.merge(tags: tag_names)) }

        context "tagging disabled" do
          before do
            SiteSetting.tagging_enabled = false
          end

          it "doesn't create tags" 

        end

        context "tagging enabled" do
          before do
            SiteSetting.tagging_enabled = true
          end

          context "can create tags" do
            before do
              SiteSetting.min_trust_to_create_tag = 0
              SiteSetting.min_trust_level_to_tag_topics = 0
            end

            it "can create all tags if none exist" 


            it "creates missing tags if some exist" 

          end

          context "cannot create tags" do
            before do
              SiteSetting.min_trust_to_create_tag = 4
              SiteSetting.min_trust_level_to_tag_topics = 0
            end

            it "only uses existing tags" 

          end
        end
      end
    end

    context 'when auto-close param is given' do
      it 'ensures the user can auto-close the topic, but ignores auto-close param silently' 

    end
  end

  context 'whisper' do
    let!(:topic) { Fabricate(:topic, user: user) }

    it 'whispers do not mess up the public view' 

  end

  context 'uniqueness' do

    let!(:topic) { Fabricate(:topic, user: user) }
    let(:basic_topic_params) { { raw: 'test reply', topic_id: topic.id, reply_to_post_number: 4 } }
    let(:creator) { PostCreator.new(user, basic_topic_params) }

    context "disabled" do
      before do
        SiteSetting.unique_posts_mins = 0
        creator.create
      end

      it "returns true for another post with the same content" 

    end

    context 'enabled' do
      let(:new_post_creator) { PostCreator.new(user, basic_topic_params) }

      before do
        SiteSetting.unique_posts_mins = 10
      end

      it "fails for dupe post accross topic" 


      it "returns blank for another post with the same content" 


      it "returns a post for admins" 


      it "returns a post for moderators" 

    end

  end

  context "host spam" do

    let!(:topic) { Fabricate(:topic, user: user) }
    let(:basic_topic_params) { { raw: 'test reply', topic_id: topic.id, reply_to_post_number: 4 } }
    let(:creator) { PostCreator.new(user, basic_topic_params) }

    before do
      Post.any_instance.expects(:has_host_spam?).returns(true)
    end

    it "does not create the post" 


    it "sends a message to moderators" 


  end

  # more integration testing ... maximise our testing
  context 'existing topic' do
    let(:topic) { Fabricate(:topic, user: user, title: 'topic title with 25 chars') }
    let(:creator) { PostCreator.new(user, raw: 'test reply', topic_id: topic.id, reply_to_post_number: 4) }

    it 'ensures the user can create the post' 


    context 'success' do
      it 'create correctly' 

    end

    context "topic stats" do
      before do
        PostCreator.new(
          Fabricate(:coding_horror),
          raw: 'first post in topic',
          topic_id: topic.id,
          created_at: Time.zone.now - 24.hours
        ).create
      end

      it "updates topic stats" 


      it "updates topic stats even when topic fails validation" 

    end
  end

  context 'closed topic' do
    let!(:topic) { Fabricate(:topic, user: user, closed: true) }
    let(:creator) { PostCreator.new(user, raw: 'test reply', topic_id: topic.id, reply_to_post_number: 4) }

    it 'responds with an error message' 

  end

  context 'missing topic' do
    let!(:topic) { Fabricate(:topic, user: user, deleted_at: 5.minutes.ago) }
    let(:creator) { PostCreator.new(user, raw: 'test reply', topic_id: topic.id, reply_to_post_number: 4) }

    it 'responds with an error message' 

  end

  context "cooking options" do
    let(:raw) { "this is my awesome message body hello world" }

    it "passes the cooking options through correctly" 

  end

  # integration test ... minimise db work
  context 'private message' do
    let(:target_user1) { Fabricate(:coding_horror) }
    let(:target_user2) { Fabricate(:moderator) }
    let(:unrelated) { Fabricate(:user) }
    let(:post) do
      PostCreator.create(user, title: 'hi there welcome to my topic',
                               raw: "this is my awesome message @#{unrelated.username_lower}",
                               archetype: Archetype.private_message,
                               target_usernames: [target_user1.username, target_user2.username].join(','),
                               category: 1)
    end

    it 'acts correctly' 

  end

  context "warnings" do
    let(:target_user1) { Fabricate(:coding_horror) }
    let(:target_user2) { Fabricate(:moderator) }
    let(:base_args) do
      { title: 'you need a warning buddy!',
        raw: "you did something bad and I'm telling you about it!",
        is_warning: true,
        target_usernames: target_user1.username,
        category: 1 }
    end

    it "works as expected" 

  end

  context 'auto closing' do
    it 'closes private messages that have more than N posts' 


    it 'closes topics that have more than N posts' 

  end

  context 'private message to group' do
    let(:target_user1) { Fabricate(:coding_horror) }
    let(:target_user2) { Fabricate(:moderator) }
    let(:group) do
      g = Fabricate.build(:group, messageable_level: Group::ALIAS_LEVELS[:everyone])
      g.add(target_user1)
      g.add(target_user2)
      g.save
      g
    end
    let(:unrelated) { Fabricate(:user) }
    let(:post) do
      PostCreator.create!(user,
        title: 'hi there welcome to my topic',
        raw: "this is my awesome message @#{unrelated.username_lower}",
        archetype: Archetype.private_message,
        target_group_names: group.name
      )
    end

    it 'can post to a group correctly' 

  end

  context 'setting created_at' do
    created_at = 1.week.ago
    let(:topic) do
      PostCreator.create(user,
                         raw: 'This is very interesting test post content',
                         title: 'This is a very interesting test post title',
                         created_at: created_at)
    end

    let(:post) do
      PostCreator.create(user,
                         raw: 'This is very interesting test post content',
                         topic_id: Topic.last,
                         created_at: created_at)
    end

    it 'acts correctly' 

  end

  context 'disable validations' do
    it 'can save a post' 

  end

  describe "word_count" do
    it "has a word count" 

  end

  describe "embed_url" do

    let(:embed_url) { "http://eviltrout.com/stupid-url" }

    it "creates the topic_embed record" 

  end

  describe "read credit for creator" do
    it "should give credit to creator" 

  end

  describe "suspended users" do
    it "does not allow suspended users to create topics" 

  end

  it "doesn't strip starting whitespaces" 


  context "events" do
    before do
      @posts_created = 0
      @topics_created = 0

      @increase_posts = -> (post, opts, user) { @posts_created += 1 }
      @increase_topics = -> (topic, opts, user) { @topics_created += 1 }
      DiscourseEvent.on(:post_created, &@increase_posts)
      DiscourseEvent.on(:topic_created, &@increase_topics)
    end

    after do
      DiscourseEvent.off(:post_created, &@increase_posts)
      DiscourseEvent.off(:topic_created, &@increase_topics)
    end

    it "fires boths event when creating a topic" 


    it "fires only the post event when creating a post" 

  end

  context "staged users" do
    let(:staged) { Fabricate(:staged) }

    it "automatically watches all messages it participates in" 

  end

  context "topic tracking" do
    it "automatically watches topic based on preference" 


    it "topic notification level remains tracking based on preference" 


    it "topic notification level is normal based on preference" 

  end

  describe '#create!' do
    it "should return the post if it was successfully created" 


    it "should raise an error when post fails to be created" 

  end

  context 'private message to a user that has disabled private messages' do
    let(:another_user) { Fabricate(:user) }

    before do
      another_user.user_option.update!(allow_private_messages: false)
    end

    it 'should not be valid' 

  end

  context "private message to a muted user" do
    let(:muted_me) { Fabricate(:evil_trout) }

    it 'should fail' 


    let(:staff_user) { Fabricate(:admin) }

    it 'succeeds if the user is staff' 

  end

  context "private message recipients limit (max_allowed_message_recipients) reached" do
    let(:target_user1) { Fabricate(:coding_horror) }
    let(:target_user2) { Fabricate(:evil_trout) }
    let(:target_user3) { Fabricate(:walter_white) }

    before do
      SiteSetting.max_allowed_message_recipients = 2
    end

    context "for normal user" do
      it 'fails when sending message to multiple recipients' 


      it 'succeeds when sending message to multiple recipients if skip_validations is true' 

    end

    context "always succeeds if the user is staff" do
      let(:staff_user) { Fabricate(:admin) }

      it 'when sending message to multiple recipients' 

    end
  end
end

