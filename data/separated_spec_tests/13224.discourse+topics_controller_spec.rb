require 'rails_helper'

RSpec.describe TopicsController do
  let(:topic) { Fabricate(:topic) }
  let(:user) { Fabricate(:user) }

  describe '#wordpress' do
    let!(:user) { sign_in(Fabricate(:moderator)) }
    let(:p1) { Fabricate(:post, user: user) }
    let(:topic) { p1.topic }
    let!(:p2) { Fabricate(:post, topic: topic, user: user) }

    it "returns the JSON in the format our wordpress plugin needs" 

  end

  describe '#move_posts' do
    before do
      SiteSetting.min_topic_title_length = 2
      SiteSetting.tagging_enabled = true
    end

    it 'needs you to be logged in' 


    describe 'moving to a new topic' do
      let(:user) { Fabricate(:user) }
      let(:moderator) { Fabricate(:moderator) }
      let(:p1) { Fabricate(:post, user: user, post_number: 1) }
      let(:p2) { Fabricate(:post, user: user, post_number: 2, topic: p1.topic) }
      let!(:topic) { p1.topic }

      it "raises an error without post_ids" 


      it "raises an error when the user doesn't have permission to move the posts" 


      it "raises an error when the OP is not a regular post" 


      context 'success' do
        before { sign_in(Fabricate(:admin)) }

        it "returns success" 


        describe 'when topic has been deleted' do
          it 'should still be able to move posts' 

        end
      end

      context 'failure' do
        it "returns JSON with a false success" 

      end

      describe "moving replied posts" do
        context 'success' do
          it "moves the child posts too" 

        end
      end
    end

    describe 'moving to an existing topic' do
      let!(:user) { sign_in(Fabricate(:moderator)) }
      let(:p1) { Fabricate(:post, user: user) }
      let(:topic) { p1.topic }
      let(:dest_topic) { Fabricate(:topic) }
      let(:p2) { Fabricate(:post, user: user, topic: topic) }

      context 'success' do
        it "returns success" 


        it "triggers an event on merge" 

      end

      context 'failure' do
        let(:p2) { Fabricate(:post, user: user) }
        it "returns JSON with a false success" 

      end
    end
  end

  describe '#merge_topic' do
    it 'needs you to be logged in' 


    describe 'moving to a new topic' do
      let(:moderator) { Fabricate(:moderator) }
      let(:user) { Fabricate(:user) }
      let(:p1) { Fabricate(:post, user: user) }
      let(:topic) { p1.topic }

      it "raises an error without destination_topic_id" 


      it "raises an error when the user doesn't have permission to merge" 


      let(:dest_topic) { Fabricate(:topic) }

      context 'moves all the posts to the destination topic' do
        it "returns success" 

      end
    end
  end

  describe '#change_post_owners' do
    it 'needs you to be logged in' 


    describe 'forbidden to moderators' do
      before do
        sign_in(Fabricate(:moderator))
      end
      it 'correctly denies' 

    end

    describe 'forbidden to trust_level_4s' do
      before do
        sign_in(Fabricate(:trust_level_4))
      end

      it 'correctly denies' 

    end

    describe 'changing ownership' do
      let!(:editor) { sign_in(Fabricate(:admin)) }
      let(:topic) { Fabricate(:topic) }
      let(:user_a) { Fabricate(:user) }
      let(:p1) { Fabricate(:post, topic: topic) }
      let(:p2) { Fabricate(:post, topic: topic) }

      it "raises an error with a parameter missing" 


      it "changes the topic and posts ownership" 


      it "changes multiple posts" 


      it "works with deleted users" 

    end
  end

  describe '#change_timestamps' do
    let(:params) { { timestamp: Time.zone.now } }

    it 'needs you to be logged in' 


    [:moderator, :trust_level_4].each do |user|
      describe "forbidden to #{user}" do
        let!(user) { sign_in(Fabricate(user)) }

        it 'correctly denies' 

      end
    end

    describe 'changing timestamps' do
      let!(:admin) { sign_in(Fabricate(:admin)) }
      let(:old_timestamp) { Time.zone.now }
      let(:new_timestamp) { old_timestamp - 1.day }
      let!(:topic) { Fabricate(:topic, created_at: old_timestamp) }
      let!(:p1) { Fabricate(:post, topic: topic, created_at: old_timestamp) }
      let!(:p2) { Fabricate(:post, topic: topic, created_at: old_timestamp + 1.day) }

      it 'should update the timestamps of selected posts' 

    end
  end

  describe '#clear_pin' do
    it 'needs you to be logged in' 


    context 'when logged in' do
      let(:topic) { Fabricate(:topic) }
      let(:pm) { Fabricate(:private_message_topic) }
      let(:user) { Fabricate(:user) }
      before do
        sign_in(user)
      end

      it "fails when the user can't see the topic" 


      describe 'when the user can see the topic' do
        it "succeeds" 

      end
    end
  end

  describe '#status' do
    it 'needs you to be logged in' 


    describe 'when logged in' do
      let(:user) { Fabricate(:user) }
      let(:moderator) { Fabricate(:moderator) }
      let(:topic) { Fabricate(:topic) }
      before do
        sign_in(moderator)
      end

      it "raises an exception if you can't change it" 


      it 'requires the status parameter' 


      it 'requires the enabled parameter' 


      it 'raises an error with a status not in the whitelist' 


      it 'should update the status of the topic correctly' 

    end
  end

  describe '#destroy_timings' do
    it 'needs you to be logged in' 


    def topic_user_post_timings_count(user, topic)
      [TopicUser, PostTiming].map do |klass|
        klass.where(user: user, topic: topic).count
      end
    end

    context 'when logged in' do
      before do
        @user = sign_in(Fabricate(:user))
        @topic = Fabricate(:topic, user: @user)
        Fabricate(:post, user: @user, topic: @topic, post_number: 2)
        TopicUser.create!(topic: @topic, user: @user)
        PostTiming.create!(topic: @topic, user: @user, post_number: 2, msecs: 1000)
      end

      it 'deletes the forum topic user and post timings records' 

    end
  end

  describe '#mute/unmute' do
    it 'needs you to be logged in' 


    it 'needs you to be logged in' 

  end

  describe '#recover' do
    it "won't allow us to recover a topic when we're not logged in" 


    describe 'when logged in' do
      let(:user) { Fabricate(:user) }
      let(:moderator) { Fabricate(:moderator) }
      let(:topic) { Fabricate(:topic, user: user, deleted_at: Time.now, deleted_by: moderator) }
      let!(:post) { Fabricate(:post, user: user, topic: topic, post_number: 1, deleted_at: Time.now, deleted_by: moderator) }

      describe 'without access' do
        it "raises an exception when the user doesn't have permission to delete the topic" 

      end

      context 'with permission' do
        before do
          sign_in(moderator)
        end

        it 'succeeds' 

      end
    end
  end

  describe '#delete' do
    it "won't allow us to delete a topic when we're not logged in" 


    describe 'when logged in' do
      let(:user) { Fabricate(:user) }
      let(:moderator) { Fabricate(:moderator) }
      let(:topic) { Fabricate(:topic, user: user) }
      let!(:post) { Fabricate(:post, topic: topic, user: user, post_number: 1) }

      describe 'without access' do
        it "raises an exception when the user doesn't have permission to delete the topic" 

      end

      describe 'with permission' do
        before do
          sign_in(moderator)
        end

        it 'succeeds' 

      end
    end
  end

  describe '#id_for_slug' do
    let(:topic) { Fabricate(:post).topic }
    let(:pm) { Fabricate(:private_message_topic) }

    it "returns JSON for the slug" 


    it "returns invalid access if the user can't see the topic" 

  end

  describe '#update' do
    it "won't allow us to update a topic when we're not logged in" 


    describe 'when logged in' do
      let(:topic) { Fabricate(:topic, user: user) }

      before do
        Fabricate(:post, topic: topic)
        SiteSetting.editing_grace_period = 0
        sign_in(user)
      end

      it 'can not change category to a disallowed category' 


      it 'can not move to a category that requires topic approval' 


      describe 'without permission' do
        it "raises an exception when the user doesn't have permission to update the topic" 

      end

      describe 'with permission' do
        it 'succeeds' 


        it "can update a topic to an uncategorized topic" 


        it 'allows a change of title' 


        it "returns errors with invalid titles" 


        it "returns errors when the rate limit is exceeded" 


        it "returns errors with invalid categories" 


        it "doesn't call the PostRevisor when there is no changes" 


        context 'when topic is private' do
          before do
            topic.update!(
              archetype: Archetype.private_message,
              category: nil,
              allowed_users: [topic.user]
            )
          end

          context 'when there are no changes' do
            it 'does not call the PostRevisor' 

          end
        end

        context "allow_uncategorized_topics is false" do
          before do
            SiteSetting.allow_uncategorized_topics = false
          end

          it "can add a category to an uncategorized topic" 

        end
      end
    end
  end

  describe '#show' do
    let(:private_topic) { Fabricate(:private_message_topic) }
    let(:topic) { Fabricate(:post).topic }

    let!(:p1) { Fabricate(:post, user: topic.user) }
    let!(:p2) { Fabricate(:post, user: topic.user) }

    describe 'when topic is not allowed' do
      it 'should return the right response' 

    end

    it 'correctly renders canoicals' 


    it 'returns 301 even if slug does not match URL' 


    it 'shows a topic correctly' 


    it 'return 404 for an invalid page' 


    it 'can find a topic given a slug in the id param' 


    it 'can find a topic when a slug has a number in front' 


    it 'keeps the post_number parameter around when redirecting' 


    it 'keeps the page around when redirecting' 


    it 'does not accept page params as an array' 


    it 'returns 404 when an invalid slug is given and no id' 


    it 'returns a 404 when slug and topic id do not match a topic' 


    it 'returns a 404 for an ID that is larger than postgres limits' 


    context 'a topic with nil slug exists' do
      before do
        nil_slug_topic = Fabricate(:topic)
        Topic.connection.execute("update topics set slug=null where id = #{nil_slug_topic.id}") # can't find a way to set slug column to null using the model
      end

      it 'returns a 404 when slug and topic id do not match a topic' 

    end

    context 'permission errors' do
      let(:allowed_user) { Fabricate(:user) }
      let(:allowed_group) { Fabricate(:group) }
      let(:secure_category) do
        c = Fabricate(:category)
        c.permissions = [[allowed_group, :full]]
        c.save
        allowed_user.groups = [allowed_group]
        allowed_user.save
        c
      end
      let(:normal_topic) { Fabricate(:topic) }
      let(:secure_topic) { Fabricate(:topic, category: secure_category) }
      let(:private_topic) { Fabricate(:private_message_topic, user: allowed_user) }
      let(:deleted_topic) { Fabricate(:deleted_topic) }
      let(:deleted_secure_topic) { Fabricate(:topic, category: secure_category, deleted_at: 1.day.ago) }
      let(:deleted_private_topic) { Fabricate(:private_message_topic, user: allowed_user, deleted_at: 1.day.ago) }
      let(:nonexist_topic_id) { Topic.last.id + 10000 }

      shared_examples "various scenarios" do |expected|
        expected.each do |key, value|
          it "returns #{value} for #{key}" 

        end
      end

      context 'anonymous' do
        expected = {
          normal_topic: 200,
          secure_topic: 403,
          private_topic: 403,
          deleted_topic: 410,
          deleted_secure_topic: 403,
          deleted_private_topic: 403,
          nonexist: 404
        }
        include_examples "various scenarios", expected
      end

      context 'anonymous with login required' do
        before do
          SiteSetting.login_required = true
        end
        expected = {
          normal_topic: 302,
          secure_topic: 302,
          private_topic: 302,
          deleted_topic: 302,
          deleted_secure_topic: 302,
          deleted_private_topic: 302,
          nonexist: 302
        }
        include_examples "various scenarios", expected
      end

      context 'normal user' do
        before do
          sign_in(Fabricate(:user))
        end

        expected = {
          normal_topic: 200,
          secure_topic: 403,
          private_topic: 403,
          deleted_topic: 410,
          deleted_secure_topic: 403,
          deleted_private_topic: 403,
          nonexist: 404
        }
        include_examples "various scenarios", expected
      end

      context 'allowed user' do
        before do
          sign_in(allowed_user)
        end

        expected = {
          normal_topic: 200,
          secure_topic: 200,
          private_topic: 200,
          deleted_topic: 410,
          deleted_secure_topic: 410,
          deleted_private_topic: 410,
          nonexist: 404
        }
        include_examples "various scenarios", expected
      end

      context 'moderator' do
        before do
          sign_in(Fabricate(:moderator))
        end

        expected = {
          normal_topic: 200,
          secure_topic: 403,
          private_topic: 403,
          deleted_topic: 200,
          deleted_secure_topic: 403,
          deleted_private_topic: 403,
          nonexist: 404
        }
        include_examples "various scenarios", expected
      end

      context 'admin' do
        before do
          sign_in(Fabricate(:admin))
        end

        expected = {
          normal_topic: 200,
          secure_topic: 200,
          private_topic: 200,
          deleted_topic: 200,
          deleted_secure_topic: 200,
          deleted_private_topic: 200,
          nonexist: 404
        }
        include_examples "various scenarios", expected
      end
    end

    it 'records a view' 


    it 'records incoming links' 


    context 'print' do
      it "doesn't renders the print view when disabled" 


      it 'renders the print view when enabled' 


      it "uses the application layout when there's no param" 

    end

    it 'records redirects' 


    it 'tracks a visit for all html requests' 


    context 'consider for a promotion' do
      before do
        SiteSetting.tl1_requires_topics_entered = 0
        SiteSetting.tl1_requires_read_posts = 0
        SiteSetting.tl1_requires_time_spent_mins = 0
        SiteSetting.tl1_requires_time_spent_mins = 0
      end

      it "reviews the user for a promotion if they're new" 

    end

    context 'filters' do
      def extract_post_stream
        json = JSON.parse(response.body)
        json["post_stream"]["posts"].map { |post| post["id"] }
      end

      before do
        TopicView.stubs(:chunk_size).returns(2)
        @post_ids = topic.posts.pluck(:id)
        3.times do
          @post_ids << Fabricate(:post, topic: topic).id
        end
      end

      it 'grabs the correct set of posts' 

    end

    context "when 'login required' site setting has been enabled" do
      before { SiteSetting.login_required = true }

      context 'and the user is logged in' do
        before { sign_in(Fabricate(:coding_horror)) }

        it 'shows the topic' 

      end

      context 'and the user is not logged in' do
        let(:api_key) { topic.user.generate_api_key(topic.user) }

        it 'redirects to the login page' 


        it 'shows the topic if valid api key is provided' 


        it 'returns 403 for an invalid key' 

      end
    end

    it "is included for unlisted topics" 


    it "is not included for normal topics" 


    it "doesn't store an incoming link when there's no referer" 


    it "doesn't raise an error on a very long link" 


    describe "has_escaped_fragment?" do
      context "when the SiteSetting is disabled" do
        it "uses the application layout even with an escaped fragment param" 

      end

      context "when the SiteSetting is enabled" do
        before do
          SiteSetting.enable_escaped_fragments = true
        end

        it "uses the application layout when there's no param" 


        it "uses the crawler layout when there's an _escaped_fragment_ param" 

      end
    end

    describe 'clear_notifications' do
      it 'correctly clears notifications if specified via cookie' 


      it 'correctly clears notifications if specified via header' 

    end

    describe "set_locale" do
      def headers(locale)
        { HTTP_ACCEPT_LANGUAGE: locale }
      end

      context "allow_user_locale disabled" do
        context "accept-language header differs from default locale" do
          before do
            SiteSetting.allow_user_locale = false
            SiteSetting.default_locale = "en"
          end

          context "with an anonymous user" do
            it "uses the default locale" 

          end

          context "with a logged in user" do
            it "it uses the default locale" 

          end
        end
      end

      context "set_locale_from_accept_language_header enabled" do
        context "accept-language header differs from default locale" do
          before do
            SiteSetting.allow_user_locale = true
            SiteSetting.set_locale_from_accept_language_header = true
            SiteSetting.default_locale = "en"
          end

          context "with an anonymous user" do
            it "uses the locale from the headers" 

          end

          context "with a logged in user" do
            it "uses the user's preferred locale" 

          end
        end

        context "the preferred locale includes a region" do
          it "returns the locale and region separated by an underscore" 

        end

        context 'accept-language header is not set' do
          it 'uses the site default locale' 

        end
      end
    end

    describe "read only header" do
      it "returns no read only header by default" 


      it "returns a readonly header if the site is read only" 

    end

    describe "image only topic" do
      it "uses image alt tag for meta description" 

    end
  end

  describe '#post_ids' do
    let(:post) { Fabricate(:post) }
    let(:topic) { post.topic }

    before do
      TopicView.stubs(:chunk_size).returns(1)
    end

    it 'returns the right post ids' 


    describe 'filtering by post number with filters' do
      describe 'username filters' do
        let(:user) { Fabricate(:user) }
        let(:post) { Fabricate(:post, user: user) }
        let!(:post2) { Fabricate(:post, topic: topic, user: user) }
        let!(:post3) { Fabricate(:post, topic: topic) }

        it 'should return the right posts' 

      end

      describe 'summary filter' do
        let!(:post2) { Fabricate(:post, topic: topic, percent_rank: 0.2) }
        let!(:post3) { Fabricate(:post, topic: topic) }

        it 'should return the right posts' 

      end
    end
  end

  describe '#posts' do
    let(:post) { Fabricate(:post) }
    let(:topic) { post.topic }

    it 'returns first post of the topic' 


    describe 'filtering by post number with filters' do
      describe 'username filters' do
        let!(:post2) { Fabricate(:post, topic: topic, user: Fabricate(:user)) }
        let!(:post3) { Fabricate(:post, topic: topic) }

        it 'should return the right posts' 

      end

      describe 'summary filter' do
        let!(:post2) { Fabricate(:post, topic: topic, percent_rank: 0.2) }
        let!(:post3) { Fabricate(:post, topic: topic) }

        it 'should return the right posts' 

      end
    end
  end

  describe '#feed' do
    let(:topic) { Fabricate(:post).topic }

    it 'renders rss of the topic' 


    it 'renders rss of the topic correctly with subfolder' 

  end

  describe '#invite_group' do
    let(:admins) { Group[:admins] }

    let!(:admin) { sign_in(Fabricate(:admin)) }

    before do
      admins.messageable_level = Group::ALIAS_LEVELS[:everyone]
      admins.save!
    end

    it "disallows inviting a group to a topic" 


    it "allows inviting a group to a PM" 

  end

  describe '#make_banner' do
    it 'needs you to be a staff member' 


    describe 'when logged in' do
      it "changes the topic archetype to 'banner'" 

    end
  end

  describe '#remove_banner' do
    it 'needs you to be a staff member' 


    describe 'when logged in' do
      it "resets the topic archetype" 

    end
  end

  describe '#remove_allowed_user' do
    it 'admin can be removed from a pm' 

  end

  describe '#bulk' do
    it 'needs you to be logged in' 


    describe "when logged in" do
      let!(:user) { sign_in(Fabricate(:user)) }
      let(:operation) { { type: 'change_category', category_id: '1' } }
      let(:topic_ids) { [1, 2, 3] }

      it "requires a list of topic_ids or filter" 


      it "requires an operation param" 


      it "requires a type field for the operation param" 


      it "can find unread" 


      it "delegates work to `TopicsBulkAction`" 

    end
  end

  describe '#remove_bookmarks' do
    it "should remove bookmarks properly from non first post" 


    it "should disallow bookmarks on posts you have no access to" 

  end

  describe '#reset_new' do
    let(:user) { sign_in(Fabricate(:user)) }
    it 'needs you to be logged in' 


    it "updates the `new_since` date" 

  end

  describe '#feature_stats' do
    it "works" 


    it "allows unlisted banner topic" 

  end

  describe '#excerpts' do
    it "can correctly get excerpts" 

  end

  describe '#convert_topic' do
    it 'needs you to be logged in' 


    describe 'converting public topic to private message' do
      let(:user) { Fabricate(:user) }
      let(:topic) { Fabricate(:topic, user: user) }

      it "raises an error when the user doesn't have permission to convert topic" 


      context "success" do
        it "returns success" 

      end
    end

    describe 'converting private message to public topic' do
      let(:user) { Fabricate(:user) }
      let(:topic) { Fabricate(:private_message_topic, user: user) }

      it "raises an error when the user doesn't have permission to convert topic" 


      context "success" do
        it "returns success" 

      end
    end
  end

  describe '#timings' do
    let(:post_1) { Fabricate(:post, topic: topic) }

    it 'should record the timing' 

  end

  describe '#timer' do
    context 'when a user is not logged in' do
      it 'should return the right response' 

    end

    context 'when does not have permission' do
      it 'should return the right response' 

    end

    context 'when logged in as an admin' do
      let(:admin) { Fabricate(:admin) }

      before do
        sign_in(admin)
      end

      it 'should be able to create a topic status update' 


      it 'should be able to delete a topic status update' 


      describe 'publishing topic to category in the future' do
        it 'should be able to create the topic status update' 

      end

      describe 'invalid status type' do
        it 'should raise the right error' 

      end
    end
  end

  describe '#invite' do
    describe 'when not logged in' do
      it "should return the right response" 

    end

    describe 'when logged in' do
      before do
        sign_in(user)
      end

      describe 'as a valid user' do
        let(:topic) { Fabricate(:topic, user: user) }

        it 'should return the right response' 

      end

      describe 'when user is a group manager' do
        let(:group) { Fabricate(:group).tap { |g| g.add_owner(user) } }
        let(:private_category)  { Fabricate(:private_category, group: group) }

        let(:group_private_topic) do
          Fabricate(:topic, category: private_category, user: user)
        end

        let(:recipient) { 'jake@adventuretime.ooo' }

        it "should attach group to the invite" 

      end

      describe 'when topic id is invalid' do
        it 'should return the right response' 

      end

      it 'requires an email parameter' 


      describe "when PM has reached maximum allowed numbers of recipients" do
        let(:user2) { Fabricate(:user) }
        let(:pm) { Fabricate(:private_message_topic, user: user) }

        let(:moderator) { Fabricate(:moderator) }
        let(:moderator_pm) { Fabricate(:private_message_topic, user: moderator) }

        before do
          SiteSetting.max_allowed_message_recipients = 2
        end

        it "doesn't allow normal users to invite" 


        it "allows staff to bypass limits" 

      end

      describe 'when user does not have permission to invite to the topic' do
        let(:topic) { Fabricate(:private_message_topic) }

        it "should return the right response" 

      end
    end

    describe "when inviting a group to a topic" do
      let(:group) { Fabricate(:group) }

      before do
        sign_in(Fabricate(:admin))
      end

      it "should work correctly" 

    end
  end

  describe 'invite_group' do
    let(:admins) { Group[:admins] }
    let(:pm) { Fabricate(:private_message_topic) }

    def invite_group(topic, expected_status)
      post "/t/#{topic.id}/invite-group.json", params: { group: admins.name }
      expect(response.status).to eq(expected_status)
    end

    before do
      admins.update!(messageable_level: Group::ALIAS_LEVELS[:everyone])
    end

    describe 'as an anon user' do
      it 'should be forbidden' 

    end

    describe 'as a normal user' do
      let!(:user) { sign_in(Fabricate(:user)) }

      describe 'when user does not have permission to view the topic' do
        it 'should be forbidden' 

      end

      describe 'when user has permission to view the topic' do
        before do
          pm.allowed_users << user
        end

        it 'should allow user to invite group to topic' 

      end
    end

    describe 'as an admin user' do
      let!(:admin) { sign_in(Fabricate(:admin)) }

      it "disallows inviting a group to a topic" 


      it "allows inviting a group to a PM" 

    end

    context "when PM has reached maximum allowed numbers of recipients" do
      let(:group) { Fabricate(:group, messageable_level: 99) }
      let(:pm) { Fabricate(:private_message_topic, user: user) }

      let(:moderator) { Fabricate(:moderator) }
      let(:moderator_pm) { Fabricate(:private_message_topic, user: moderator) }

      before do
        SiteSetting.max_allowed_message_recipients = 2
      end

      it "doesn't allow normal users to invite" 


      it "allows staff to bypass limits" 

    end
  end

  describe 'shared drafts' do
    let(:shared_drafts_category) { Fabricate(:category) }
    let(:category) { Fabricate(:category) }

    before do
      SiteSetting.shared_drafts_category = shared_drafts_category.id
    end

    describe "#update_shared_draft" do
      let(:other_cat) { Fabricate(:category) }
      let(:category) { Fabricate(:category) }
      let(:topic) { Fabricate(:topic, category: shared_drafts_category, visible: false) }

      context "anonymous" do
        it "doesn't allow staff to update the shared draft" 

      end

      context "as a moderator" do
        let(:moderator) { Fabricate(:moderator) }
        before do
          sign_in(moderator)
        end

        context "with a shared draft" do
          let!(:shared_draft) { Fabricate(:shared_draft, topic: topic, category: category) }
          it "allows staff to update the category id" 

        end

        context "without a shared draft" do
          it "allows staff to update the category id" 

        end
      end
    end

    describe "#publish" do
      let(:category) { Fabricate(:category) }
      let(:topic) { Fabricate(:topic, category: shared_drafts_category, visible: false) }
      let(:shared_draft) { Fabricate(:shared_draft, topic: topic, category: category) }
      let(:moderator) { Fabricate(:moderator) }

      it "fails for anonymous users" 


      it "fails as a regular user" 


      context "as staff" do
        before do
          sign_in(moderator)
        end

        it "will publish the topic" 

      end
    end
  end

  describe "crawler" do

    context "when not a crawler" do
      it "renders with the application layout" 

    end

    context "when a crawler" do
      it "renders with the crawler layout, and handles proper pagination" 

    end

  end

  describe "#reset_bump_date" do
    context "errors" do
      let(:topic) { Fabricate(:topic) }

      it "needs you to be logged in" 


      [:user, :trust_level_4].each do |user|
        it "denies access for #{user}" 

      end

      it "should fail for non-existend topic" 

    end

    [:admin, :moderator].each do |user|
      it "should reset bumped_at as #{user}" 

    end
  end
end

