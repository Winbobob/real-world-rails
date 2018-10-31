require 'rails_helper'
require 'post_destroyer'

describe PostDestroyer do

  before do
    UserActionCreator.enable
  end

  let(:moderator) { Fabricate(:moderator) }
  let(:admin) { Fabricate(:admin) }
  let(:post) { create_post }

  describe "destroy_old_hidden_posts" do

    it "destroys posts that have been hidden for 30 days" 


  end

  describe 'destroy_old_stubs' do
    it 'destroys stubs for deleted by user posts' 


    it 'uses the delete_removed_posts_after site setting' 


    it "deletes posts immediately if delete_removed_posts_after is 0" 

  end

  describe "recovery and user actions" do
    it "recreates user actions" 


    describe "post_count recovery" do
      before do
        post
        @user = post.user
        @reply = create_post(topic: post.topic, user: @user)
        expect(@user.user_stat.post_count).to eq(1)
      end

      context "recovered by user" do
        it "should increment the user's post count" 

      end

      context "recovered by admin" do
        it "should increment the user's post count" 

      end
    end
  end

  describe 'basic destroying' do
    it "as the creator of the post, doesn't delete the post" 


    it "when topic is destroyed, it updates user_stats correctly" 


    it "accepts a delete_removed_posts_after option" 


    context "as a moderator" do
      it "deletes the post" 

    end

    context "as an admin" do
      it "deletes the post" 


      it "updates the user's topic_count for first post" 


      it "updates the user's post_count for reply" 


      it "doesn't count whispers" 

    end

  end

  context 'deleting the second post in a topic' do

    let(:user) { Fabricate(:user) }
    let!(:post) { create_post(user: user) }
    let(:topic) { post.topic.reload }
    let(:second_user) { Fabricate(:coding_horror) }
    let!(:second_post) { create_post(topic: topic, user: second_user) }

    before do
      PostDestroyer.new(moderator, second_post).destroy
    end

    it 'resets the last_poster_id back to the OP' 


    it 'resets the last_posted_at back to the OP' 


    context 'topic_user' do

      let(:topic_user) { second_user.topic_users.find_by(topic_id: topic.id) }

      it 'clears the posted flag for the second user' 


      it "sets the second user's last_read_post_number back to 1" 


      it "sets the second user's last_read_post_number back to 1" 


    end

  end

  context "deleting a post belonging to a deleted topic" do
    let!(:topic) { post.topic }
    let(:author) { post.user }

    before do
      topic.trash!(admin)
      post.reload
    end

    context "as a moderator" do
      before do
        PostDestroyer.new(moderator, post).destroy
      end

      it "deletes the post" 

    end

    context "as an admin" do
      subject { PostDestroyer.new(admin, post).destroy }

      it "deletes the post" 


      it "creates a new user history entry" 

    end
  end

  context "deleting a reply belonging to a deleted topic" do
    let!(:topic) { post.topic }
    let!(:reply) { create_post(topic_id: topic.id, user: post.user) }
    let(:author) { reply.user }

    before do
      topic.trash!(admin)
      post.reload
      reply.reload
    end

    context "as a moderator" do
      subject { PostDestroyer.new(moderator, reply).destroy }

      it "deletes the reply" 


      it "doesn't decrement post_count again" 

    end

    context "as an admin" do
      subject { PostDestroyer.new(admin, reply).destroy }

      it "deletes the post" 


      it "doesn't decrement post_count again" 


      it "creates a new user history entry" 

    end
  end

  describe 'after delete' do

    let!(:coding_horror) { Fabricate(:coding_horror) }
    let!(:post) { Fabricate(:post, raw: "Hello @CodingHorror") }

    it "should feature the users again (in case they've changed)" 


    describe 'with a reply' do

      let!(:reply) { Fabricate(:basic_reply, user: coding_horror, topic: post.topic) }
      let!(:post_reply) { PostReply.create(post_id: post.id, reply_id: reply.id) }

      it 'changes the post count of the topic' 


      it 'lowers the reply_count when the reply is deleted' 


      it 'should increase the post_number when there are deletion gaps' 


    end

  end

  context '@mentions' do
    it 'removes notifications when deleted' 

  end

  describe "post actions" do
    let(:second_post) { Fabricate(:post, topic_id: post.topic_id) }
    let!(:bookmark) { PostAction.act(moderator, second_post, PostActionType.types[:bookmark]) }
    let!(:flag) { PostAction.act(moderator, second_post, PostActionType.types[:off_topic]) }

    it "should delete public post actions and agree with flags" 

  end

  describe "user actions" do
    let(:codinghorror) { Fabricate(:coding_horror) }
    let(:second_post) { Fabricate(:post, topic_id: post.topic_id) }

    def create_user_action(action_type)
      UserAction.log_action!(action_type: action_type,
                             user_id: codinghorror.id,
                             acting_user_id: codinghorror.id,
                             target_topic_id: second_post.topic_id,
                             target_post_id: second_post.id)
    end

    it "should delete the user actions" 

  end

  describe 'topic links' do
    let!(:first_post)  { Fabricate(:post) }
    let!(:topic)       { first_post.topic }
    let!(:second_post) { Fabricate(:post_with_external_links, topic: topic) }

    before { TopicLink.extract_from(second_post) }

    it 'should destroy the topic links when moderator destroys the post' 


    it 'should destroy the topic links when the user destroys the post' 

  end

end

