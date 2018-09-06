require 'rails_helper'

describe TagsController do
  describe 'show_latest' do
    let(:tag)         { Fabricate(:tag) }
    let(:other_tag)   { Fabricate(:tag) }
    let(:third_tag)   { Fabricate(:tag) }
    let(:category)    { Fabricate(:category) }
    let(:subcategory) { Fabricate(:category, parent_category_id: category.id) }

    let(:single_tag_topic) { Fabricate(:topic, tags: [tag]) }
    let(:multi_tag_topic)  { Fabricate(:topic, tags: [tag, other_tag]) }
    let(:all_tag_topic)    { Fabricate(:topic, tags: [tag, other_tag, third_tag]) }

    context 'tagging disabled' do
      it "returns 404" 

    end

    context 'tagging enabled' do
      before do
        SiteSetting.tagging_enabled = true
      end

      it "can filter by tag" 


      it "can filter by two tags" 


      it "can filter by multiple tags" 


      it "does not find any tags when a tag which doesn't exist is passed" 


      it "can filter by category and tag" 


      it "can filter by category, sub-category, and tag" 


      it "can filter by category, no sub-category, and tag" 


      it "can handle subcategories with the same name" 


      it "can filter by bookmarked" 

    end
  end

  describe 'search' do
    context 'tagging disabled' do
      it "returns 404" 

    end

    context 'tagging enabled' do
      before do
        SiteSetting.tagging_enabled = true
      end

      it "can return some tags" 


      it "can say if given tag is not allowed" 


      it "can return tags that are in secured categories but are allowed to be used" 


      it "supports Chinese and Russian" 

    end
  end

  describe 'destroy' do
    context 'tagging enabled' do
      before do
        log_in(:admin)
        SiteSetting.tagging_enabled = true
      end

      context 'with an existent tag name' do
        it 'deletes the tag' 

      end

      context 'with a nonexistent tag name' do
        it 'returns a tag not found message' 

      end
    end
  end
end

