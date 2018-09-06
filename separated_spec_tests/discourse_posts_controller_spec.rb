require 'rails_helper'

shared_examples 'finding and showing post' do
  let(:user) { log_in }
  let(:post) { Fabricate(:post, user: user) }

  it 'ensures the user can see the post' 


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

shared_examples 'action requires login' do |method, action, params|
  it 'raises an exception when not logged in' 

end

describe PostsController do

  describe 'latest' do
    let(:user) { log_in }
    let!(:public_topic) { Fabricate(:topic) }
    let!(:post) { Fabricate(:post, user: user, topic: public_topic) }
    let!(:private_topic) { Fabricate(:topic, archetype: Archetype.private_message, category: nil) }
    let!(:private_post) { Fabricate(:post, user: user, topic: private_topic) }
    let!(:topicless_post) { Fabricate(:post, user: user, raw: '<p>Car 54, where are you?</p>') }

    context "public posts" do
      before do
        topicless_post.update topic_id: -100
      end

      it 'returns public posts with topic for json' 

    end

    context 'private posts' do
      before do
        Guardian.any_instance.expects(:can_see?).with(private_post).returns(true)
      end

      it 'returns private posts for json' 

    end
  end

  describe 'cooked' do
    before do
      post = Post.new(cooked: 'wat')
      PostsController.any_instance.expects(:find_post_from_params).returns(post)
    end

    it 'returns the cooked conent' 

  end

  describe 'raw_email' do
    include_examples "action requires login", :get, :raw_email, id: 2

    describe "when logged in" do
      let(:user) { log_in }
      let(:post) { Fabricate(:post, deleted_at: 2.hours.ago, user: user, raw_email: 'email_content') }

      it "raises an error if the user doesn't have permission to view raw email" 


      it "can view raw email" 


    end

  end

  describe 'show' do
    include_examples 'finding and showing post' do
      let(:action) { :show }
      let(:params) { { id: post.id } }
    end

    it 'gets all the expected fields' 

  end

  describe 'by_number' do
    include_examples 'finding and showing post' do
      let(:action) { :by_number }
      let(:params) { { topic_id: post.topic_id, post_number: post.post_number } }
    end
  end

  describe 'reply_history' do
    include_examples 'finding and showing post' do
      let(:action) { :reply_history }
      let(:params) { { id: post.id } }
    end

    it 'asks post for reply history' 

  end

  describe 'replies' do
    include_examples 'finding and showing post' do
      let(:action) { :replies }
      let(:params) { { post_id: post.id } }
    end

    it 'asks post for replies' 

  end

  describe 'delete a post' do
    include_examples 'action requires login', :delete, :destroy, id: 123

    describe 'when logged in' do

      let(:user) { log_in(:moderator) }
      let(:post) { Fabricate(:post, user: user, post_number: 2) }

      it 'does not allow to destroy when edit time limit expired' 


      it "raises an error when the user doesn't have permission to see the post" 


      it "uses a PostDestroyer" 


    end
  end

  describe 'recover a post' do
    include_examples 'action requires login', :put, :recover, post_id: 123

    describe 'when logged in' do

      let(:user) { log_in(:moderator) }
      let(:post) { Fabricate(:post, user: user, post_number: 2) }

      it "raises an error when the user doesn't have permission to see the post" 


      it "recovers a post correctly" 


    end
  end

  describe 'destroy_many' do
    include_examples 'action requires login', :delete, :destroy_many, post_ids: [123, 345]

    describe 'when logged in' do

      let!(:poster) { log_in(:moderator) }
      let!(:post1) { Fabricate(:post, user: poster, post_number: 2) }
      let!(:post2) { Fabricate(:post, topic_id: post1.topic_id, user: poster, post_number: 3, reply_to_post_number: post1.post_number) }

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

  describe 'edit a post' do

    include_examples 'action requires login', :put, :update, id: 2

    let(:post) { Fabricate(:post, user: logged_in_as) }
    let(:update_params) do
      {
        id: post.id,
        post: { raw: 'edited body', edit_reason: 'typo' },
        image_sizes: { 'http://image.com/image.jpg' => { 'width' => 123, 'height' => 456 } },
      }
    end
    let(:moderator) { Fabricate(:moderator) }

    describe 'when logged in as a regular user' do
      let(:logged_in_as) { log_in }

      it 'does not allow to update when edit time limit expired' 


      it 'passes the image sizes through' 


      it 'passes the edit reason through' 


      it "raises an error when the post parameter is missing" 


      it "raises an error when the user doesn't have permission to see the post" 


      it "calls revise with valid parameters" 


      it "extracts links from the new body" 


      it "doesn't allow updating of deleted posts" 

    end

    describe "when logged in as staff" do
      let(:logged_in_as) { log_in(:moderator) }

      it "supports updating posts in deleted topics" 

    end

  end

  describe 'bookmark a post' do

    include_examples 'action requires login', :put, :bookmark, post_id: 2

    describe 'when logged in' do
      let(:user) { log_in }
      let(:post) { Fabricate(:post, user: user) }
      let(:private_message) { Fabricate(:private_message_post) }

      it "raises an error if the user doesn't have permission to see the post" 


      it 'creates a bookmark' 


      context "removing a bookmark" do
        let(:post_action) { PostAction.act(user, post, PostActionType.types[:bookmark]) }
        let(:admin) { Fabricate(:admin) }

        it "returns the right response when post is not bookmarked" 


        it 'should be able to remove a bookmark' 


        describe "when user doesn't have permission to see bookmarked post" do
          it "should still be able to remove a bookmark" 

        end

        describe "when post has been deleted" do
          it "should still be able to remove a bookmark" 

        end
      end

    end

  end

  describe "wiki" do

    include_examples "action requires login", :put, :wiki, post_id: 2

    describe "when logged in" do
      let(:user) { log_in }
      let(:post) { Fabricate(:post, user: user) }

      it "raises an error if the user doesn't have permission to wiki the post" 


      it "toggle wiki status should create a new version" 


      it "can wiki a post" 


      it "can unwiki a post" 


    end

  end

  describe "post_type" do

    include_examples "action requires login", :put, :post_type, post_id: 2

    describe "when logged in" do
      let(:user) { log_in }
      let(:post) { Fabricate(:post, user: user) }

      it "raises an error if the user doesn't have permission to change the post type" 


      it "can change the post type" 


    end

  end

  describe "rebake" do

    include_examples "action requires login", :put, :rebake, post_id: 2

    describe "when logged in" do
      let(:user) { log_in }
      let(:post) { Fabricate(:post, user: user) }

      it "raises an error if the user doesn't have permission to rebake the post" 


      it "can rebake the post" 


    end

  end

  describe 'creating a post' do

    before do
      SiteSetting.min_first_post_typing_time = 0
    end

    include_examples 'action requires login', :post, :create

    context 'api' do
      it 'memoizes duplicate requests' 


      it 'allows to create posts in import_mode' 

    end

    describe 'when logged in' do

      let!(:user) { log_in }
      let(:moderator) { log_in(:moderator) }
      let(:new_post) { Fabricate.build(:post, user: user) }

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


      context "errors" do

        let(:post_with_errors) { Fabricate.build(:post, user: user) }

        before do
          post_with_errors.errors.add(:base, I18n.t(:spamming_host))
          PostCreator.any_instance.stubs(:errors).returns(post_with_errors.errors)
          PostCreator.any_instance.expects(:create).returns(post_with_errors)
        end

        it "does not succeed" 


        it "it triggers flag_linked_posts_as_spam when the post creator returns spam" 

      end
    end
  end

  describe "revisions" do

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

    context "when edit history is visible to everyone" do

      before { SiteSetting.edit_history_visible_to_public = true }

      it "ensures anyone can see the revisions" 


    end

    context "deleted post" do
      let(:admin) { log_in(:admin) }
      let(:deleted_post) { Fabricate(:post, user: admin, version: 3) }
      let(:deleted_post_revision) { Fabricate(:post_revision, user: admin, post: deleted_post) }

      before { deleted_post.trash!(admin) }

      it "also work on deleted post" 

    end

    context "deleted topic" do
      let(:admin) { log_in(:admin) }
      let(:deleted_topic) { Fabricate(:topic, user: admin) }
      let(:post) { Fabricate(:post, user: admin, topic: deleted_topic, version: 3) }
      let(:post_revision) { Fabricate(:post_revision, user: admin, post: post) }

      before { deleted_topic.trash!(admin) }

      it "also work on deleted topic" 

    end

  end

  describe 'revert post to a specific revision' do
    include_examples 'action requires login', :put, :revert, post_id: 123, revision: 2

    let(:post) { Fabricate(:post, user: logged_in_as, raw: "Lorem ipsum dolor sit amet, cu nam libris tractatos, ancillae senserit ius ex") }
    let(:post_revision) { Fabricate(:post_revision, post: post, modifications: { "raw" => ["this is original post body.", "this is edited post body."] }) }
    let(:blank_post_revision) { Fabricate(:post_revision, post: post, modifications: { "edit_reason" => ["edit reason #1", "edit reason #2"] }) }
    let(:same_post_revision) { Fabricate(:post_revision, post: post, modifications: { "raw" => ["Lorem ipsum dolor sit amet, cu nam libris tractatos, ancillae senserit ius ex", "this is edited post body."] }) }

    let(:revert_params) do
      {
        post_id: post.id,
        revision: post_revision.number
      }
    end
    let(:moderator) { Fabricate(:moderator) }

    describe 'when logged in as a regular user' do
      let(:logged_in_as) { log_in }

      it "does not work" 

    end

    describe "when logged in as staff" do
      let(:logged_in_as) { log_in(:moderator) }

      it "fails when revision is < 2" 


      it "fails when post_revision record is not found" 


      it "fails when post record is not found" 


      it "fails when revision is blank" 


      it "fails when revised version is same as current version" 


      it "works!" 


      it "supports reverting posts in deleted topics" 

    end
  end

  describe 'expandable embedded posts' do
    let(:post) { Fabricate(:post) }

    it "raises an error when you can't see the post" 


    it "retrieves the body when you can see the post" 

  end

  describe "flagged posts" do

    include_examples "action requires login", :get, :flagged_posts, username: "system"

    describe "when logged in" do
      before { log_in }

      it "raises an error if the user doesn't have permission to see the flagged posts" 


      it "can see the flagged posts when authorized" 


      it "only shows agreed and deferred flags" 


    end

  end

  describe "deleted posts" do

    include_examples "action requires login", :get, :deleted_posts, username: "system"

    describe "when logged in" do
      before { log_in }

      it "raises an error if the user doesn't have permission to see the deleted posts" 


      it "can see the deleted posts when authorized" 


      it "doesn't return secured categories for moderators if they don't have access" 


      it "doesn't return PMs for moderators" 


      it "only shows posts deleted by other users" 


    end

  end

  describe "view raw" do
    describe "by ID" do
      it "can be viewed by anonymous" 

    end

    describe "by post number" do
      it "can be viewed by anonymous" 

    end
  end

  describe "short link" do
    let(:topic) { Fabricate(:topic) }
    let(:post) { Fabricate(:post, topic: topic) }

    it "redirects to the topic" 


    it "returns a 403 when access is denied" 

  end
end

