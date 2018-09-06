require 'rails_helper'

def topics_controller_show_gen_perm_tests(expected, ctx)
  expected.each do |sym, status|
    params = "topic_id: #{sym}.id, slug: #{sym}.slug"
    if sym == :nonexist
      params = "topic_id: nonexist_topic_id"
    end

    method = <<~TEXT
    it 'returns #{status} for #{sym}' 

    TEXT

    ctx.instance_eval(method)
  end
end

describe TopicsController do

  context 'wordpress' do
    let!(:user) { log_in(:moderator) }
    let(:p1) { Fabricate(:post, user: user) }
    let(:topic) { p1.topic }
    let!(:p2) { Fabricate(:post, topic: topic, user: user) }

    it "returns the JSON in the format our wordpress plugin needs" 

  end

  context 'move_posts' do
    it 'needs you to be logged in' 


    describe 'moving to a new topic' do
      let(:user) { log_in(:moderator) }
      let(:p1) { Fabricate(:post, user: user, post_number: 1) }
      let(:topic) { p1.topic }

      it "raises an error without post_ids" 


      it "raises an error when the user doesn't have permission to move the posts" 


      it "raises an error when the OP is not a regular post" 


      context 'success' do
        let(:user) { log_in(:admin) }
        let(:p2) { Fabricate(:post, user: user, topic: topic) }

        it "returns success" 


        describe 'when topic has been deleted' do
          it 'should still be able to move posts' 

        end
      end

      context 'failure' do
        let(:p2) { Fabricate(:post, topic: topic, user: user) }

        before do
          Topic.any_instance.expects(:move_posts).with(user, [p2.id], title: 'blah').returns(nil)

          post :move_posts, params: {
            topic_id: topic.id, title: 'blah', post_ids: [p2.id]
          }, format: :json
        end

        it "returns JSON with a false success" 

      end
    end

    describe "moving replied posts" do
      let!(:user) { log_in(:moderator) }
      let!(:p1) { Fabricate(:post, user: user) }
      let!(:topic) { p1.topic }
      let!(:p2) { Fabricate(:post, topic: topic, user: user, reply_to_post_number: p1.post_number) }

      context 'success' do

        before do
          PostReply.create(post_id: p1.id, reply_id: p2.id)
        end

        it "moves the child posts too" 

      end

    end

    describe 'moving to an existing topic' do
      let!(:user) { log_in(:moderator) }
      let(:p1) { Fabricate(:post, user: user) }
      let(:topic) { p1.topic }
      let(:dest_topic) { Fabricate(:topic) }

      context 'success' do
        let(:p2) { Fabricate(:post, user: user) }

        before do
          Topic.any_instance.expects(:move_posts).with(user, [p2.id], destination_topic_id: dest_topic.id).returns(topic)

          post :move_posts, params: {
            topic_id: topic.id,
            post_ids: [p2.id],
            destination_topic_id: dest_topic.id
          }, format: :json
        end

        it "returns success" 

      end

      context 'failure' do
        let(:p2) { Fabricate(:post, user: user) }

        before do
          Topic.any_instance.expects(:move_posts).with(user, [p2.id], destination_topic_id: dest_topic.id).returns(nil)

          post :move_posts, params: {
            topic_id: topic.id,
            destination_topic_id: dest_topic.id,
            post_ids: [p2.id]
          }, format: :json
        end

        it "returns JSON with a false success" 

      end
    end
  end

  context "merge_topic" do
    it 'needs you to be logged in' 


    describe 'moving to a new topic' do
      let!(:user) { log_in(:moderator) }
      let(:p1) { Fabricate(:post, user: user) }
      let(:topic) { p1.topic }

      it "raises an error without destination_topic_id" 


      it "raises an error when the user doesn't have permission to merge" 


      let(:dest_topic) { Fabricate(:topic) }

      context 'moves all the posts to the destination topic' do
        let(:p2) { Fabricate(:post, user: user) }

        before do
          Topic.any_instance.expects(:move_posts).with(user, [p1.id], destination_topic_id: dest_topic.id).returns(topic)

          post :merge_topic, params: {
            topic_id: topic.id, destination_topic_id: dest_topic.id
          }, format: :json
        end

        it "returns success" 

      end

    end

  end

  context 'change_post_owners' do
    it 'needs you to be logged in' 


    describe 'forbidden to moderators' do
      let!(:moderator) { log_in(:moderator) }
      it 'correctly denies' 

    end

    describe 'forbidden to trust_level_4s' do
      let!(:trust_level_4) { log_in(:trust_level_4) }

      it 'correctly denies' 

    end

    describe 'changing ownership' do
      let!(:editor) { log_in(:admin) }
      let(:topic) { Fabricate(:topic) }
      let(:user_a) { Fabricate(:user) }
      let(:p1) { Fabricate(:post, topic_id: topic.id) }
      let(:p2) { Fabricate(:post, topic_id: topic.id) }

      it "raises an error with a parameter missing" 


      it "calls PostOwnerChanger" 


      it "changes multiple posts" 


      it "works with deleted users" 

    end
  end

  context 'change_timestamps' do
    let(:params) { { topic_id: 1, timestamp: Time.zone.now } }

    it 'needs you to be logged in' 


    [:moderator, :trust_level_4].each do |user|
      describe "forbidden to #{user}" do
        let!(user) { log_in(user) }

        it 'correctly denies' 

      end
    end

    describe 'changing timestamps' do
      let!(:admin) { log_in(:admin) }
      let(:old_timestamp) { Time.zone.now }
      let(:new_timestamp) { old_timestamp - 1.day }
      let!(:topic) { Fabricate(:topic, created_at: old_timestamp) }
      let!(:p1) { Fabricate(:post, topic_id: topic.id, created_at: old_timestamp) }
      let!(:p2) { Fabricate(:post, topic_id: topic.id, created_at: old_timestamp + 1.day) }

      it 'raises an error with a missing parameter' 


      it 'should update the timestamps of selected posts' 

    end
  end

  context 'clear_pin' do
    it 'needs you to be logged in' 


    context 'when logged in' do
      let(:topic) { Fabricate(:topic) }
      let!(:user) { log_in }

      it "fails when the user can't see the topic" 


      describe 'when the user can see the topic' do
        it "calls clear_pin_for if the user can see the topic" 


        it "succeeds" 

      end

    end

  end

  context 'status' do
    it 'needs you to be logged in' 


    describe 'when logged in' do
      before do
        @user = log_in(:moderator)
        @topic = Fabricate(:topic, user: @user)
      end

      it "raises an exception if you can't change it" 


      it 'requires the status parameter' 


      it 'requires the enabled parameter' 


      it 'raises an error with a status not in the whitelist' 


      it 'should update the status of the topic correctly' 


    end

  end

  context 'delete_timings' do

    it 'needs you to be logged in' 


    context 'when logged in' do
      before do
        @user = log_in
        @topic = Fabricate(:topic, user: @user)
        @topic_user = TopicUser.get(@topic, @topic.user)
      end

      it 'deletes the forum topic user record' 


    end

  end

  describe 'mute/unmute' do

    it 'needs you to be logged in' 


    it 'needs you to be logged in' 

  end

  describe 'recover' do
    it "won't allow us to recover a topic when we're not logged in" 


    describe 'when logged in' do
      let(:topic) { Fabricate(:topic, user: log_in, deleted_at: Time.now, deleted_by: log_in) }

      describe 'without access' do
        it "raises an exception when the user doesn't have permission to delete the topic" 

      end

      context 'with permission' do
        before do
          Guardian.any_instance.expects(:can_recover_topic?).with(topic).returns(true)
        end

        it 'succeeds' 

      end
    end

  end

  describe 'delete' do
    it "won't allow us to delete a topic when we're not logged in" 


    describe 'when logged in' do
      let(:topic) { Fabricate(:topic, user: log_in) }

      describe 'without access' do
        it "raises an exception when the user doesn't have permission to delete the topic" 

      end

      describe 'with permission' do
        before do
          Guardian.any_instance.expects(:can_delete?).with(topic).returns(true)
        end

        it 'succeeds' 


      end

    end
  end

  describe 'id_for_slug' do
    let(:topic) { Fabricate(:post).topic }

    it "returns JSON for the slug" 


    it "returns invalid access if the user can't see the topic" 

  end

  describe 'show full render' do
    render_views

    it 'correctly renders canoicals' 

  end

  describe 'show unlisted' do
    it 'returns 301 even if slug does not match URL' 

  end

  describe 'show' do

    let(:topic) { Fabricate(:post).topic }
    let!(:p1) { Fabricate(:post, user: topic.user) }
    let!(:p2) { Fabricate(:post, user: topic.user) }

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
        @nil_slug_topic = Fabricate(:topic)
        Topic.connection.execute("update topics set slug=null where id = #{@nil_slug_topic.id}") # can't find a way to set slug column to null using the model
      end

      it 'returns a 404 when slug and topic id do not match a topic' 

    end

    context 'permission errors' do
      let(:allowed_user) { Fabricate(:user) }
      let(:allowed_group) { Fabricate(:group) }
      let(:secure_category) {
        c = Fabricate(:category)
        c.permissions = [[allowed_group, :full]]
        c.save
        allowed_user.groups = [allowed_group]
        allowed_user.save
        c }
      let(:normal_topic) { Fabricate(:topic) }
      let(:secure_topic) { Fabricate(:topic, category: secure_category) }
      let(:private_topic) { Fabricate(:private_message_topic, user: allowed_user) }
      let(:deleted_topic) { Fabricate(:deleted_topic) }
      let(:deleted_secure_topic) { Fabricate(:topic, category: secure_category, deleted_at: 1.day.ago) }
      let(:deleted_private_topic) { Fabricate(:private_message_topic, user: allowed_user, deleted_at: 1.day.ago) }
      let(:nonexist_topic_id) { Topic.last.id + 10000 }

      context 'anonymous' do
        expected = {
          normal_topic: 200,
          secure_topic: 403,
          private_topic: 404,
          deleted_topic: 410,
          deleted_secure_topic: 403,
          deleted_private_topic: 404,
          nonexist: 404
        }
        topics_controller_show_gen_perm_tests(expected, self)
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
        topics_controller_show_gen_perm_tests(expected, self)
      end

      context 'normal user' do
        before do
          log_in(:user)
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
        topics_controller_show_gen_perm_tests(expected, self)
      end

      context 'allowed user' do
        before do
          log_in_user(allowed_user)
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
        topics_controller_show_gen_perm_tests(expected, self)
      end

      context 'moderator' do
        before do
          log_in(:moderator)
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
        topics_controller_show_gen_perm_tests(expected, self)
      end

      context 'admin' do
        before do
          log_in(:admin)
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
        topics_controller_show_gen_perm_tests(expected, self)
      end
    end

    it 'records a view' 


    it 'records incoming links' 


    context 'print' do

      it "doesn't renders the print view when disabled" 


      it 'renders the print view when enabled' 

    end

    it 'records redirects' 


    it 'tracks a visit for all html requests' 


    context 'consider for a promotion' do
      let!(:user) { log_in(:coding_horror) }
      let(:promotion) do
        result = double
        Promotion.stubs(:new).with(user).returns(result)
        result
      end

      it "reviews the user for a promotion if they're new" 

    end

    context 'filters' do

      it 'grabs first page when no filter is provided' 


      it 'grabs first page when first page is provided' 


      it 'grabs correct range when a page number is provided' 


      it 'delegates a post_number param to TopicView#filter_posts_near' 

    end

    context "when 'login required' site setting has been enabled" do
      before { SiteSetting.login_required = true }

      context 'and the user is logged in' do
        before { log_in(:coding_horror) }

        it 'shows the topic' 

      end

      context 'and the user is not logged in' do
        let(:api_key) { topic.user.generate_api_key(topic.user) }

        it 'redirects to the login page' 


        it 'shows the topic if valid api key is provided' 


        it 'returns 403 for an invalid key' 

      end
    end
  end

  describe '#posts' do
    let(:topic) { Fabricate(:post).topic }

    it 'returns first posts of the topic' 

  end

  describe '#feed' do
    let(:topic) { Fabricate(:post).topic }

    it 'renders rss of the topic' 

  end

  describe 'invite_group' do
    let :admins do
      Group[:admins]
    end

    let! :admin do
      log_in :admin
    end

    before do
      admins.messageable_level = Group::ALIAS_LEVELS[:everyone]
      admins.save!
    end

    it "disallows inviting a group to a topic" 


    it "allows inviting a group to a PM" 

  end

  describe 'make_banner' do

    it 'needs you to be a staff member' 


    describe 'when logged in' do

      it "changes the topic archetype to 'banner'" 

    end
  end

  describe 'remove_allowed_user' do
    it 'admin can be removed from a pm' 

  end

  describe 'remove_banner' do

    it 'needs you to be a staff member' 


    describe 'when logged in' do

      it "resets the topic archetype" 


    end

  end

  describe "bulk" do
    it 'needs you to be logged in' 


    describe "when logged in" do
      let!(:user) { log_in }
      let(:operation) { { type: 'change_category', category_id: '1' } }
      let(:topic_ids) { [1, 2, 3] }

      it "requires a list of topic_ids or filter" 


      it "requires an operation param" 


      it "requires a type field for the operation param" 


      it "can find unread" 


      it "delegates work to `TopicsBulkAction`" 

    end
  end

  describe 'remove_bookmarks' do
    it "should remove bookmarks properly from non first post" 


    it "should disallow bookmarks on posts you have no access to" 

  end

  describe 'reset_new' do
    it 'needs you to be logged in' 


    let(:user) { log_in(:user) }

    it "updates the `new_since` date" 


  end

  describe "feature_stats" do
    it "works" 


    it "allows unlisted banner topic" 

  end

  describe "x-robots-tag" do
    it "is included for unlisted topics" 

    it "is not included for normal topics" 

  end

  context "excerpts" do

    it "can correctly get excerpts" 


  end

  context "convert_topic" do
    it 'needs you to be logged in' 


    describe 'converting public topic to private message' do
      let(:user) { Fabricate(:user) }
      let(:topic) { Fabricate(:topic, user: user) }

      it "raises an error when the user doesn't have permission to convert topic" 


      context "success" do
        before do
          admin = log_in(:admin)
          Topic.any_instance.expects(:convert_to_private_message).with(admin).returns(topic)

          put :convert_topic, params: {
            id: topic.id, type: "private"
          }, format: :json
        end

        it "returns success" 

      end
    end

    describe 'converting private message to public topic' do
      let(:user) { Fabricate(:user) }
      let(:topic) { Fabricate(:topic, user: user) }

      it "raises an error when the user doesn't have permission to convert topic" 


      context "success" do
        before do
          admin = log_in(:admin)
          Topic.any_instance.expects(:convert_to_public_topic).with(admin).returns(topic)

          put :convert_topic, params: {
            id: topic.id, type: "public"
          }, format: :json
        end

        it "returns success" 

      end
    end
  end

end

