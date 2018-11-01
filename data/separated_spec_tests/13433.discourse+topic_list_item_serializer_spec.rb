require 'rails_helper'
require_dependency 'post_action'

describe TopicListItemSerializer do
  let(:topic) do
    date = Time.zone.now

    Fabricate.build(:topic,
      title: 'test',
      created_at: date - 2.minutes,
      bumped_at: date,
      posters: [],
    )
  end

  it "correctly serializes topic" 


  describe 'when topic featured link is disable' do
    before do
      SiteSetting.topic_featured_link_enabled = false
    end

    it "should not include the topic's featured link" 

  end

  describe 'hidden tags' do
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

