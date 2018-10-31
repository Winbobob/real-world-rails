require 'rails_helper'
require_dependency 'user_destroyer'

describe UserDestroyer do

  let(:user) { Fabricate(:user) }
  let(:admin) { Fabricate(:admin) }

  describe 'new' do
    it 'raises an error when user is nil' 


    it 'raises an error when user is not a User' 

  end

  describe 'destroy' do
    before do
      @admin = Fabricate(:admin)
      @user = Fabricate(:user)
    end

    it 'raises an error when user is nil' 


    it 'raises an error when user is not a User' 


    it 'raises an error when regular user tries to delete another user' 


    shared_examples "successfully destroy a user" do
      it 'should delete the user' 


      it 'should return the deleted user record' 


      it 'should log the action' 


      it "should not log the action if quiet is true" 

    end

    shared_examples "email block list" do
      it "doesn't add email to block list by default" 


      it "adds emails to block list if block_email is true" 

    end

    context 'user deletes self' do
      let(:destroy_opts) { { delete_posts: true } }
      subject(:destroy) { UserDestroyer.new(@user).destroy(@user, destroy_opts) }

      include_examples "successfully destroy a user"
    end

    context "with a queued post" do
      let!(:qp) { Fabricate(:queued_post, user: user) }

      it "removes the queued post" 

    end

    context "with a directory item record" do

      it "removes the directory item" 

    end

    context "with a draft" do
      let!(:draft) { Draft.set(user, 'test', 1, 'test') }

      it "removed the draft" 

    end

    context 'user has posts' do
      let!(:topic_starter) { Fabricate(:user) }
      let!(:topic) { Fabricate(:topic, user: topic_starter) }
      let!(:first_post) { Fabricate(:post, user: topic_starter, topic: topic) }
      let!(:post) { Fabricate(:post, user: @user, topic: topic) }

      context "delete_posts is false" do
        subject(:destroy) { UserDestroyer.new(@admin).destroy(@user) }
        before do
          @user.stubs(:post_count).returns(1)
          @user.stubs(:first_post_created_at).returns(Time.zone.now)
        end

        it 'should raise the right error' 

      end

      context "delete_posts is true" do
        let(:destroy_opts) { { delete_posts: true } }

        context "staff deletes user" do
          subject(:destroy) { UserDestroyer.new(@admin).destroy(@user, destroy_opts) }

          include_examples "successfully destroy a user"
          include_examples "email block list"

          it "deletes the posts" 


          it "does not delete topics started by others in which the user has replies" 


          it "deletes topics started by the deleted user" 


          context "delete_as_spammer is true" do

            before { destroy_opts[:delete_as_spammer] = true }

            it "agrees with flags on user's posts" 


          end
        end

        context "users deletes self" do
          subject(:destroy) { UserDestroyer.new(@user).destroy(@user, destroy_opts) }

          include_examples "successfully destroy a user"
          include_examples "email block list"

          it "deletes the posts" 

        end
      end
    end

    context 'user has no posts, but user_stats table has post_count > 0' do
      before do
        # out of sync user_stat data shouldn't break UserDestroyer
        @user.user_stat.update_attribute(:post_count, 1)
      end
      let(:destroy_opts) { {} }
      subject(:destroy) { UserDestroyer.new(@user).destroy(@user, delete_posts: false) }

      include_examples "successfully destroy a user"
    end

    context 'user has deleted posts' do
      let!(:deleted_post) { Fabricate(:post, user: @user, deleted_at: 1.hour.ago) }
      it "should mark the user's deleted posts as belonging to a nuked user" 

    end

    context 'user has no posts' do
      context 'and destroy succeeds' do
        let(:destroy_opts) { {} }
        subject(:destroy) { UserDestroyer.new(@admin).destroy(@user) }

        include_examples "successfully destroy a user"
        include_examples "email block list"
      end

      context 'and destroy fails' do
        subject(:destroy) { UserDestroyer.new(@admin).destroy(@user) }

        it 'should not log the action' 

      end
    end

    context 'user has posts with links' do
      context 'external links' do
        before do
          @post = Fabricate(:post_with_external_links, user: @user)
          TopicLink.extract_from(@post)
        end

        it "doesn't add ScreenedUrl records by default" 


        it "adds ScreenedUrl records when :block_urls is true" 

      end

      context 'internal links' do
        before do
          @post = Fabricate(:post_with_external_links, user: @user)
          TopicLink.extract_from(@post)
          TopicLink.any_instance.stubs(:internal).returns(true)
        end

        it "doesn't add ScreenedUrl records" 

      end

      context 'with oneboxed links' do
        before do
          @post = Fabricate(:post_with_youtube, user: @user)
          TopicLink.extract_from(@post)
        end

        it "doesn't add ScreenedUrl records" 

      end
    end

    context 'ip address screening' do
      it "doesn't create screened_ip_address records by default" 


      context "block_ip is true" do
        it "creates a new screened_ip_address record" 


        it "creates two new screened_ip_address records when registration_ip_address is different than last ip_address" 

      end
    end

    context 'user created a category' do
      let!(:category) { Fabricate(:category, user: @user) }

      it "assigns the system user to the categories" 

    end

    context 'user got an email' do
      let!(:email_log) { Fabricate(:email_log, user: user) }

      it "deletes the email log" 

    end

    context 'user liked things' do
      before do
        @topic = Fabricate(:topic, user: Fabricate(:user))
        @post = Fabricate(:post, user: @topic.user, topic: @topic)
        @like = PostAction.act(@user, @post, PostActionType.types[:like])
      end

      it 'should destroy the like' 

    end

    context 'user belongs to groups that grant trust level' do
      let(:group) { Fabricate(:group, grant_trust_level: 2) }

      before do
        group.add(user)
      end

      it 'can delete the user' 

    end
  end

end

