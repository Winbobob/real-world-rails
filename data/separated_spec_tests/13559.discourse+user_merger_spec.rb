require 'rails_helper'

describe UserMerger do
  let!(:target_user) { Fabricate(:user_single_email, username: 'alice', email: 'alice@example.com') }
  let!(:source_user) { Fabricate(:user_single_email, username: 'alice1', email: 'alice@work.com') }
  let(:walter) { Fabricate(:walter_white) }

  def merge_users!(source = nil, target =  nil)
    source ||= source_user
    target ||= target_user
    UserMerger.new(source, target).merge!
  end

  it "changes owner of topics and posts" 


  it "changes owner of personal messages" 


  it "changes owner of categories" 


  it "merges category notification settings" 


  context "developer flag" do
    it "moves the developer flag when the target user isn't a developer yet" 


    it "deletes the source's developer flag when the target user is already a developer" 

  end

  context "drafts" do
    def create_draft(user, key, text)
      seq = DraftSequence.next!(user, key)
      Draft.set(user, key, seq, text)
    end

    def current_target_user_draft(key)
      seq = DraftSequence.current(target_user, key)
      Draft.get(target_user, key, seq)
    end

    it "merges drafts" 

  end

  it "updates email logs" 


  context "likes" do
    def given_daily_like_count_for(user, date)
      GivenDailyLike.find_for(user.id, date).pluck(:likes_given)[0] || 0
    end

    it "merges likes" 

  end

  it "updates group history" 


  it "merges group memberships" 


  it "updates incoming emails" 


  it "updates incoming links" 


  it "updates invites" 


  it "merges muted users" 


  context "notifications" do
    it "updates notifications" 

  end

  context "post actions" do
    it "merges post actions" 


    it "updates post actions" 

  end

  it "updates post revisions" 


  context "post timings" do
    def create_post_timing(post, user, msecs)
      PostTiming.create!(
        topic_id: post.topic_id,
        post_number: post.post_number,
        user_id: user.id,
        msecs: msecs
      )
    end

    def post_timing_msecs_for(post, user)
      PostTiming.where(
        topic_id: post.topic_id,
        post_number: post.post_number,
        user_id: user.id
      ).pluck(:msecs)[0] || 0
    end

    it "merges post timings" 

  end

  context "posts" do
    it "updates user ids of posts" 


    it "updates post action counts" 

  end

  it "updates queued posts" 


  describe 'search logs' do
    after do
      SearchLog.clear_debounce_cache!
    end

    it "updates search log entries" 

  end

  it "merges tag notification settings" 


  it "updates themes" 


  it "merges allowed users for topics" 


  it "updates topic embeds" 


  it "updates topic links" 


  context "topic timers" do
    def create_topic_timer(topic, user, status_type, deleted_by = nil)
      timer = Fabricate(:topic_timer, topic: topic, user: user, status_type: TopicTimer.types[status_type])
      timer.trash!(deleted_by) if deleted_by
      timer.reload
    end

    it "merges topic timers" 

  end

  it "merges topic notification settings" 


  it "merges topic views" 


  it "updates topics" 


  it "updates unsubscribe keys" 


  it "updates uploads" 


  context "user actions" do
    # action_type and user_id are not nullable
    # target_topic_id and acting_user_id are nullable, but always have a value

    let(:post1) { Fabricate(:post) }
    let(:post2) { Fabricate(:post) }
    let(:post3) { Fabricate(:post) }

    def log_pending_action(user, post)
      UserAction.log_action!(action_type: UserAction::PENDING,
                             user_id: user.id,
                             acting_user_id: user.id,
                             target_topic_id: post.topic.id,
                             queued_post_id: post.id)
    end

    def log_like_action(acting_user, user, post)
      UserAction.log_action!(action_type: UserAction::LIKE,
                             user_id: user.id,
                             acting_user_id: acting_user.id,
                             target_topic_id: post.topic_id,
                             target_post_id: post.id)
    end

    def log_got_private_message(acting_user, user, topic)
      UserAction.log_action!(action_type: UserAction::GOT_PRIVATE_MESSAGE,
                             user_id: user.id,
                             acting_user_id: acting_user.id,
                             target_topic_id: topic.id,
                             target_post_id: -1)
    end

    it "merges when target_post_id is not set" 


    it "merges when target_post_id is set" 


    it "merges when acting_user is neither source_user nor target_user" 

  end

  it "merges archived messages" 


  context "badges" do
    def create_badge(badge, user, opts = {})
      UserBadge.create!(
        badge: badge,
        user: user,
        granted_by: opts[:granted_by] || Discourse.system_user,
        granted_at: opts[:granted_at] || Time.now,
        post: opts[:post],
        seq: opts[:seq] || 0
      )
    end

    it "merges user badges" 


    it "updates granted_by for user badges" 

  end

  it "merges user custom fields" 


  it "merges email addresses" 


  it "skips merging email adresses when a secondary email address exists" 


  it "updates exports" 


  it "updates user history" 


  it "updates user profile views" 


  it "merges user visits" 


  it "updates user warnings" 


  it "triggers :merging_users event" 


  context "site settings" do
    it "updates usernames in site settings" 


    it "updates only the old username in site settings" 

  end

  it "updates users" 


  it "deletes the source user even when it's an admin" 


  it "deletes the source user even when it is a member of a group that grants a trust level" 


  it "deletes external auth infos of source user" 


  it "deletes auth tokens" 


  it "cleans up all remaining references to the source user" 


  it "updates the username" 


  it "correctly logs the merge" 

end

