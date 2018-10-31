require 'rails_helper'

RSpec::Matchers.define :add_notification do |user, notification_type|
  match(notify_expectation_failures: true) do |actual|
    notifications = user.notifications
    before = notifications.count

    actual.call

    expect(notifications.count).to eq(before + 1), "expected 1 new notification, got #{notifications.count - before}"

    last_notification_type = notifications.last.notification_type
    expect(last_notification_type).to eq(Notification.types[notification_type]),
                                      "expected notification type to be '#{notification_type}', got '#{Notification.types.key(last_notification_type)}'"
  end

  match_when_negated do |actual|
    expect { actual.call }.to_not change { user.notifications.where(notification_type: Notification.types[notification_type]).count }
  end

  supports_block_expectations
end

RSpec::Matchers.define_negated_matcher :not_add_notification, :add_notification

describe PostAlerter do

  let!(:evil_trout) { Fabricate(:evil_trout) }
  let(:user) { Fabricate(:user) }

  def create_post_with_alerts(args = {})
    post = Fabricate(:post, args)
    PostAlerter.post_created(post)
  end

  context "private message" do
    it "notifies for pms correctly" 


    it "triggers :before_create_notifications_for_users" 

  end

  context "unread" do
    it "does not return whispers as unread posts" 

  end

  context 'edits' do
    it 'notifies correctly on edits' 


    it 'notifies flaggers when flagged post gets unhidden by edit' 

  end

  context 'likes' do

    it 'notifies on likes after an undo' 


    it 'notifies on does not notify when never is selected' 


    it 'notifies on likes correctly' 

  end

  context 'quotes' do

    it 'does not notify for muted users' 


    it 'notifies a user by username' 


    it "won't notify the user a second time on revision" 


    it "doesn't notify the poster" 


    it "triggers :before_create_notifications_for_users" 

  end

  context 'linked' do
    let(:post1) { create_post }
    let(:user) { post1.user }
    let(:linking_post) { create_post(raw: "my magic topic\n##{Discourse.base_url}#{post1.url}") }

    before do
      SiteSetting.queue_jobs = false
    end

    it "will notify correctly on linking" 


    it "triggers :before_create_notifications_for_users" 

  end

  context '@group mentions' do

    let(:group) { Fabricate(:group, name: 'group', mentionable_level: Group::ALIAS_LEVELS[:everyone]) }
    let(:post) { create_post_with_alerts(raw: "Hello @group how are you?") }
    before { group.add(evil_trout) }

    it 'notifies users correctly' 


    it "triggers :before_create_notifications_for_users" 

  end

  context '@mentions' do

    let(:mention_post) { create_post_with_alerts(user: user, raw: 'Hello @eviltrout') }
    let(:topic) { mention_post.topic }

    before do
      SiteSetting.queue_jobs = false
    end

    it 'notifies a user' 


    it "won't notify the user a second time on revision" 


    it "doesn't notify the user who created the topic in regular mode" 


    it "triggers :before_create_notifications_for_users" 


    it "notification comes from editor if mention is added later" 


    it "doesn't notify the last post editor if they mention themself" 


    let(:alice) { Fabricate(:user, username: 'alice') }
    let(:bob) { Fabricate(:user, username: 'bob') }
    let(:carol) { Fabricate(:admin, username: 'carol') }
    let(:dave) { Fabricate(:user, username: 'dave') }
    let(:eve) { Fabricate(:user, username: 'eve') }
    let(:group) { Fabricate(:group, name: 'group', mentionable_level: Group::ALIAS_LEVELS[:everyone]) }

    before do
      group.bulk_add([alice.id, carol.id])
    end

    def create_post_with_alerts(args = {})
      post = Fabricate(:post, args)
      PostAlerter.post_created(post)
    end

    def set_topic_notification_level(user, topic, level_name)
      TopicUser.change(user.id, topic.id, notification_level: TopicUser.notification_levels[level_name])
    end

    context "topic" do
      let(:topic) { Fabricate(:topic, user: alice) }
      let(:first_post) { Fabricate(:post, user: topic.user) }

      [:watching, :tracking, :regular].each do |notification_level|
        context "when notification level is '#{notification_level}'" do
          before do
            set_topic_notification_level(alice, topic, notification_level)
          end

          it "notifies about @username mention" 

        end
      end

      context "when notification level is 'muted'" do
        before do
          set_topic_notification_level(alice, topic, :muted)
        end

        it "does not notify about @username mention" 

      end
    end

    shared_context "message" do
      context "when mentioned user is part of conversation" do
        [:watching, :tracking, :regular].each do |notification_level|
          context "when notification level is '#{notification_level}'" do
            before do
              set_topic_notification_level(alice, pm_topic, notification_level)
            end

            it "notifies about @username mention" 


            it "notifies about @username mentions by non-human users" 


            it "notifies about @group mention" 


            it "notifies about @group mentions by non-human users" 

          end
        end

        context "when notification level is 'muted'" do
          before do
            set_topic_notification_level(alice, pm_topic, :muted)
          end

          it "does not notify about @username mention" 


          it "does not notify about @group mention" 

        end
      end

      context "when mentioned user is not part of conversation" do
        it "notifies about @username mention when mentioned user is allowed to see message" 


        it "does not notify about @username mention by non-human user even though mentioned user is allowed to see message" 


        it "does not notify about @username mention when mentioned user is not allowed to see message" 


        it "notifies about @group mention when mentioned user is allowed to see message" 


        it "does not notify about @group mention by non-human user even though mentioned user is allowed to see message" 


        it "does not notify about @group mention when mentioned user is not allowed to see message" 

      end
    end

    context "personal message" do
      let(:pm_topic) do
        Fabricate(:private_message_topic, user: alice, topic_allowed_users: [
          Fabricate.build(:topic_allowed_user, user: alice),
          Fabricate.build(:topic_allowed_user, user: bob),
          Fabricate.build(:topic_allowed_user, user: eve)
        ])
      end
      let(:first_post) { Fabricate(:post, topic: pm_topic, user: pm_topic.user) }

      include_context "message"
    end

    context "group message" do
      let(:some_group) { Fabricate(:group, name: 'some_group') }
      let(:pm_topic) do
        Fabricate(:private_message_topic, user: alice, topic_allowed_groups: [
          Fabricate.build(:topic_allowed_group, group: some_group)
        ], topic_allowed_users: [
          Fabricate.build(:topic_allowed_user, user: eve)
        ])
      end
      let(:first_post) { Fabricate(:post, topic: pm_topic, user: pm_topic.user) }

      before do
        some_group.add(alice)
      end

      include_context "message"
    end
  end

  describe ".create_notification" do
    let(:topic) { Fabricate(:private_message_topic, user: user, created_at: 1.hour.ago) }
    let(:post) { Fabricate(:post, topic: topic, created_at: 1.hour.ago) }

    it "creates a notification for PMs" 


    it "keeps the original title for PMs" 


    it "triggers :post_notification_alert" 


    it "triggers :before_create_notification" 

  end

  describe "push_notification" do
    let(:mention_post) { create_post_with_alerts(user: user, raw: 'Hello @eviltrout :heart:') }
    let(:topic) { mention_post.topic }

    it "pushes nothing to suspended users" 


    it "correctly pushes notifications if configured correctly" 

  end

  describe "watching_first_post" do
    let(:group) { Fabricate(:group) }
    let(:user) { Fabricate(:user) }
    let(:category) { Fabricate(:category) }
    let(:tag)  { Fabricate(:tag) }
    let(:topic) { Fabricate(:topic, category: category, tags: [tag]) }
    let(:post) { Fabricate(:post, topic: topic) }

    it "doesn't notify people who aren't watching" 


    it "notifies the user who is following the first post category" 


    it "doesn't notify when the record is not new" 


    it "notifies the user who is following the first post tag" 


    it "notifies the user who is following the first post group" 


    it "triggers :before_create_notifications_for_users" 

  end

  context "replies" do
    it "triggers :before_create_notifications_for_users" 


    it "notifies about regular reply" 


    it "doesn't notify regular user about whispered reply" 


    it "notifies staff user about whispered reply" 


    it "sends email notifications only to users not on CC list of incoming email" 


    it "does not send email notifications to staged users when notification originates in mailinglist mirror category" 

  end

  context "category" do
    context "watching" do
      it "triggers :before_create_notifications_for_users" 


      it "notifies staff about whispered post" 

    end
  end

  context "tags" do
    context "watching" do
      it "triggers :before_create_notifications_for_users" 

    end
  end

  describe '#extract_linked_users' do
    let(:topic) { Fabricate(:topic) }
    let(:post) { Fabricate(:post, topic: topic) }
    let(:post2) { Fabricate(:post) }

    describe 'when linked post has been deleted' do
      let(:topic_link) do
        TopicLink.create!(
          url: "/t/#{topic.id}",
          topic_id: topic.id,
          link_topic_id: post2.topic.id,
          link_post_id: nil,
          post_id: post.id,
          user: user,
          domain: 'test.com'
        )
      end

      it 'should use the first post of the topic' 

    end
  end
end

