require 'rails_helper'
require 'topic_view'

describe TopicQuery do

  let!(:user) { Fabricate(:coding_horror) }
  let(:creator) { Fabricate(:user) }
  let(:topic_query) { TopicQuery.new(user) }

  let(:moderator) { Fabricate(:moderator) }
  let(:admin) { Fabricate(:admin) }

  context 'secure category' do
    it "filters categories out correctly" 


  end

  context "custom filters" do
    it "allows custom filters to be applied" 

  end

  context "list_topics_by" do

    it "allows users to view their own invisible topics" 


  end

  context "prioritize_pinned_topics" do

    it "does the pagination correctly" 


  end

  context 'bookmarks' do
    it "filters and returns bookmarks correctly" 

  end

  context 'deleted filter' do
    it "filters deleted topics correctly" 

  end

  context 'category filter' do
    let(:category) { Fabricate(:category) }

    let(:diff_category) { Fabricate(:diff_category) }

    it "returns topics in the category when we filter to it" 


    context 'subcategories' do
      let!(:subcategory) { Fabricate(:category, parent_category_id: category.id) }

      it "works with subcategories" 


    end
  end

  context 'tag filter' do
    let(:tag)       { Fabricate(:tag) }
    let(:other_tag) { Fabricate(:tag) }
    let(:uppercase_tag) { Fabricate(:tag, name: "HeLlO") }

    before do
      SiteSetting.tagging_enabled = true
    end

    context "no category filter" do
      let!(:tagged_topic1) { Fabricate(:topic, tags: [tag]) }
      let!(:tagged_topic2) { Fabricate(:topic, tags: [other_tag]) }
      let!(:tagged_topic3) { Fabricate(:topic, tags: [tag, other_tag]) }
      let!(:tagged_topic4) { Fabricate(:topic, tags: [uppercase_tag]) }
      let!(:no_tags_topic) { Fabricate(:topic) }

      it "returns topics with the tag when filtered to it" 


      it "can return topics with all specified tags" 


      it "returns an empty relation when an invalid tag is passed" 


      it "can return topics with no tags" 

    end

    context "and categories too" do
      let(:category1) { Fabricate(:category) }
      let(:category2) { Fabricate(:category) }

      it "returns topics in the given category with the given tag" 

    end
  end

  context 'muted categories' do
    it 'is removed from new and latest lists' 

  end

  context 'muted tags' do
    it 'is removed from new and latest lists' 

  end

  context 'a bunch of topics' do
    let!(:regular_topic) do
      Fabricate(:topic, title: 'this is a regular topic',
                        user: creator,
                        views: 100,
                        like_count: 66,
                        posts_count: 3,
                        participant_count: 11,
                        bumped_at: 15.minutes.ago)
    end
    let!(:pinned_topic) do
      Fabricate(:topic, title: 'this is a pinned topic',
                        user: creator,
                        views: 10,
                        like_count: 100,
                        posts_count: 5,
                        participant_count: 12,
                        pinned_at: 10.minutes.ago,
                        pinned_globally: true,
                        bumped_at: 10.minutes.ago)
    end
    let!(:archived_topic) do
      Fabricate(:topic, title: 'this is an archived topic',
                        user: creator,
                        views: 50,
                        like_count: 30,
                        posts_count: 4,
                        archived: true,
                        participant_count: 1,
                        bumped_at: 6.minutes.ago)
    end
    let!(:invisible_topic) do
      Fabricate(:topic, title: 'this is an invisible topic',
                        user: creator,
                        views: 1,
                        like_count: 5,
                        posts_count: 2,
                        visible: false,
                        participant_count: 3,
                        bumped_at: 5.minutes.ago)
    end
    let!(:closed_topic) do
      Fabricate(:topic, title: 'this is a closed topic',
                        user: creator,
                        views: 2,
                        like_count: 1,
                        posts_count: 1,
                        closed: true,
                        participant_count: 2,
                        bumped_at: 1.minute.ago)
    end
    let!(:future_topic) do
      Fabricate(:topic, title: 'this is a topic in far future',
                        user: creator,
                        views: 30,
                        like_count: 11,
                        posts_count: 6,
                        participant_count: 5,
                        bumped_at: 1000.years.from_now)
    end

    let(:topics) { topic_query.list_latest.topics }

    context 'list_latest' do
      it "returns the topics in the correct order" 


      context 'sort_order' do

        def ids_in_order(order, descending = true)
          TopicQuery.new(admin, order: order, ascending: descending ? 'false' : 'true').list_latest.topics.map(&:id)
        end

        it "returns the topics in correct order" 


      end

    end

    context 'after clearring a pinned topic' do
      before do
        pinned_topic.clear_pin_for(user)
      end

      it "no longer shows the pinned topic at the top" 

    end

  end

  context 'categorized' do
    let(:category) { Fabricate(:category) }
    let(:topic_category) { category.topic }
    let!(:topic_no_cat) { Fabricate(:topic) }
    let!(:topic_in_cat1) { Fabricate(:topic, category: category,
                                             bumped_at: 10.minutes.ago,
                                             created_at: 10.minutes.ago) }
    let!(:topic_in_cat2) { Fabricate(:topic, category: category) }

    describe '#list_new_in_category' do
      it 'returns the topic category and the categorized topic' 

    end

    describe "category default sort order" do
      it "can use category's default sort order" 


      it "ignores invalid order value" 


      it "can be overridden" 

    end
  end

  context 'unread / read topics' do

    context 'with no data' do
      it "has no unread topics" 

    end

    context 'with whispers' do

      it 'correctly shows up in unread for staff' 

    end

    context 'with read data' do
      let!(:partially_read) { Fabricate(:post, user: creator).topic }
      let!(:fully_read) { Fabricate(:post, user: creator).topic }

      before do
        TopicUser.update_last_read(user, partially_read.id, 0, 0, 0)
        TopicUser.update_last_read(user, fully_read.id, 1, 1, 0)
      end

      context 'list_unread' do
        it 'lists topics correctly' 

      end

      context 'user with auto_track_topics list_unread' do
        before do
          user.user_option.auto_track_topics_after_msecs = 0
          user.user_option.save
        end

        it 'only contains the partially read topic' 

      end

    end

  end

  context 'list_new' do

    context 'without a new topic' do
      it "has no new topics" 

    end

    context 'preload api' do
      let(:topics) {}

      it "preloads data correctly" 

    end

    context 'with a new topic' do
      let!(:new_topic) { Fabricate(:topic, user: creator, bumped_at: 10.minutes.ago) }
      let(:topics) { topic_query.list_new.topics }

      it "contains no new topics for a user that has missed the window" 


      context "muted topics" do
        before do
          new_topic.notify_muted!(user)
        end

        it "returns an empty set" 


        context 'un-muted' do
          before do
            new_topic.notify_tracking!(user)
          end

          it "returns the topic again" 

        end
      end
    end

  end

  context 'list_posted' do
    let(:topics) { topic_query.list_posted.topics }

    it "returns blank when there are no posted topics" 


    context 'created topics' do
      let!(:created_topic) { create_post(user: user).topic }

      it "includes the created topic" 

    end

    context "topic you've posted in" do
      let(:other_users_topic) { create_post(user: creator).topic }
      let!(:your_post) { create_post(user: user, topic: other_users_topic) }

      it "includes the posted topic" 

    end

    context "topic you haven't posted in" do
      let(:other_users_topic) { create_post(user: creator).topic }

      it "does not include the topic" 


      context "but interacted with" do

        it "is not included if read" 


        it "is not included if muted" 


        it "is not included if tracking" 

      end
    end
  end

  context 'suggested_for message do' do

    let(:user) do
      Fabricate(:admin)
    end

    let(:sender) do
      Fabricate(:admin)
    end

    let(:group_with_user) do
      group = Fabricate(:group)
      group.add(user)
      group.save
      group
    end

    def create_pm(user, opts = nil)
      unless opts
        opts = user
        user = nil
      end

      create_post(opts.merge(user: user, archetype: Archetype.private_message)).topic
    end

    def read(user, topic, post_number)
      TopicUser.update_last_read(user, topic, post_number, post_number, 10000)
    end

    it 'returns the correct suggestions' 

  end

  context 'suggested_for' do
    def clear_cache!
      $redis.keys('random_topic_cache*').each { |k| $redis.del k }
    end

    before do
      clear_cache!
    end

    context 'when anonymous' do
      let(:topic) { Fabricate(:topic) }
      let!(:new_topic) { Fabricate(:post, user: creator).topic }

      it "should return the new topic" 

    end

    context "anonymously browsing with invisible, closed and archived" do
      let!(:topic) { Fabricate(:topic) }
      let!(:regular_topic) { Fabricate(:post, user: creator).topic }
      let!(:closed_topic) { Fabricate(:topic, user: creator, closed: true) }
      let!(:archived_topic) { Fabricate(:topic, user: creator, archived: true) }
      let!(:invisible_topic) { Fabricate(:topic, user: creator, visible: false) }

      it "should omit the closed/archived/invisbiel topics from suggested" 

    end

    context 'when logged in' do

      let(:topic) { Fabricate(:topic) }
      let(:suggested_topics) {
        tt = topic
        # lets clear cache once category is created - working around caching is hard
        clear_cache!
        topic_query.list_suggested_for(tt).topics.map { |t| t.id }
      }

      it "should return empty results when there is nothing to find" 


      context 'random suggested' do

        let!(:new_topic) { Fabricate(:topic, created_at: 2.days.ago) }
        let!(:old_topic) { Fabricate(:topic, created_at: 3.years.ago) }

        it 'respects suggested_topics_max_days_old' 


      end

      context 'with private messages' do
        let(:group_user) { Fabricate(:user) }
        let(:group) { Fabricate(:group) }
        let(:another_group) { Fabricate(:group) }

        let!(:topic) do
          Fabricate(:private_message_topic,
            topic_allowed_users: [
              Fabricate.build(:topic_allowed_user, user: user)
            ],
            topic_allowed_groups: [
              Fabricate.build(:topic_allowed_group, group: group)
            ]
          )
        end

        let!(:private_message) do
          Fabricate(:private_message_topic,
            topic_allowed_users: [
              Fabricate.build(:topic_allowed_user, user: user)
            ],
            topic_allowed_groups: [
              Fabricate.build(:topic_allowed_group, group: group),
              Fabricate.build(:topic_allowed_group, group: another_group),
            ]
          )
        end

        let!(:private_group_topic) do
          Fabricate(:private_message_topic,
            user: Fabricate(:user),
            topic_allowed_groups: [
              Fabricate.build(:topic_allowed_group, group: group)
            ]
          )
        end

        before do
          group.add(group_user)
          another_group.add(user)
        end

        describe 'as user not part of group' do
          let!(:user) { Fabricate(:user) }

          it 'should not return topics by the group user' 

        end

        describe 'as user part of group' do
          let!(:user) { group_user }

          it 'should return the group topics' 

        end

        context "by tag filter" do
          let(:tag) { Fabricate(:tag) }
          let!(:user) { group_user }

          it 'should return only tagged topics' 


        end
      end

      context 'with some existing topics' do
        let!(:partially_read) { Fabricate(:post, user: creator).topic }
        let!(:new_topic) { Fabricate(:post, user: creator).topic }
        let!(:fully_read) { Fabricate(:post, user: creator).topic }
        let!(:closed_topic) { Fabricate(:topic, user: creator, closed: true) }
        let!(:archived_topic) { Fabricate(:topic, user: creator, archived: true) }
        let!(:invisible_topic) { Fabricate(:topic, user: creator, visible: false) }
        let!(:fully_read_closed) { Fabricate(:post, user: creator).topic }
        let!(:fully_read_archived) { Fabricate(:post, user: creator).topic }

        before do
          user.user_option.auto_track_topics_after_msecs = 0
          user.user_option.save
          TopicUser.update_last_read(user, partially_read.id, 0, 0, 0)
          TopicUser.update_last_read(user, fully_read.id, 1, 1, 0)
          TopicUser.update_last_read(user, fully_read_closed.id, 1, 1, 0)
          TopicUser.update_last_read(user, fully_read_archived.id, 1, 1, 0)
          fully_read_closed.closed = true
          fully_read_closed.save
          fully_read_archived.archived = true
          fully_read_archived.save
        end

        it "returns unread, then new, then random" 


        it "won't return new or fully read if there are enough partially read topics" 


        it "won't return fully read if there are enough partially read topics and new topics" 

      end
    end
  end

  describe '#list_group_topics' do
    let(:group) { Fabricate(:group) }

    let(:user) do
      user = Fabricate(:user)
      group.add(user)
      user
    end

    let(:user2) do
      user = Fabricate(:user)
      group.add(user)
      user
    end

    let(:user3) { Fabricate(:user) }

    let(:private_category) do
      Fabricate(:private_category, group: group)
    end

    let!(:private_message_topic) { Fabricate(:private_message_post, user: user).topic }
    let!(:topic1) { Fabricate(:topic, user: user) }
    let!(:topic2) { Fabricate(:topic, user: user, category: Fabricate(:category)) }
    let!(:topic3) { Fabricate(:topic, user: user, category: private_category) }
    let!(:topic4) { Fabricate(:topic) }
    let!(:topic5) { Fabricate(:topic, user: user, visible: false) }
    let!(:topic6) { Fabricate(:topic, user: user2) }

    it 'should return the right lists for anon user' 


    it 'should retun the right list for users in the same group' 


    it 'should return the right list for user no in the group' 

  end

  describe '#list_private_messages_group' do
    let(:group) { Fabricate(:group) }

    let!(:group_message) do
      Fabricate(:private_message_topic,
        allowed_groups: [group],
        topic_allowed_users: [
          Fabricate.build(:topic_allowed_user, user: Fabricate(:user)),
        ]
      )
    end

    before do
      group.add(creator)
    end

    it 'should return the right list for a group user' 


    it 'should return the right list for an admin not part of the group' 


    it 'should return the right list for a user not part of the group' 

  end

  context "shared drafts" do
    let(:category) { Fabricate(:category) }
    let(:shared_drafts_category) { Fabricate(:category) }
    let!(:topic) { Fabricate(:topic, category: shared_drafts_category) }
    let!(:shared_draft) { Fabricate(:shared_draft, topic: topic, category: category) }
    let(:admin) { Fabricate(:admin) }
    let(:user) { Fabricate(:user) }
    let(:group) { Fabricate(:group) }

    before do
      shared_drafts_category.set_permissions(group => :full)
      shared_drafts_category.save
      SiteSetting.shared_drafts_category = shared_drafts_category.id
    end

    context "destination_category_id" do
      it "doesn't allow regular users to query destination_category_id" 


      it "allows staff users to query destination_category_id" 

    end

    context "latest" do
      it "doesn't include shared topics unless filtering by category" 

    end
  end
end

