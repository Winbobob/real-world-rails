require 'rails_helper';

require 'guardian'
require_dependency 'post_destroyer'
require_dependency 'post_locker'

describe Guardian do

  let(:user) { Fabricate(:user) }
  let(:moderator) { Fabricate(:moderator) }
  let(:admin) { Fabricate(:admin) }
  let(:trust_level_2) { build(:user, trust_level: 2) }
  let(:trust_level_3) { build(:user, trust_level: 3) }
  let(:trust_level_4)  { build(:user, trust_level: 4) }
  let(:another_admin) { build(:admin) }
  let(:coding_horror) { build(:coding_horror) }

  let(:topic) { build(:topic, user: user) }
  let(:post) { build(:post, topic: topic, user: topic.user) }

  it 'can be created without a user (not logged in)' 


  it 'can be instantiated with a user instance' 


  describe "link_posting_access" do
    it "is none for anonymous users" 


    it "is full for regular users" 


    it "is none for a user of a low trust level" 


    it "is limited for a user of a low trust level with a whitelist" 

  end

  describe "can_post_link?" do
    let(:host) { "discourse.org" }

    it "returns false for anonymous users" 


    it "returns true for a regular user" 


    it "supports customization by site setting" 


    describe "whitelisted host" do
      before do
        SiteSetting.whitelisted_link_domains = host
      end

      it "allows a new user to post the link to the host" 

    end
  end

  describe '#post_can_act?' do
    let(:post) { build(:post) }
    let(:user) { build(:user) }

    it "returns false when the user is nil" 


    it "returns false when the post is nil" 


    it "returns false when the topic is archived" 


    it "returns false when the post is deleted" 


    it "works as expected for silenced users" 


    it "allows flagging archived posts" 


    it "allows flagging of staff posts when allow_flagging_staff is true" 


    describe 'when allow_flagging_staff is false' do
      let(:staff_post) { Fabricate(:post, user: Fabricate(:moderator)) }

      before do
        SiteSetting.allow_flagging_staff = false
      end

      it "doesn't allow flagging of staff posts" 


      it "allows flagging of staff posts when staff has been deleted" 


      it "allows liking of staff" 

    end

    it "returns false when liking yourself" 


    it "returns false when you've already done it" 


    it "returns false when you already flagged a post" 


    it "returns false for notify_user if private messages are disabled" 


    it "returns false for notify_user and notify_moderators if private messages are enabled but threshold not met" 


    describe "trust levels" do
      it "returns true for a new user liking something" 


      it "returns false for a new user flagging as spam" 


      it "returns true for a new user flagging as spam if enabled" 


      it "returns true for a new user flagging a private message as spam" 


      it "returns false for a new user flagging something as off topic" 


      it "returns false for a new user flagging with notify_user" 

    end
  end

  describe "can_enable_safe_mode" do
    let(:user) { Fabricate.build(:user) }
    let(:moderator) { Fabricate.build(:moderator) }

    context "when enabled" do
      before do
        SiteSetting.enable_safe_mode = true
      end

      it "can be performed" 

    end

    context "when disabled" do
      before do
        SiteSetting.enable_safe_mode = false
      end

      it "can be performed" 

    end
  end

  describe "can_defer_flags" do
    let(:post) { Fabricate(:post) }
    let(:user) { post.user }
    let(:moderator) { Fabricate(:moderator) }

    it "returns false when the user is nil" 


    it "returns false when the post is nil" 


    it "returns false when the user is not a moderator" 


    it "returns true when the user is a moderator" 


  end

  describe 'can_send_private_message' do
    let(:user) { Fabricate(:user) }
    let(:another_user) { Fabricate(:user) }
    let(:suspended_user) { Fabricate(:user, suspended_till: 1.week.from_now, suspended_at: 1.day.ago) }

    it "returns false when the user is nil" 


    it "returns false when the target user is nil" 


    it "returns true when the target is the same as the user" 


    it "returns false when you are untrusted" 


    it "returns true to another user" 


    it "disallows pms to other users if trust level is not met" 


    context "enable_personal_messages is false" do
      before { SiteSetting.enable_personal_messages = false }

      it "returns false if user is not staff member" 


      it "returns true for staff member" 

    end

    context "target user is suspended" do
      it "returns true for staff" 


      it "returns false for regular users" 

    end

    context "author is silenced" do
      before do
        user.silenced_till = 1.year.from_now
        user.save
      end

      it "returns true if target is staff" 


      it "returns false if target is not staff" 


      it "returns true if target is a staff group" 

    end

    it "respects the group's messageable_level" 


    context 'target user has private message disabled' do
      before do
        another_user.user_option.update!(allow_private_messages: false)
      end

      context 'for a normal user' do
        it 'should return false' 

      end

      context 'for a staff user' do
        it 'should return true' 

      end
    end
  end

  describe 'can_reply_as_new_topic' do
    let(:user) { Fabricate(:user) }
    let(:topic) { Fabricate(:topic) }
    let(:private_message) { Fabricate(:private_message_topic) }

    it "returns false for a non logged in user" 


    it "returns false for a nil topic" 


    it "returns false for an untrusted user" 


    it "returns true for a trusted user" 


    it "returns true for a private message" 

  end

  describe 'can_see_post_actors?' do

    let(:topic) { Fabricate(:topic, user: coding_horror) }

    it 'displays visibility correctly' 


  end

  describe 'can_impersonate?' do
    it 'allows impersonation correctly' 

  end

  describe "can_view_action_logs?" do
    it 'is false for non-staff acting user' 


    it 'is false without a target user' 


    it 'is true when target user is present' 

  end

  describe 'can_invite_to_forum?' do
    let(:user) { Fabricate.build(:user) }
    let(:moderator) { Fabricate.build(:moderator) }

    it "doesn't allow anonymous users to invite" 


    it 'returns true when the site requires approving users and is mod' 


    it 'returns false when max_invites_per_day is 0' 


    it 'returns false when the site requires approving users and is regular' 


    it 'returns false when the local logins are disabled' 


    context 'with groups' do
      let(:group) { Fabricate(:group) }
      let(:another_group) { Fabricate(:group) }
      let(:groups) { [group, another_group] }

      before do
        user.update!(trust_level: TrustLevel[2])
        group.add_owner(user)
      end

      it 'returns false when user is not allowed to edit a group' 


      it 'returns true when user is allowed to edit groups' 

    end
  end

  describe 'can_invite_to?' do

    describe "regular topics" do
      let(:group) { Fabricate(:group) }
      let(:category) { Fabricate(:category, read_restricted: true) }
      let(:topic) { Fabricate(:topic) }
      let(:private_topic) { Fabricate(:topic, category: category) }
      let(:user) { topic.user }
      let(:moderator) { Fabricate(:moderator) }
      let(:admin) { Fabricate(:admin) }
      let(:private_category)  { Fabricate(:private_category, group: group) }
      let(:group_private_topic) { Fabricate(:topic, category: private_category) }
      let(:group_owner) { group_private_topic.user.tap { |u| group.add_owner(u) } }
      let(:pm) { Fabricate(:topic) }

      it 'handles invitation correctly' 


      it 'returns false for normal user on private topic' 


      it 'returns true for admin on private topic' 


      it 'returns true for a group owner' 


      it 'returns true for normal user when inviting to topic and PM disabled' 

    end

    describe "private messages" do
      let(:user) { Fabricate(:user, trust_level: TrustLevel[2]) }
      let!(:pm) { Fabricate(:private_message_topic, user: user) }
      let(:admin) { Fabricate(:admin) }
      let(:moderator) { Fabricate(:moderator) }

      context "when private messages are disabled" do
        it "allows an admin to invite to the pm" 

      end

      context "when private messages are disabled" do
        before do
          SiteSetting.enable_personal_messages = false
        end

        it "doesn't allow a regular user to invite" 

      end

      context "when PM has receached the maximum number of recipients" do
        before do
          SiteSetting.max_allowed_message_recipients = 2
        end

        it "doesn't allow a regular user to invite" 


        it "allows staff to invite" 

      end
    end
  end

  describe 'can_invite_via_email?' do
    it 'returns true for all (tl2 and above) users when sso is disabled, local logins are enabled, user approval is not required' 


    it 'returns false for all users when sso is enabled' 


    it 'returns false for all users when local logins are disabled' 


    it 'returns correct valuse when user approval is required' 

  end

  describe 'can_see?' do

    it 'returns false with a nil object' 


    describe 'a Category' do

      it 'allows public categories' 


      it 'correctly handles secure categories' 


      it 'allows members of an authorized group' 


    end

    describe 'a Topic' do
      it 'allows non logged in users to view topics' 


      it 'correctly handles groups' 


      it "restricts deleted topics" 


      it "restricts private topics" 


      it "restricts private deleted topics" 


      it "restricts static doc topics" 


      it "allows moderators to see a flagged private message" 

    end

    describe 'a Post' do
      let(:another_admin) { Fabricate(:admin) }
      it 'correctly handles post visibility' 


      it 'respects whispers' 

    end

    describe 'a PostRevision' do
      let(:post_revision) { Fabricate(:post_revision) }

      context 'edit_history_visible_to_public is true' do
        before { SiteSetting.edit_history_visible_to_public = true }

        it 'is false for nil' 


        it 'is true if not logged in' 


        it 'is true when logged in' 

      end

      context 'edit_history_visible_to_public is false' do
        before { SiteSetting.edit_history_visible_to_public = false }

        it 'is true for staff' 


        it 'is true for trust level 4' 


        it 'is false for trust level lower than 4' 

      end
    end
  end

  describe 'can_create?' do

    describe 'a Category' do

      it 'returns false when not logged in' 


      it 'returns false when a regular user' 


      it 'returns false when a moderator' 


      it 'returns true when an admin' 

    end

    describe 'a Topic' do
      it 'does not allow moderators to create topics in readonly categories' 


      it 'should check for full permissions' 


      it "is true for new users by default" 


      it "is false if user has not met minimum trust level" 


      it "is true if user has met or exceeded the minimum trust level" 

    end

    describe 'a Post' do

      it "is false on readonly categories" 


      it "is false when not logged in" 


      it 'is true for a regular user' 


      it "is false when you can't see the topic" 


      context 'closed topic' do
        before do
          topic.closed = true
        end

        it "doesn't allow new posts from regular users" 


        it 'allows editing of posts' 


        it "allows new posts from moderators" 


        it "allows new posts from admins" 


        it "allows new posts from trust_level_4s" 

      end

      context 'archived topic' do
        before do
          topic.archived = true
        end

        context 'regular users' do
          it "doesn't allow new posts from regular users" 


          it 'does not allow editing of posts' 

        end

        it "allows new posts from moderators" 


        it "allows new posts from admins" 

      end

      context "trashed topic" do
        before do
          topic.deleted_at = Time.now
        end

        it "doesn't allow new posts from regular users" 


        it "doesn't allow new posts from moderators users" 


        it "doesn't allow new posts from admins" 

      end

      context "system message" do
        let(:private_message) {
          Fabricate(
            :topic,
            archetype: Archetype.private_message,
            subtype: 'system_message',
            category_id: nil
          )
        }

        before { user.save! }
        it "allows the user to reply to system messages" 


      end

      context "private message" do
        let(:private_message) { Fabricate(:topic, archetype: Archetype.private_message, category_id: nil) }

        before { user.save! }

        it "allows new posts by people included in the pm" 


        it "doesn't allow new posts by people not invited to the pm" 


        it "allows new posts from silenced users included in the pm" 


        it "doesn't allow new posts from silenced users not invited to the pm" 

      end
    end # can_create? a Post

  end

  describe 'post_can_act?' do

    it "isn't allowed on nil" 


    describe 'a Post' do

      let (:guardian) do
        Guardian.new(user)
      end

      it "isn't allowed when not logged in" 


      it "is allowed as a regular user" 


      it "isn't allowed on archived topics" 

    end
  end

  describe "can_recover_topic?" do

    it "returns false for a nil user" 


    it "returns false for a nil object" 


    it "returns false for a regular user" 


    context 'as a moderator' do
      before do
        topic.save!
        post.save!
      end

      describe 'when post has been deleted' do
        it "should return the right value" 

      end

      describe "when post's user has been deleted" do
        it 'should return the right value' 

      end
    end
  end

  describe "can_recover_post?" do

    it "returns false for a nil user" 


    it "returns false for a nil object" 


    it "returns false for a regular user" 


    context 'as a moderator' do
      let(:other_post) { Fabricate(:post, topic: topic, user: topic.user) }

      before do
        topic.save!
        post.save!
      end

      describe 'when post has been deleted' do
        it "should return the right value" 


        describe "when post's user has been deleted" do
          it 'should return the right value' 

        end
      end
    end

  end

  context 'can_convert_topic?' do
    it 'returns false with a nil object' 


    it 'returns false when not logged in' 


    it 'returns false when not staff' 


    it 'returns false for category definition topics' 


    it 'returns true when a moderator' 


    it 'returns true when an admin' 


    it 'returns false when personal messages are disabled' 

  end

  describe 'can_edit?' do

    it 'returns false with a nil object' 


    describe 'a Post' do

      it 'returns false for silenced users' 


      it 'returns false when not logged in' 


      it 'returns false when not logged in also for wiki post' 


      it 'returns true if you want to edit your own post' 


      it 'returns false if you try to edit a locked post' 


      it "returns false if the post is hidden due to flagging and it's too soon" 


      it "returns true if the post is hidden due to flagging and it been enough time" 


      it "returns true if the post is hidden, it's been enough time and the edit window has expired" 


      it "returns true if the post is hidden due to flagging and it's got a nil `hidden_at`" 


      it 'returns false if you are trying to edit a post you soft deleted' 


      it 'returns false if another regular user tries to edit a soft deleted wiki post' 


      it 'returns false if you are trying to edit a deleted post' 


      it 'returns false if another regular user tries to edit a deleted wiki post' 


      it 'returns false if another regular user tries to edit your post' 


      it 'returns true if another regular user tries to edit wiki post' 


      it "returns false if a wiki but the user can't create a post" 


      it 'returns true as a moderator' 


      it 'returns true as a moderator, even if locked' 


      it 'returns true as an admin' 


      it 'returns true as a trust level 4 user' 


      it 'returns false as a TL4 user if trusted_users_can_edit_others is true' 


      it 'returns false when trying to edit a post with no trust' 


      it 'returns true when trying to edit a post with trust' 


      it 'returns false when another user has too low trust level to edit wiki post' 


      it 'returns true when another user has adequate trust level to edit wiki post' 


      it 'returns true for post author even when he has too low trust level to edit wiki post' 


      context 'post is older than post_edit_time_limit' do
        let(:old_post) { build(:post, topic: topic, user: topic.user, created_at: 6.minutes.ago) }

        before do
          SiteSetting.post_edit_time_limit = 5
        end

        it 'returns false to the author of the post' 


        it 'returns true as a moderator' 


        it 'returns true as an admin' 


        it 'returns false for another regular user trying to edit your post' 


        it 'returns true for another regular user trying to edit a wiki post' 

      end

      context "first post of a static page doc" do
        let!(:tos_topic) { Fabricate(:topic, user: Discourse.system_user) }
        let!(:tos_first_post) { build(:post, topic: tos_topic, user: tos_topic.user) }
        before { SiteSetting.tos_topic_id = tos_topic.id }

        it "restricts static doc posts" 

      end
    end

    describe 'a Topic' do

      it 'returns false when not logged in' 


      it 'returns true for editing your own post' 


      it 'returns false as a regular user' 


      context 'not archived' do
        it 'returns true as a moderator' 


        it 'returns true as an admin' 


        it 'returns true at trust level 3' 


        it 'is false at TL3, if `trusted_users_can_edit_others` is false' 


        it "returns false when the category is read only" 


        it "returns false for trust level 3 if category is secured" 

      end

      context 'private message' do
        it 'returns false at trust level 3' 


        it 'returns false at trust level 4' 

      end

      context 'archived' do
        let(:archived_topic) { build(:topic, user: user, archived: true) }

        it 'returns true as a moderator' 


        it 'returns true as an admin' 


        it 'returns true at trust level 4' 


        it 'is false at TL4, if `trusted_users_can_edit_others` is false' 


        it 'returns false at trust level 3' 


        it 'returns false as a topic creator' 

      end

      context 'very old' do
        let(:old_topic) { build(:topic, user: user, created_at: 6.minutes.ago) }

        before { SiteSetting.post_edit_time_limit = 5 }

        it 'returns true as a moderator' 


        it 'returns true as an admin' 


        it 'returns true at trust level 3' 


        it 'returns false as a topic creator' 

      end
    end

    describe 'a Category' do

      let(:category) { Fabricate(:category) }

      it 'returns false when not logged in' 


      it 'returns false as a regular user' 


      it 'returns false as a moderator' 


      it 'returns true as an admin' 

    end

    describe 'a User' do

      it 'returns false when not logged in' 


      it 'returns false as a different user' 


      it 'returns true when trying to edit yourself' 


      it 'returns true as a moderator' 


      it 'returns true as an admin' 

    end

  end

  context 'can_moderate?' do

    it 'returns false with a nil object' 


    context 'when user is silenced' do
      it 'returns false' 

    end

    context 'a Topic' do

      it 'returns false when not logged in' 


      it 'returns false when not a moderator' 


      it 'returns true when a moderator' 


      it 'returns true when an admin' 


      it 'returns true when trust level 4' 


    end

  end

  context 'can_see_flags?' do

    it "returns false when there is no post" 


    it "returns false when there is no user" 


    it "allow regular users to see flags" 


    it "allows moderators to see flags" 


    it "allows moderators to see flags" 

  end

  context 'can_move_posts?' do

    it 'returns false with a nil object' 


    context 'a Topic' do

      it 'returns false when not logged in' 


      it 'returns false when not a moderator' 


      it 'returns true when a moderator' 


      it 'returns true when an admin' 


    end

  end

  context 'can_delete?' do

    it 'returns false with a nil object' 


    context 'a Topic' do
      before do
        # pretend we have a real topic
        topic.id = 9999999
      end

      it 'returns false when not logged in' 


      it 'returns false when not a moderator' 


      it 'returns true when a moderator' 


      it 'returns true when an admin' 


      it 'returns false for static doc topics' 

    end

    context 'a Post' do

      before do
        post.post_number = 2
      end

      it 'returns false when not logged in' 


      it "returns false when trying to delete your own post that has already been deleted" 


      it 'returns true when trying to delete your own post' 


      it "returns false when trying to delete another user's own post" 


      it "returns false when it's the OP, even as a moderator" 


      it 'returns true when a moderator' 


      it 'returns true when an admin' 


      it 'returns false when post is first in a static doc topic' 


      context 'the topic is archived' do
        before do
          post.topic.archived = true
        end

        it "allows a staff member to delete it" 


        it "doesn't allow a regular user to delete it" 


      end

    end

    context 'a Category' do

      let(:category) { build(:category, user: moderator) }

      it 'returns false when not logged in' 


      it 'returns false when a regular user' 


      it 'returns false when a moderator' 


      it 'returns true when an admin' 


      it "can't be deleted if it has a forum topic" 


      it "can't be deleted if it is the Uncategorized Category" 


      it "can't be deleted if it has children" 


    end

    context 'can_suspend?' do
      it 'returns false when a user tries to suspend another user' 


      it 'returns true when an admin tries to suspend another user' 


      it 'returns true when a moderator tries to suspend another user' 


      it 'returns false when staff tries to suspend staff' 

    end

    context 'a PostAction' do
      let(:post_action) {
        user.id = 1
        post.id = 1

        a = PostAction.new(user: user, post: post, post_action_type_id: 1)
        a.created_at = 1.minute.ago
        a
      }

      it 'returns false when not logged in' 


      it 'returns false when not the user who created it' 


      it "returns false if the window has expired" 


      it "returns true if it's yours" 


    end

  end

  context 'can_approve?' do

    it "wont allow a non-logged in user to approve" 


    it "wont allow a non-admin to approve a user" 


    it "returns false when the user is already approved" 


    it "returns false when the user is not active" 


    it "allows an admin to approve a user" 


    it "allows a moderator to approve a user" 


  end

  context 'can_grant_admin?' do
    it "wont allow a non logged in user to grant an admin's access" 


    it "wont allow a regular user to revoke an admin's access" 


    it 'wont allow an admin to grant their own access' 


    it "allows an admin to grant a regular user access" 


    it 'should not allow an admin to grant admin access to a non real user' 

  end

  context 'can_revoke_admin?' do
    it "wont allow a non logged in user to revoke an admin's access" 


    it "wont allow a regular user to revoke an admin's access" 


    it 'wont allow an admin to revoke their own access' 


    it "allows an admin to revoke another admin's access" 


    it "should not allow an admin to revoke a no real user's admin access" 

  end

  context 'can_grant_moderation?' do

    it "wont allow a non logged in user to grant an moderator's access" 


    it "wont allow a regular user to revoke an moderator's access" 


    it 'will allow an admin to grant their own moderator access' 


    it 'wont allow an admin to grant it to an already moderator' 


    it "allows an admin to grant a regular user access" 


    it "should not allow an admin to grant moderation to a non real user" 

  end

  context 'can_revoke_moderation?' do
    it "wont allow a non logged in user to revoke an moderator's access" 


    it "wont allow a regular user to revoke an moderator's access" 


    it 'wont allow a moderator to revoke their own moderator' 


    it "allows an admin to revoke a moderator's access" 


    it "allows an admin to revoke a moderator's access from self" 


    it "does not allow revoke from non moderators" 


    it "should not allow an admin to revoke moderation from a non real user" 

  end

  context "can_see_invite_details?" do

    it 'is false without a logged in user' 


    it 'is false without a user to look at' 


    it 'is true when looking at your own invites' 

  end

  context "can_access_forum?" do

    let(:unapproved_user) { Fabricate.build(:user) }

    context "when must_approve_users is false" do
      before do
        SiteSetting.must_approve_users = false
      end

      it "returns true for a nil user" 


      it "returns true for an unapproved user" 

    end

    context 'when must_approve_users is true' do
      before do
        SiteSetting.must_approve_users = true
      end

      it "returns false for a nil user" 


      it "returns false for an unapproved user" 


      it "returns true for an admin user" 


      it "returns true for an approved user" 


    end

  end

  describe "can_delete_user?" do
    it "is false without a logged in user" 


    it "is false without a user to look at" 


    it "is false for regular users" 


    context "delete myself" do
      let(:myself) { Fabricate(:user, created_at: 6.months.ago) }
      subject      { Guardian.new(myself).can_delete_user?(myself) }

      it "is true to delete myself and I have never made a post" 


      it "is true to delete myself and I have only made 1 post" 


      it "is false to delete myself and I have made 2 posts" 

    end

    shared_examples "can_delete_user examples" do
      it "is true if user is not an admin and has never posted" 


      it "is true if user is not an admin and first post is not too old" 


      it "is false if user is an admin" 


      it "is false if user's first post is too old" 

    end

    shared_examples "can_delete_user staff examples" do
      it "is true if posts are less than or equal to 5" 

    end

    context "for moderators" do
      let(:actor) { moderator }
      include_examples "can_delete_user examples"
      include_examples "can_delete_user staff examples"
    end

    context "for admins" do
      let(:actor) { admin }
      include_examples "can_delete_user examples"
      include_examples "can_delete_user staff examples"
    end
  end

  describe "can_delete_all_posts?" do
    it "is false without a logged in user" 


    it "is false without a user to look at" 


    it "is false for regular users" 


    shared_examples "can_delete_all_posts examples" do
      it "is true if user has no posts" 


      it "is true if user's first post is newer than delete_user_max_post_age days old" 


      it "is false if user's first post is older than delete_user_max_post_age days old" 


      it "is false if user is an admin" 


      it "is true if number of posts is small" 


      it "is false if number of posts is not small" 

    end

    context "for moderators" do
      let(:actor) { moderator }
      include_examples "can_delete_all_posts examples"
    end

    context "for admins" do
      let(:actor) { admin }
      include_examples "can_delete_all_posts examples"
    end
  end

  describe "can_anonymize_user?" do
    it "is false without a logged in user" 


    it "is false without a user to look at" 


    it "is false for a regular user" 


    it "is false for myself" 


    it "is true for admin anonymizing a regular user" 


    it "is true for moderator anonymizing a regular user" 


    it "is false for admin anonymizing an admin" 


    it "is false for admin anonymizing a moderator" 


    it "is false for moderator anonymizing an admin" 


    it "is false for moderator anonymizing a moderator" 

  end

  describe 'can_grant_title?' do
    it 'is false without a logged in user' 


    it 'is false for regular users' 


    it 'is true for moderators' 


    it 'is true for admins' 


    it 'is false without a user to look at' 


    context 'with title argument' do
      let(:title_badge) { Fabricate(:badge, name: 'Helper', allow_title: true) }
      let(:no_title_badge) { Fabricate(:badge, name: 'Writer', allow_title: false) }
      let(:group) { Fabricate(:group, title: 'Groupie') }

      it 'returns true if title belongs to a badge that user has' 


      it "returns false if title belongs to a badge that user doesn't have" 


      it "returns false if title belongs to a badge that user has but can't be used as a title" 


      it 'returns true if title is from a group the user belongs to' 


      it "returns false if title is from a group the user doesn't belong to" 


      it "returns true if the title is set to an empty string" 

    end
  end

  describe 'can_change_trust_level?' do

    it 'is false without a logged in user' 


    it 'is false for regular users' 


    it 'is true for moderators' 


    it 'is true for admins' 

  end

  describe "can_edit_username?" do
    it "is false without a logged in user" 


    it "is false for regular users to edit another user's username" 


    shared_examples "staff can always change usernames" do
      it "is true for moderators" 


      it "is true for admins" 

    end

    context 'for a new user' do
      let(:target_user) { Fabricate(:user, created_at: 1.minute.ago) }
      include_examples "staff can always change usernames"

      it "is true for the user to change their own username" 

    end

    context 'for an old user' do
      before do
        SiteSetting.username_change_period = 3
      end

      let(:target_user) { Fabricate(:user, created_at: 4.days.ago) }

      context 'with no posts' do
        include_examples "staff can always change usernames"
        it "is true for the user to change their own username" 

      end

      context 'with posts' do
        before { target_user.stubs(:post_count).returns(1) }
        include_examples "staff can always change usernames"
        it "is false for the user to change their own username" 

      end
    end

    context 'when editing is disabled in preferences' do
      before do
        SiteSetting.username_change_period = 0
      end

      include_examples "staff can always change usernames"

      it "is false for the user to change their own username" 

    end

    context 'when SSO username override is active' do
      before do
        SiteSetting.sso_url = "https://www.example.com/sso"
        SiteSetting.enable_sso = true
        SiteSetting.sso_overrides_username = true
      end

      it "is false for admins" 


      it "is false for moderators" 


      it "is false for users" 

    end
  end

  describe "can_edit_email?" do
    context 'when allowed in settings' do
      before do
        SiteSetting.email_editable = true
      end

      it "is false when not logged in" 


      it "is false for regular users to edit another user's email" 


      it "is true for a regular user to edit their own email" 


      it "is true for moderators" 


      it "is true for admins" 

    end

    context 'when not allowed in settings' do
      before do
        SiteSetting.email_editable = false
      end

      it "is false when not logged in" 


      it "is false for regular users to edit another user's email" 


      it "is false for a regular user to edit their own email" 


      it "is false for admins" 


      it "is false for moderators" 

    end

    context 'when SSO email override is active' do
      before do
        SiteSetting.email_editable = false
        SiteSetting.sso_url = "https://www.example.com/sso"
        SiteSetting.enable_sso = true
        SiteSetting.sso_overrides_email = true
      end

      it "is false for admins" 


      it "is false for moderators" 


      it "is false for users" 

    end
  end

  describe 'can_edit_name?' do
    it 'is false without a logged in user' 


    it "is false for regular users to edit another user's name" 


    context 'for a new user' do
      let(:target_user) { build(:user, created_at: 1.minute.ago) }

      it 'is true for the user to change their own name' 


      it 'is true for moderators' 


      it 'is true for admins' 

    end

    context 'when name is disabled in preferences' do
      before do
        SiteSetting.enable_names = false
      end

      it 'is false for the user to change their own name' 


      it 'is false for moderators' 


      it 'is false for admins' 

    end

    context 'when name is enabled in preferences' do
      before do
        SiteSetting.enable_names = true
      end

      context 'when SSO is disabled' do
        before do
          SiteSetting.enable_sso = false
          SiteSetting.sso_overrides_name = false
        end

        it 'is true for admins' 


        it 'is true for moderators' 


        it 'is true for users' 

      end

      context 'when SSO is enabled' do
        before do
          SiteSetting.sso_url = "https://www.example.com/sso"
          SiteSetting.enable_sso = true
        end

        context 'when SSO name override is active' do
          before do
            SiteSetting.sso_overrides_name = true
          end

          it 'is false for admins' 


          it 'is false for moderators' 


          it 'is false for users' 

        end

        context 'when SSO name override is not active' do
          before do
            SiteSetting.sso_overrides_name = false
          end

          it 'is true for admins' 


          it 'is true for moderators' 


          it 'is true for users' 

        end
      end
    end
  end

  describe '#can_export_entity?' do
    let(:user_guardian) { Guardian.new(user) }
    let(:moderator_guardian) { Guardian.new(moderator) }
    let(:admin_guardian) { Guardian.new(admin) }

    it 'only allows admins to export user_list' 


    it 'allow moderators to export other admin entities' 

  end

  describe "#allow_themes?" do
    let(:theme) { Fabricate(:theme) }
    let(:theme2) { Fabricate(:theme) }

    it "allows staff to use any themes" 


    it "only allows normal users to use user-selectable themes or default theme" 


    it "allows child themes to be only used with their parent" 

  end

  describe 'can_wiki?' do
    let(:post) { build(:post, created_at: 1.minute.ago) }

    it 'returns false for regular user' 


    it "returns false when user does not satisfy trust level but owns the post" 


    it "returns false when user satisfies trust level but tries to wiki someone else's post" 


    it 'returns true when user satisfies trust level and owns the post' 


    it 'returns true for admin user' 


    it 'returns true for trust_level_4 user' 


    context 'post is older than post_edit_time_limit' do
      let(:old_post) { build(:post, user: trust_level_2, created_at: 6.minutes.ago) }
      before do
        SiteSetting.min_trust_to_allow_self_wiki = 2
        SiteSetting.post_edit_time_limit = 5
      end

      it 'returns false when user satisfies trust level and owns the post' 


      it 'returns true for admin user' 


      it 'returns true for trust_level_4 user' 

    end
  end

  describe "Tags" do
    context "tagging disabled" do
      before do
        SiteSetting.tagging_enabled = false
      end

      it "can_create_tag returns false" 


      it "can_admin_tags returns false" 


      it "can_admin_tag_groups returns false" 

    end

    context "tagging is enabled" do
      before do
        SiteSetting.tagging_enabled = true
        SiteSetting.min_trust_level_to_tag_topics = 1
      end

      context 'min_trust_to_create_tag is 3' do
        before do
          SiteSetting.min_trust_to_create_tag = 3
        end

        describe "can_create_tag" do
          it "returns false if trust level is too low" 


          it "returns true if trust level is high enough" 


          it "returns true for staff" 

        end

        describe "can_tag_topics" do
          it "returns false if trust level is too low" 


          it "returns true if trust level is high enough" 


          it "returns true for staff" 

        end
      end

      context 'min_trust_to_create_tag is "staff"' do
        before do
          SiteSetting.min_trust_to_create_tag = 'staff'
        end

        it "returns false if not staff" 


        it "returns true if staff" 

      end

      context 'min_trust_to_create_tag is "admin"' do
        before do
          SiteSetting.min_trust_to_create_tag = 'admin'
        end

        it "returns false if not admin" 


        it "returns true if admin" 

      end
    end
  end

  describe(:can_see_group) do
    it 'Correctly handles owner visibile groups' 


    it 'Correctly handles staff visibile groups' 


    it 'Correctly handles member visibile groups' 


    it 'Correctly handles public groups' 


  end

  context 'topic featured link category restriction' do
    before { SiteSetting.topic_featured_link_enabled = true }
    let(:guardian) { Guardian.new }
    let(:uncategorized) { Category.find(SiteSetting.uncategorized_category_id) }

    context "uncategorized" do
      let!(:link_category) { Fabricate(:link_category) }

      it "allows featured links if uncategorized allows it" 


      it "forbids featured links if uncategorized forbids it" 

    end

    context 'when exist' do
      let!(:category) { Fabricate(:category, topic_featured_link_allowed: false) }
      let!(:link_category) { Fabricate(:link_category) }

      it 'returns true if the category is listed' 


      it 'returns false if the category does not allow it' 

    end
  end

  context "suspension reasons" do
    let(:user) { Fabricate(:user) }

    it "will be shown by default" 


    context "with hide suspension reason enabled" do
      let(:moderator) { Fabricate(:moderator) }

      before do
        SiteSetting.hide_suspension_reasons = true
      end

      it "will not be shown to anonymous users" 


      it "users can see their own suspensions" 


      it "staff can see suspensions" 

    end
  end

  describe '#can_remove_allowed_users?' do
    context 'staff users' do
      it 'should be true' 

    end

    context 'normal user' do
      let(:topic) { Fabricate(:topic, user: Fabricate(:user)) }
      let(:another_user) { Fabricate(:user) }

      before do
        topic.allowed_users << user
        topic.allowed_users << another_user
      end

      it 'should be false' 


      describe 'target_user is the user' do
        describe 'when user is in a pm with another user' do
          it 'should return true' 

        end

        describe 'when user is the creator of the topic' do
          it 'should return false' 

        end

        describe 'when user is the only user in the topic' do
          it 'should return false' 

        end
      end

      describe 'target_user is not the user' do
        it 'should return false' 

      end
    end
  end

  describe '#auth_token' do
    it 'returns the correct auth token' 

  end
end

