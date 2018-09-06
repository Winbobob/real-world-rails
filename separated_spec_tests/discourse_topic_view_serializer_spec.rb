require 'rails_helper'

describe TopicViewSerializer do
  def serialize_topic(topic, user_arg)
    topic_view = TopicView.new(topic.id, user_arg)
    described_class.new(topic_view, scope: Guardian.new(user_arg), root: false).as_json
  end

  let(:topic) { Fabricate(:topic) }
  let(:user) { Fabricate(:user) }
  let(:admin) { Fabricate(:admin) }

  describe '#featured_link and #featured_link_root_domain' do
    let(:featured_link) { 'http://meta.discourse.org' }

    describe 'when topic featured link is disable' do
      it 'should return the right attributes' 

    end

    describe 'when topic featured link is enabled' do
      it 'should return the right attributes' 

    end
  end

  describe '#suggested_topics' do
    let(:topic2) { Fabricate(:topic) }

    before do
      TopicUser.update_last_read(user, topic2.id, 0, 0, 0)
    end

    describe 'when loading last chunk' do
      it 'should include suggested topics' 

    end

    describe 'when not loading last chunk' do
      let(:post) { Fabricate(:post, topic: topic) }
      let(:post2) { Fabricate(:post, topic: topic) }

      it 'should not include suggested topics' 

    end
  end

  describe 'when tags added to private message topics' do
    let(:moderator) { Fabricate(:moderator) }
    let(:tag) { Fabricate(:tag) }
    let(:pm) do
      Fabricate(:private_message_topic, tags: [tag], topic_allowed_users: [
        Fabricate.build(:topic_allowed_user, user: moderator),
        Fabricate.build(:topic_allowed_user, user: user)
      ])
    end

    before do
      SiteSetting.tagging_enabled = true
      SiteSetting.allow_staff_to_tag_pms = true
    end

    it "should not include the tag for normal users" 


    it "should include the tag for staff users" 


    it "should not include the tag if pm tags disabled" 

  end

  describe 'with hidden tags' do
    let(:hidden_tag) { Fabricate(:tag, name: 'hidden') }
    let(:staff_tag_group) { Fabricate(:tag_group, permissions: { "staff" => 1 }, tag_names: [hidden_tag.name]) }

    before do
      SiteSetting.tagging_enabled = true
      staff_tag_group
      topic.tags << hidden_tag
    end

    it 'returns hidden tag to staff' 


    it 'does not return hidden tag to non-staff' 

  end
end

