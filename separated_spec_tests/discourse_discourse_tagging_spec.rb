# encoding: UTF-8

require 'rails_helper'
require 'discourse_tagging'

# More tests are found in the category_tag_spec integration specs

describe DiscourseTagging do

  let(:admin) { Fabricate(:admin) }
  let(:user)  { Fabricate(:user) }

  let!(:tag1) { Fabricate(:tag, name: "fun") }
  let!(:tag2) { Fabricate(:tag, name: "fun2") }
  let!(:tag3) { Fabricate(:tag, name: "fun3") }

  before do
    SiteSetting.tagging_enabled = true
    SiteSetting.min_trust_to_create_tag = 0
    SiteSetting.min_trust_level_to_tag_topics = 0
  end

  describe 'filter_allowed_tags' do
    context 'for input fields' do
      it "doesn't return selected tags if there's a search term" 


      it "doesn't return selected tags if there's no search term" 


      context 'with tags visible only to staff' do
        let(:hidden_tag) { Fabricate(:tag) }
        let!(:staff_tag_group) { Fabricate(:tag_group, permissions: { "staff" => 1 }, tag_names: [hidden_tag.name]) }

        it 'should return all tags to staff' 


        it 'should not return hidden tag to non-staff' 

      end
    end
  end

  describe 'filter_visible' do
    let(:hidden_tag) { Fabricate(:tag) }
    let!(:staff_tag_group) { Fabricate(:tag_group, permissions: { "staff" => 1 }, tag_names: [hidden_tag.name]) }
    let(:topic) { Fabricate(:topic, tags: [tag1, tag2, tag3, hidden_tag]) }

    it 'returns all tags to staff' 


    it 'does not return hidden tags to non-staff' 


    it 'returns staff only tags to everyone' 

  end

  describe 'tag_topic_by_names' do
    context 'staff-only tags' do
      let(:topic) { Fabricate(:topic) }

      before do
        create_staff_tags(['alpha'])
      end

      it "regular users can't add staff-only tags" 


      it 'staff can add staff-only tags' 

    end

    context 'respects category minimum_required_tags setting' do
      let(:category) { Fabricate(:category, minimum_required_tags: 2) }
      let(:topic) { Fabricate(:topic, category: category) }

      it 'when tags are not present' 


      it 'when tags are less than minimum_required_tags' 


      it 'when tags are equal to minimum_required_tags' 


      it 'lets admin tag a topic regardless of minimum_required_tags' 

    end

    context 'hidden tags' do
      let(:hidden_tag) { Fabricate(:tag) }
      let!(:staff_tag_group) { Fabricate(:tag_group, permissions: { "staff" => 1 }, tag_names: [hidden_tag.name]) }
      let(:topic) { Fabricate(:topic, user: user) }
      let(:post) { Fabricate(:post, user: user, topic: topic, post_number: 1) }

      it 'user cannot add hidden tag by knowing its name' 


      it 'admin can add hidden tag' 


      it 'user does not get an error when editing their topic with a hidden tag' 

    end
  end
end

