require 'rails_helper'
require_dependency 'post_action'

describe PostSerializer do

  context "a post with lots of actions" do
    let(:post) { Fabricate(:post) }
    let(:actor) { Fabricate(:user) }
    let(:admin) { Fabricate(:admin) }
    let(:acted_ids) {
      PostActionType.public_types.values
        .concat([:notify_user, :spam].map { |k| PostActionType.types[k] })
    }

    def visible_actions_for(user)
      serializer = PostSerializer.new(post, scope: Guardian.new(user), root: false)
      # NOTE this is messy, we should extract all this logic elsewhere
      serializer.post_actions = PostAction.counts_for([post], actor)[post.id] if user.try(:id) == actor.id
      actions = serializer.as_json[:actions_summary]
      lookup = PostActionType.types.invert
      actions.keep_if { |a| (a[:count] || 0) > 0 }.map { |a| lookup[a[:id]] }
    end

    before do
      acted_ids.each do |id|
        PostAction.act(actor, post, id)
      end
      post.reload
    end

    it "displays the correct info" 


    it "can't flag your own post to notify yourself" 

  end

  context "a post by a nuked user" do
    let!(:post) { Fabricate(:post, user: Fabricate(:user), deleted_at: Time.zone.now) }

    before do
      post.user_id = nil
      post.save!
    end

    subject { PostSerializer.new(post, scope: Guardian.new(Fabricate(:admin)), root: false).as_json }

    it "serializes correctly" 

  end

  context "display_username" do
    let(:user) { Fabricate.build(:user) }
    let(:post) { Fabricate.build(:post, user: user) }
    let(:serializer) { PostSerializer.new(post, scope: Guardian.new, root: false) }
    let(:json) { serializer.as_json }

    it "returns the display_username it when `enable_names` is on" 


    it "doesn't return the display_username it when `enable_names` is off" 

  end

  context "a hidden post with add_raw enabled" do
    let(:user) { Fabricate.build(:user) }
    let(:raw)  { "Raw contents of the post." }

    def serialized_post_for_user(u)
      s = PostSerializer.new(post, scope: Guardian.new(u), root: false)
      s.add_raw = true
      s.as_json
    end

    context "a public post" do
      let(:post) { Fabricate.build(:post, raw: raw, user: user) }

      it "includes the raw post for everyone" 

    end

    context "a hidden post" do
      let(:post) { Fabricate.build(:post, raw: raw, user: user, hidden: true, hidden_reason_id: Post.hidden_reasons[:flag_threshold_reached]) }

      it "shows the raw post only if authorized to see it" 


      it "can view edit history only if authorized" 

    end

    context "a public wiki post" do
      let(:post) { Fabricate.build(:post, raw: raw, user: user, wiki: true) }

      it "can view edit history" 

    end

    context "a hidden wiki post" do
      let(:post) { Fabricate.build(:post, raw: raw, user: user, wiki: true, hidden: true, hidden_reason_id: Post.hidden_reasons[:flag_threshold_reached]) }

      it "can view edit history only if authorized" 

    end

  end

end

