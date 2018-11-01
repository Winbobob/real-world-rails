require 'rails_helper'

shared_examples 'finding and showing post' do
  let(:user) { Fabricate(:user) }
  let(:post) { Fabricate(:post, user: user) }

  it "ensures the user can't see the post" 


  it 'succeeds' 


  context "deleted post" do
    before do
      post.trash!(user)
    end

    it "can't find deleted posts as an anonymous user" 


    it "can't find deleted posts as a regular user" 


    it "can find posts as a moderator" 


    it "can find posts as a admin" 

  end
end

shared_examples 'action requires login' do |method, url, params = {}|
  it 'raises an exception when not logged in' 

end

describe PostsController do
  let(:user) { Fabricate(:user) }
  let(:category) { Fabricate(:category) }
  let(:topic) { Fabricate(:topic) }
  let(:public_post) { Fabricate(:post, user: user, topic: topic) }
  let(:topicless_post) { Fabricate(:post, user: user, raw: '<p>Car 54, where are you?</p>') }

  let(:private_topic) do
    Fabricate(:topic, archetype: Archetype.private_message, category_id: nil)
  end

  let(:private_post) { Fabricate(:post, user: user, topic: private_topic) }

  describe '#show' do
    include_examples 'finding and showing post' do
      let(:url) { "/posts/#{post.id}.json" }
    end

    it 'gets all the expected fields' 

  end

  describe '#by_number' do
    include_examples 'finding and showing post' do
      let(:url) { "/posts/by_number/#{post.topic_id}/#{post.post_number}.json" }
    end
  end

  describe '#by_date' do
    include_examples 'finding and showing post' do
      let(:url) { "/posts/by-date/#{post.topic_id}/#{post.created_at.strftime("%Y-%m-%d")}.json" }
    end

    it 'returns the expected post' 


    it 'returns no post if date is > at last created post' 

  end

  describe '#reply_history' do
    include_examples 'finding and showing post' do
      let(:url) { "/posts/#{post.id}/reply-history.json" }
    end

    it 'asks post for reply history' 

  end

  describe '#replies' do
    include_examples 'finding and showing post' do
      let(:url) { "/posts/#{post.id}/replies.json" }
    end

    it 'asks post for replies' 

  end

  describe '#destroy' do
    include_examples 'action requires login', :delete, "/posts/123.json"

    describe 'when logged in' do
      let(:topic) { Fabricate(:topic) }
      let(:user) { Fabricate(:user) }
      let(:moderator) { Fabricate(:moderator) }

      it "raises an error when the user doesn't have permission to see the post" 


      it "uses a PostDestroyer" 

    end
  end

  describe '#destroy_many' do
    include_examples 'action requires login', :delete, "/posts/destroy_many.json", params: { post_ids: [123, 345] }

    describe 'when logged in' do
      let(:poster) { Fabricate(:moderator) }
      let(:post1) { Fabricate(:post, user: poster, post_number: 2) }
      let(:post2) { Fabricate(:post, topic: post1.topic, user: poster, post_number: 3, reply_to_post_number: post1.post_number) }

      it "raises invalid parameters no post_ids" 


      it "raises invalid parameters with missing ids" 


      it "raises an error when the user doesn't have permission to delete the posts" 


      it "deletes the post" 


      it "updates the highest read data for the forum" 


      describe "can delete replies" do
        before do
          PostReply.create(post_id: post1.id, reply_id: post2.id)
        end

        it "deletes the post and the reply to it" 

      end
    end
  end

  describe '#recover' do
    include_examples 'action requires login', :put, "/posts/123/recover.json"

    describe 'when logged in' do
      let(:user) { Fabricate(:user) }
      let(:post) { Fabricate(:post, user: user, post_number: 2) }

      it "raises an error when the user doesn't have permission to see the post" 


      it "recovers a post correctly" 

    end
  end

  describe '#update' do
    include_examples 'action requires login', :put, "/posts/2.json"

    let(:user) { Fabricate(:user) }
    let(:post) { Fabricate(:post, user: user) }
    let(:update_params) do
      {
        post: { raw: 'edited body', edit_reason: 'typo' },
        image_sizes: { 'http://image.com/image.jpg' => { 'width' => 123, 'height' => 456 } },
      }
    end

    let(:moderator) { Fabricate(:moderator) }

    describe 'when logged in as a regular user' do
      before do
        sign_in(user)
      end

      it 'does not allow to update when edit time limit expired' 


      it 'passes the image sizes through' 


      it 'passes the edit reason through' 


      it 'checks for an edit conflict' 


      it "raises an error when the post parameter is missing" 


      it "raises an error when the user doesn't have permission to see the post" 


      it "calls revise with valid parameters" 


      it "extracts links from the new body" 


      it "doesn't allow updating of deleted posts" 

    end

    describe "when logged in as staff" do
      before do
        sign_in(moderator)
      end

      it "supports updating posts in deleted topics" 

    end

    it 'can not change category to a disallowed category' 


    it 'can not move to a category that requires topic approval' 

  end

  describe '#bookmark' do
    include_examples 'action requires login', :put, "/posts/2/bookmark.json"
    let(:post) { Fabricate(:post, user: user) }
    let(:user) { Fabricate(:user) }

    describe 'when logged in' do
      before do
        sign_in(user)
      end

      let(:private_message) { Fabricate(:private_message_post) }

      it "raises an error if the user doesn't have permission to see the post" 


      it 'creates a bookmark' 


      context "removing a bookmark" do
        let(:post_action) { PostAction.act(user, post, PostActionType.types[:bookmark]) }
        let(:admin) { Fabricate(:admin) }

        it "returns the right response when post is not bookmarked" 


        it "should be able to remove a bookmark" 


        describe "when user doesn't have permission to see bookmarked post" do
          it "should still be able to remove a bookmark" 

        end

        describe "when post has been deleted" do
          it "should still be able to remove a bookmark" 

        end
      end
    end

    context "api" do
      let(:api_key) { user.generate_api_key(user) }
      let(:master_key) { ApiKey.create_master_key }

      # choosing an arbitrarily easy to mock trusted activity
      it 'allows users with api key to bookmark posts' 


      it 'raises an error with a user key that does not match an optionally specified username' 


      it 'allows users with a master api key to bookmark posts' 


      it 'disallows phonies to bookmark posts' 


      it 'disallows blank api' 

    end
  end

  describe '#wiki' do
    include_examples "action requires login", :put, "/posts/2/wiki.json"

    describe "when logged in" do
      before do
        sign_in(user)
      end

      let(:user) { Fabricate(:user) }
      let(:post) { Fabricate(:post, user: user) }

      it "raises an error if the user doesn't have permission to wiki the post" 


      it "toggle wiki status should create a new version" 


      it "can wiki a post" 


      it "can unwiki a post" 

    end
  end

  describe '#post_type' do
    include_examples "action requires login", :put, "/posts/2/post_type.json"

    describe "when logged in" do
      before do
        sign_in(user)
      end

      let(:user) { Fabricate(:user) }
      let(:post) { Fabricate(:post, user: user) }

      it "raises an error if the user doesn't have permission to change the post type" 


      it "can change the post type" 

    end
  end

  describe '#rebake' do
    include_examples "action requires login", :put, "/posts/2/rebake.json"

    describe "when logged in" do
      let(:post) { Fabricate(:post, user: user) }

      it "raises an error if the user doesn't have permission to rebake the post" 


      it "can rebake the post" 

    end
  end

  describe '#create' do
    include_examples 'action requires login', :post, "/posts.json"

    before do
      SiteSetting.min_first_post_typing_time = 0
    end

    let(:user) { Fabricate(:user) }

    context 'api' do
      it 'memoizes duplicate requests' 


      it 'allows to create posts in import_mode' 

    end

    describe "when logged in" do
      before do
        sign_in(user)
      end

      context "fast typing" do
        before do
          SiteSetting.min_first_post_typing_time = 3000
          SiteSetting.auto_silence_fast_typers_max_trust_level = 1
        end

        it 'queues the post if min_first_post_typing_time is not met' 


        it "doesn't enqueue replies when the topic is closed" 


        it "doesn't enqueue replies when the post is too long" 

      end

      it 'silences correctly based on auto_silence_first_post_regex' 


      it "can send a message to a group" 


      it "returns the nested post with a param" 


      it 'protects against dupes' 


      it 'can not create a post in a disallowed category' 


      it 'creates the post' 


      it 'can create a reply to a post' 


      it 'creates a private post' 


      context "errors" do
        it "does not succeed" 


        it "it triggers flag_linked_posts_as_spam when the post creator returns spam" 

      end
    end

    describe 'shared draft' do
      let(:destination_category) { Fabricate(:category) }

      it "will raise an error for regular users" 


      describe "as a staff user" do
        before do
          sign_in(Fabricate(:moderator))
        end

        it "will raise an error if there is no shared draft category" 


        context "with a shared category" do
          let(:shared_category) { Fabricate(:category) }
          before do
            SiteSetting.shared_drafts_category = shared_category.id
          end

          it "will work if the shared draft category is present" 

        end
      end
    end

    describe 'warnings' do
      let(:user_2) { Fabricate(:user) }

      context 'as a staff user' do
        before do
          sign_in(Fabricate(:admin))
        end

        it 'should be able to mark a topic as warning' 


        it 'should be able to mark a topic as not a warning' 

      end

      context 'as a normal user' do
        it 'should not be able to mark a topic as warning' 

      end
    end

    context "topic bump" do
      shared_examples "it works" do
        let(:original_bumped_at) { 1.day.ago }
        let!(:topic) { Fabricate(:topic, bumped_at: original_bumped_at) }

        it "should be able to skip topic bumping" 


        it "should be able to post with topic bumping" 

      end

      context "admins" do
        before do
          sign_in(Fabricate(:admin))
        end

        include_examples "it works"
      end

      context "moderators" do
        before do
          sign_in(Fabricate(:moderator))
        end

        include_examples "it works"
      end

      context "users" do
        let(:topic) { Fabricate(:topic) }

        [:user, :trust_level_4].each do |user|
          it "will raise an error for #{user}" 

        end
      end
    end

  end

  describe '#revisions' do
    let(:post) { Fabricate(:post, version: 2) }
    let(:post_revision) { Fabricate(:post_revision, post: post) }

    it "throws an exception when revision is < 2" 


    context "when edit history is not visible to the public" do

      before { SiteSetting.edit_history_visible_to_public = false }

      it "ensures anonymous cannot see the revisions" 


      it "ensures regular user cannot see the revisions" 


      it "ensures staff can see the revisions" 


      it "ensures poster can see the revisions" 


      it "ensures trust level 4 can see the revisions" 

    end

    context "when post is hidden" do
      before {
        post.hidden = true
        post.save
      }

      it "throws an exception for users" 


      it "works for admins" 

    end

    context "when edit history is visible to everyone" do

      before { SiteSetting.edit_history_visible_to_public = true }

      it "ensures anyone can see the revisions" 

    end

    context "deleted post" do
      let(:admin) { Fabricate(:admin) }
      let(:deleted_post) { Fabricate(:post, user: admin, version: 3) }
      let(:deleted_post_revision) { Fabricate(:post_revision, user: admin, post: deleted_post) }

      before { deleted_post.trash!(admin) }

      it "also work on deleted post" 

    end

    context "deleted topic" do
      let(:admin) { Fabricate(:admin) }
      let(:deleted_topic) { Fabricate(:topic, user: admin) }
      let(:post) { Fabricate(:post, user: admin, topic: deleted_topic, version: 3) }
      let(:post_revision) { Fabricate(:post_revision, user: admin, post: post) }

      before { deleted_topic.trash!(admin) }

      it "also work on deleted topic" 

    end
  end

  describe '#revert' do
    include_examples 'action requires login', :put, "/posts/123/revisions/2/revert.json"

    let(:post) { Fabricate(:post, user: Fabricate(:user), raw: "Lorem ipsum dolor sit amet, cu nam libris tractatos, ancillae senserit ius ex") }
    let(:post_revision) { Fabricate(:post_revision, post: post, modifications: { "raw" => ["this is original post body.", "this is edited post body."] }) }
    let(:blank_post_revision) { Fabricate(:post_revision, post: post, modifications: { "edit_reason" => ["edit reason #1", "edit reason #2"] }) }
    let(:same_post_revision) { Fabricate(:post_revision, post: post, modifications: { "raw" => ["Lorem ipsum dolor sit amet, cu nam libris tractatos, ancillae senserit ius ex", "this is edited post body."] }) }

    let(:post_id) { post.id }
    let(:revision_id) { post_revision.number }
    let(:moderator) { Fabricate(:moderator) }

    describe 'when logged in as a regular user' do
      it "does not work" 

    end

    describe "when logged in as staff" do
      before do
        sign_in(moderator)
      end

      it "fails when revision is < 2" 


      it "fails when post_revision record is not found" 


      it "fails when post record is not found" 


      it "fails when revision is blank" 


      it "fails when revised version is same as current version" 


      it "works!" 


      it "supports reverting posts in deleted topics" 

    end
  end

  describe '#expand_embed' do
    before do
      sign_in(Fabricate(:user))
    end

    let(:post) { Fabricate(:post) }

    it "raises an error when you can't see the post" 


    it "retrieves the body when you can see the post" 

  end

  describe '#flagged_posts' do
    include_examples "action requires login", :get, "/posts/system/flagged.json"

    describe "when logged in" do
      it "raises an error if the user doesn't have permission to see the flagged posts" 


      it "can see the flagged posts when authorized" 


      it "only shows agreed and deferred flags" 

    end
  end

  describe '#deleted_posts' do
    include_examples "action requires login", :get, "/posts/system/deleted.json"

    describe "when logged in" do
      it "raises an error if the user doesn't have permission to see the deleted posts" 


      it "can see the deleted posts when authorized" 


      it "doesn't return secured categories for moderators if they don't have access" 


      it "doesn't return PMs for moderators" 


      it "only shows posts deleted by other users" 

    end
  end

  describe '#markdown_id' do
    it "can be viewed by anonymous" 

  end

  describe '#markdown_num' do
    it "can be viewed by anonymous" 

  end

  describe '#short_link' do
    let(:topic) { Fabricate(:topic) }
    let(:post) { Fabricate(:post, topic: topic) }

    it "redirects to the topic" 


    it "returns a 403 when access is denied" 

  end

  describe '#user_posts_feed' do
    it 'returns public posts rss feed' 


    it 'returns public posts as JSON' 

  end

  describe '#latest' do
    context 'private posts' do
      it 'returns private posts rss feed' 


      it 'returns private posts for json' 

    end

    context 'public posts' do
      it 'returns public posts with topic rss feed' 


      it 'returns public posts with topic for json' 

    end
  end

  describe '#cooked' do
    it 'returns the cooked conent' 

  end

  describe '#raw_email' do
    include_examples "action requires login", :get, "/posts/2/raw-email.json"

    describe "when logged in" do
      let(:post) { Fabricate(:post, deleted_at: 2.hours.ago, user: Fabricate(:user), raw_email: 'email_content') }

      it "raises an error if the user doesn't have permission to view raw email" 


      it "can view raw email" 

    end
  end

  describe "#locked" do
    before do
      sign_in(Fabricate(:moderator))
    end

    it 'can lock and unlock the post' 

  end
end

