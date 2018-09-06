require 'rails_helper'

describe WatchedWord do
  let(:tl2_user) { Fabricate(:user, trust_level: TrustLevel[2]) }
  let(:admin) { Fabricate(:admin) }
  let(:moderator) { Fabricate(:moderator) }

  let(:topic) { Fabricate(:topic) }
  let(:first_post) { Fabricate(:post, topic: topic) }

  let(:require_approval_word) { Fabricate(:watched_word, action: WatchedWord.actions[:require_approval]) }
  let(:flag_word) { Fabricate(:watched_word, action: WatchedWord.actions[:flag]) }
  let(:block_word) { Fabricate(:watched_word, action: WatchedWord.actions[:block]) }

  after do
    $redis.flushall
  end

  context "block" do
    def should_block_post(manager)
      expect {
        result = manager.perform
        expect(result).to_not be_success
        expect(result.errors[:base]&.first).to eq(I18n.t('contains_blocked_words', word: block_word.word))
      }.to_not change { Post.count }
    end

    it "should prevent the post from being created" 


    it "look at title too" 


    it "should not block the post from admin" 


    it "should not block the post from moderator" 


    it "should block in a private message too" 


    it "blocks on revisions" 

  end

  context "require_approval" do
    it "should queue the post for approval" 


    it "looks at title too" 


    it "should not queue posts from admin" 


    it "should not queue posts from moderator" 


    it "doesn't need approval in a private message" 

  end

  context "flag" do
    def should_flag_post(author, raw, topic)
      post = Fabricate(:post, raw: raw, topic: topic, user: author)
      expect {
        Jobs::ProcessPost.new.execute(post_id: post.id)
      }.to change { PostAction.count }.by(1)
      expect(PostAction.where(post_id: post.id, post_action_type_id: PostActionType.types[:inappropriate]).exists?).to eq(true)
    end

    def should_not_flag_post(author, raw, topic)
      post = Fabricate(:post, raw: raw, topic: topic, user: author)
      expect {
        Jobs::ProcessPost.new.execute(post_id: post.id)
      }.to_not change { PostAction.count }
    end

    it "should flag the post as inappropriate" 


    it "should look at the title too" 


    it "shouldn't flag posts by admin" 


    it "shouldn't flag posts by moderator" 


    it "is compatible with flag_sockpuppets" 


    it "flags in private message too" 


    it "flags on revisions" 


    it "should not flag on rebake" 

  end
end

