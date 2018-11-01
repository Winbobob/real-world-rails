require 'rails_helper'
require 'topic_view'

describe TopicView do

  let(:topic) { create_topic }
  let(:evil_trout) { Fabricate(:evil_trout) }
  let(:first_poster) { topic.user }

  let(:topic_view) { TopicView.new(topic.id, evil_trout) }

  it "raises a not found error if the topic doesn't exist" 


  it "accepts a topic or a topic id" 


  # see also spec/controllers/topics_controller_spec.rb TopicsController::show::permission errors
  it "raises an error if the user can't see the topic" 


  it "handles deleted topics" 


  context "chunk_size" do
    it "returns `chunk_size` by default" 


    it "returns `slow_chunk_size` when slow_platform is true" 


    it "returns `print_chunk_size` when print param is true" 

  end

  context "with a few sample posts" do
    let!(:p1) { Fabricate(:post, topic: topic, user: first_poster, percent_rank: 1) }
    let!(:p2) { Fabricate(:post, topic: topic, user: evil_trout, percent_rank: 0.5) }
    let!(:p3) { Fabricate(:post, topic: topic, user: first_poster, percent_rank: 0) }

    let(:moderator) { Fabricate(:moderator) }
    let(:admin) { Fabricate(:admin) }

    it "it can find the best responses" 


    it "raises NotLoggedIn if the user isn't logged in and is trying to view a private message" 


    context 'log_check_personal_message is enabled' do
      let(:group) { Fabricate(:group) }
      let(:private_message) { Fabricate(:private_message_topic, allowed_groups: [group]) }

      before do
        SiteSetting.log_personal_messages_views = true
        evil_trout.admin = true
      end

      it "logs view if Admin views personal message for other user/group" 


      it "does not log personal message view for group he belongs to" 


      it "does not log personal message view for his own personal message" 


      it "does not log personal message view if user can't see the message" 


      it "does not log personal message view if there exists a similar log in previous hour" 

    end

    it "provides an absolute url" 


    context 'subfolder' do
      before do
        GlobalSetting.stubs(:relative_url_root).returns('/forum')
        Discourse.stubs(:base_uri).returns("/forum")
      end

      it "provides the correct absolute url" 

    end

    it "provides a summary of the first post" 


    describe "#get_canonical_path" do
      let(:user) { Fabricate(:user) }
      let(:topic) { Fabricate(:topic) }
      let(:path) { "/1234" }

      before do
        topic.stubs(:relative_url).returns(path)
        TopicView.any_instance.stubs(:find_topic).with(1234).returns(topic)
      end

      it "generates canonical path correctly" 


      it "generates a canonical correctly for paged results" 

    end

    describe "#next_page" do
      let(:p2) { stub(post_number: 2) }
      let(:topic) do
        topic = create_topic
        topic.stubs(:highest_post_number).returns(5)
        topic
      end
      let(:user) { Fabricate(:user) }

      before do
        TopicView.any_instance.expects(:find_topic).with(1234).returns(topic)
        TopicView.any_instance.stubs(:filter_posts)
        TopicView.any_instance.stubs(:last_post).returns(p2)
        TopicView.stubs(:chunk_size).returns(2)
      end

      it "should return the next page" 

    end

    context '.post_counts_by_user' do
      it 'returns the two posters with their appropriate counts' 


      it "doesn't return counts for posts with authors who have been deleted" 

    end

    context '.participants' do
      it 'returns the two participants hashed by id' 

    end

    context '.all_post_actions' do
      it 'is blank at first' 


      it 'returns the like' 

    end

    context '.all_active_flags' do
      it 'is blank at first' 


      it 'returns the active flags' 


      it 'returns only the active flags' 

    end

    context '.read?' do
      it 'tracks correctly' 

    end

    context '.topic_user' do
      it 'returns nil when there is no user' 

    end

    context '#recent_posts' do
      before do
        24.times do |t| # our let()s have already created 3
          Fabricate(:post, topic: topic, user: first_poster, created_at: t.seconds.from_now)
        end
      end

      it 'returns at most 25 recent posts ordered newest first' 

    end

  end

  context 'whispers' do
    it "handles their visibility properly" 

  end

  context '#posts' do

    # Create the posts in a different order than the sort_order
    let!(:p5) { Fabricate(:post, topic: topic, user: evil_trout) }
    let!(:p2) { Fabricate(:post, topic: topic, user: evil_trout) }
    let!(:p6) { Fabricate(:post, topic: topic, user: Fabricate(:user), deleted_at: Time.now) }
    let!(:p4) { Fabricate(:post, topic: topic, user: evil_trout, deleted_at: Time.now) }
    let!(:p1) { Fabricate(:post, topic: topic, user: first_poster) }
    let!(:p7) { Fabricate(:post, topic: topic, user: evil_trout, deleted_at: Time.now) }
    let!(:p3) { Fabricate(:post, topic: topic, user: first_poster) }

    before do
      TopicView.stubs(:chunk_size).returns(3)

      # Update them to the sort order we're checking for
      [p1, p2, p3, p4, p5, p6, p7].each_with_index do |p, idx|
        p.sort_order = idx + 1
        p.save
      end
      p6.user_id = nil # user got nuked
      p6.save!
    end

    describe "contains_gaps?" do
      it "works" 

    end

    it "#restricts to correct topic" 


    describe '#filter_posts_paged' do
      before { TopicView.stubs(:chunk_size).returns(2) }

      it 'returns correct posts for all pages' 

    end

    describe '#filter_posts_by_post_number' do
      def create_topic_view(post_number)
        TopicView.new(
          topic.id,
          evil_trout,
          filter_post_number: post_number,
          asc: asc
        )
      end

      describe 'ascending' do
        let(:asc) { true }

        it 'should return the right posts' 

      end

      describe 'descending' do
        let(:asc) { false }

        it 'should return the right posts' 

      end
    end

    describe "filter_posts_near" do

      def topic_view_near(post, show_deleted = false)
        TopicView.new(topic.id, evil_trout, post_number: post.post_number, show_deleted: show_deleted)
      end

      it "snaps to the lower boundary" 


      it "snaps to the upper boundary" 


      it "returns the posts in the middle" 


      describe 'when post_number is too large' do
        it "snaps to the lower boundary" 

      end

      it "gaps deleted posts to an admin" 


      it "returns deleted posts to an admin with show_deleted" 


      it "gaps deleted posts by nuked users to an admin" 


      it "returns deleted posts by nuked users to an admin with show_deleted" 


      context "when 'posts per page' exceeds the number of posts" do
        before { TopicView.stubs(:chunk_size).returns(100) }

        it 'returns all the posts' 


        it 'gaps deleted posts to admins' 


        it 'returns deleted posts to admins' 

      end
    end
  end

  context "page_title" do
    let(:tag1) { Fabricate(:tag) }
    let(:tag2) { Fabricate(:tag, topic_count: 2) }

    subject { TopicView.new(topic.id, evil_trout).page_title }

    context "uncategorized topic" do
      context "topic_page_title_includes_category is false" do
        before { SiteSetting.topic_page_title_includes_category = false }
        it { should eq(topic.title) }
      end

      context "topic_page_title_includes_category is true" do
        before { SiteSetting.topic_page_title_includes_category = true }
        it { should eq(topic.title) }

        context "tagged topic" do
          before { topic.tags << [tag1, tag2] }

          context "tagging enabled" do
            before { SiteSetting.tagging_enabled = true }

            it { should start_with(topic.title) }
            it { should_not include(tag1.name) }
            it { should end_with(tag2.name) } # tag2 has higher topic count
          end

          context "tagging disabled" do
            before { SiteSetting.tagging_enabled = false }

            it { should start_with(topic.title) }
            it { should_not include(tag1.name) }
            it { should_not include(tag2.name) }
          end
        end
      end
    end

    context "categorized topic" do
      let(:category) { Fabricate(:category) }

      before { topic.update_attributes(category_id: category.id) }

      context "topic_page_title_includes_category is false" do
        before { SiteSetting.topic_page_title_includes_category = false }
        it { should eq(topic.title) }
      end

      context "topic_page_title_includes_category is true" do
        before { SiteSetting.topic_page_title_includes_category = true }
        it { should start_with(topic.title) }
        it { should end_with(category.name) }

        context "tagged topic" do
          before do
            SiteSetting.tagging_enabled = true
            topic.tags << [tag1, tag2]
          end

          it { should start_with(topic.title) }
          it { should end_with(category.name) }
          it { should_not include(tag1.name) }
          it { should_not include(tag2.name) }
        end
      end
    end
  end

  describe '#filtered_post_stream' do
    let!(:post) { Fabricate(:post, topic: topic, user: first_poster) }
    let!(:post2) { Fabricate(:post, topic: topic, user: evil_trout) }
    let!(:post3) { Fabricate(:post, topic: topic, user: first_poster) }

    it 'should return the right columns' 


    describe 'for mega topics' do
      it 'should return the right columns' 

    end
  end

  describe '#filtered_post_id' do
    it 'should return the right id' 

  end

  describe '#first_post_id and #last_post_id' do
    let!(:p3) { Fabricate(:post, topic: topic) }
    let!(:p2) { Fabricate(:post, topic: topic) }
    let!(:p1) { Fabricate(:post, topic: topic) }

    before do
      [p1, p2, p3].each_with_index do |post, index|
        post.update!(sort_order: index + 1)
      end
    end

    it 'should return the right id' 

  end
end

