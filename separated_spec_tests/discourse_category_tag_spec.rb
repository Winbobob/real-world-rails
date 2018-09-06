# encoding: UTF-8

require 'rails_helper'
require_dependency 'post_creator'

describe "category tag restrictions" do

  def sorted_tag_names(tag_records)
    tag_records.map(&:name).sort
  end

  def filter_allowed_tags(opts = {})
    DiscourseTagging.filter_allowed_tags(Tag.all, Guardian.new(user), opts)
  end

  let!(:tag1) { Fabricate(:tag, name: 'tag1') }
  let!(:tag2) { Fabricate(:tag, name: 'tag2') }
  let!(:tag3) { Fabricate(:tag, name: 'tag3') }
  let!(:tag4) { Fabricate(:tag, name: 'tag4') }

  let(:user)  { Fabricate(:user) }
  let(:admin) { Fabricate(:admin) }

  before do
    SiteSetting.tagging_enabled = true
    SiteSetting.min_trust_to_create_tag = 0
    SiteSetting.min_trust_level_to_tag_topics = 0
  end

  context "tags restricted to one category" do
    let(:category_with_tags) { Fabricate(:category) }
    let(:other_category)     { Fabricate(:category) }

    before do
      category_with_tags.tags = [tag1, tag2]
    end

    it "tags belonging to that category can only be used there" 


    it "search can show only permitted tags" 


    it "can't create new tags in a restricted category" 


    it "can create new tags in a non-restricted category" 


    it "can create tags when changing category settings" 

  end

  context "tag groups restricted to a category" do
    let!(:tag_group1)     { Fabricate(:tag_group) }
    let(:category)        { Fabricate(:category) }
    let(:other_category)  { Fabricate(:category) }

    before do
      tag_group1.tags = [tag1, tag2]
    end

    it "tags in the group are used by category tag restrictions" 


    it "groups and individual tags can be mixed" 


    it "enforces restrictions when creating a topic" 

  end

  context "tag groups with parent tag" do
    it "filter_allowed_tags returns results based on whether parent tag is present or not" 


    context "and category restrictions" do
      let(:car_category)    { Fabricate(:category) }
      let(:other_category)  { Fabricate(:category) }
      let(:makes)           { Fabricate(:tag_group, name: "Makes") }
      let(:honda_group)     { Fabricate(:tag_group, name: "Honda Models") }
      let(:ford_group)      { Fabricate(:tag_group, name: "Ford Models") }

      before do
        @tags = {}
        ['honda', 'ford', 'civic', 'accord', 'mustang', 'taurus'].each do |name|
          @tags[name] = Fabricate(:tag, name: name)
        end

        makes.tags = [@tags['honda'], @tags['ford']]

        honda_group.parent_tag_id = @tags['honda'].id
        honda_group.save
        honda_group.tags = [@tags['civic'], @tags['accord']]

        ford_group.parent_tag_id = @tags['ford'].id
        ford_group.save
        ford_group.tags = [@tags['mustang'], @tags['taurus']]

        car_category.allowed_tag_groups = [makes.name, honda_group.name, ford_group.name]
      end

      it "handles all those rules" 


      it "can apply the tags to a topic" 


      context "limit one tag from each group" do
        before do
          makes.update_attributes(one_per_topic: true)
          honda_group.update_attributes(one_per_topic: true)
          ford_group.update_attributes(one_per_topic: true)
        end

        it "can restrict one tag from each group" 


        it "can apply the tags to a topic" 


        it "can remove extra tags from the same group" 

      end
    end
  end
end

describe "tag topic counts per category" do
  let(:user)  { Fabricate(:user) }
  let(:admin) { Fabricate(:admin) }
  let(:category) { Fabricate(:category) }
  let(:category2) { Fabricate(:category) }
  let(:tag1) { Fabricate(:tag) }
  let(:tag2) { Fabricate(:tag) }
  let(:tag3) { Fabricate(:tag) }

  before do
    SiteSetting.tagging_enabled = true
    SiteSetting.min_trust_to_create_tag = 0
    SiteSetting.min_trust_level_to_tag_topics = 0
  end

  it "counts when a topic is created with tags" 


  it "counts when tag is added to an existing topic" 


  context "topic with 2 tags" do
    let(:topic) { Fabricate(:topic, category: category, tags: [tag1, tag2]) }
    let(:post)  { Fabricate(:post, user: topic.user, topic: topic) }

    it "has correct counts after tag is removed from a topic" 


    it "has correct counts after a topic's category changes" 


    it "has correct counts after topic's category AND tags changed" 

  end

  context "topic with one tag" do
    let(:topic) { Fabricate(:topic, tags: [tag1], category: category) }
    let(:post) { Fabricate(:post, user: topic.user, topic: topic) }

    it "counts after topic becomes uncategorized" 


    it "updates counts after topic is deleted" 


    it "updates counts after topic is recovered" 

  end
end

