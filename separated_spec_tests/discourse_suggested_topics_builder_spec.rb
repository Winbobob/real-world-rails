require 'rails_helper'
require 'suggested_topics_builder'

describe SuggestedTopicsBuilder do

  let(:topic) { Fabricate(:topic) }
  let(:builder) { SuggestedTopicsBuilder.new(topic) }

  before do
    SiteSetting.suggested_topics = 5
  end

  context "splicing category results" do

    def fake_topic(topic_id, category_id)
      build(:topic, id: topic_id, category_id: category_id)
    end

    let(:builder) do
      SuggestedTopicsBuilder.new(fake_topic(1, 1))
    end

    it "prioritizes category correctly" 


    it "inserts using default approach for non high priority" 


    it "inserts multiple results and puts topics in the correct order" 

  end

  it "has the correct defaults" 


  it "returns full correctly" 


  context "adding results" do

    it "adds nothing with nil results" 


    context "adding topics" do
      let!(:other_topic) { Fabricate(:topic) }

      before do
        # Add all topics
        builder.add_results(Topic)
      end

      it "added the result correctly" 


    end

    context "adding topics that are not open" do
      let!(:archived_topic) { Fabricate(:topic, archived: true) }
      let!(:closed_topic) { Fabricate(:topic, closed: true) }
      let!(:invisible_topic) { Fabricate(:topic, visible: false) }

      it "adds archived and closed, but not invisible topics" 

    end

    context "category definition topics" do
      let!(:category) { Fabricate(:category) }

      it "doesn't add a category definition topic" 

    end

  end

end

