require 'rails_helper'

describe TagsController do
  before do
    SiteSetting.tagging_enabled = true
  end

  describe '#index' do

    before do
      Fabricate(:tag, name: 'test')
      Fabricate(:tag, name: 'topic-test', topic_count: 1)
    end

    shared_examples "successfully retrieve tags with topic_count > 0" do
      it "should return the right response" 

    end

    context "with tags_listed_by_group enabled" do
      before { SiteSetting.tags_listed_by_group = true }
      include_examples "successfully retrieve tags with topic_count > 0"
    end

    context "with tags_listed_by_group disabled" do
      before { SiteSetting.tags_listed_by_group = false }
      include_examples "successfully retrieve tags with topic_count > 0"
    end

    context "when user can admin tags" do

      it "succesfully retrieve all tags" 


    end
  end

  describe '#show' do
    before do
      Fabricate(:tag, name: 'test')
    end

    it "should return the right response" 


    it "should handle invalid tags" 

  end

  describe '#check_hashtag' do
    let(:tag) { Fabricate(:tag, name: 'test') }

    it "should return the right response" 

  end

  describe "#update" do
    let(:tag) { Fabricate(:tag) }
    let(:admin) { Fabricate(:admin) }

    before do
      tag
      sign_in(admin)
    end

    it "triggers a extensibility event" 

  end

  describe '#personal_messages' do
    let(:regular_user) { Fabricate(:trust_level_4) }
    let(:moderator) { Fabricate(:moderator) }
    let(:admin) { Fabricate(:admin) }
    let(:personal_message) do
      Fabricate(:private_message_topic, user: regular_user, topic_allowed_users: [
        Fabricate.build(:topic_allowed_user, user: regular_user),
        Fabricate.build(:topic_allowed_user, user: moderator),
        Fabricate.build(:topic_allowed_user, user: admin)
      ])
    end

    before do
      SiteSetting.allow_staff_to_tag_pms = true
      Fabricate(:tag, topics: [personal_message], name: 'test')
    end

    context "as a regular user" do
      it "can't see pm tags" 

    end

    context "as an moderator" do
      before do
        sign_in(moderator)
      end

      it "can't see pm tags for regular user" 


      it "can see their own pm tags" 

    end

    context "as an admin" do
      before do
        sign_in(admin)
      end

      it "can see pm tags for regular user" 


      it "can see their own pm tags" 

    end
  end

  describe '#show_latest' do
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

  describe '#search' do
    context 'tagging disabled' do
      it "returns 404" 

    end

    context 'tagging enabled' do
      it "can return some tags" 


      it "returns tags ordered by topic_count, and prioritises exact matches" 


      it "can say if given tag is not allowed" 


      it "matches tags after sanitizing input" 


      it "can return tags that are in secured categories but are allowed to be used" 


      it "supports Chinese and Russian" 

    end
  end

  describe '#destroy' do
    context 'tagging enabled' do
      before do
        sign_in(Fabricate(:admin))
      end

      context 'with an existent tag name' do
        it 'deletes the tag' 

      end

      context 'with a nonexistent tag name' do
        it 'returns a tag not found message' 

      end
    end
  end

  context '#upload_csv' do
    it 'requires you to be logged in' 


    context 'while logged in' do
      let(:csv_file) { File.new("#{Rails.root}/spec/fixtures/csv/tags.csv") }
      let(:invalid_csv_file) { File.new("#{Rails.root}/spec/fixtures/csv/tags_invalid.csv") }

      let(:file) do
        Rack::Test::UploadedFile.new(File.open(csv_file))
      end

      let(:invalid_file) do
        Rack::Test::UploadedFile.new(File.open(invalid_csv_file))
      end

      let(:filename) { 'tags.csv' }

      it "fails if you can't manage tags" 


      it "allows staff to bulk upload tags" 


      it "fails gracefully with invalid input" 

    end
  end
end

