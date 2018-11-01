require 'rails_helper'

RSpec.describe AdminHubHelper, type: :helper do
  describe "moderation count helpers" do
    let!(:tag) { FactoryBot.create(:tag, name: "one") }
    let!(:petition_recently_in_moderation) { FactoryBot.create(:sponsored_petition, :recent) }
    let!(:petition_nearly_overdue_moderation) { FactoryBot.create(:sponsored_petition, :nearly_overdue) }
    let!(:petition_overdue_moderation) { FactoryBot.create(:sponsored_petition, :overdue) }
    let!(:tagged_in_moderation_petition) { FactoryBot.create(:sponsored_petition, tags: [tag.id]) }

    describe "in_moderation_count" do
      it "returns the number in moderation" 

    end

    describe "recently_in_moderation_count" do
      it "returns the number recently in moderation" 

    end

    describe "recently_in_moderation_untagged_count" do
      it "returns the number recently in moderation that are untagged" 

    end

    describe "nearly_overdue_in_moderation_count" do
      it "returns the number nearly overdue moderation" 

    end

    describe "nearly_overdue_in_moderation_untagged_count" do
      it "returns the number nearly overdue moderation that are untagged" 

    end

    describe "overdue_in_moderation_count" do
      it "returns the number overdue moderation" 

    end

    describe "overdue_in_moderation_untagged_count" do
      it "returns the number overdue moderation that are untagged" 

    end

    describe "tagged_in_moderation_count" do
      it "returns the number of tagged petitions" 

    end

    describe "untagged_in_moderation_count" do
      it "returns the number of untagged petitions" 

    end
  end

  describe "#summary_class_name_for_in_moderation" do
    before { FactoryBot.create(:sponsored_petition, :recent) }

    context "when there are no overdue and nearly overdue petitions" do
      it "returns the CSS class name 'queue-stable'" 

    end

    context "when there are no overdue but there are nearly overdue petitions" do
      before { FactoryBot.create(:sponsored_petition, :nearly_overdue) }

      it "returns the CSS class name 'queue-caution'" 

    end

    context "when there are overdue petitions" do
      before { FactoryBot.create(:sponsored_petition, :overdue) }

      it "returns the CSS class name 'queue-danger'" 

    end
  end

  describe "#action_count" do
    describe "for counting the moderation queue" do
      it "returns a HTML-safe string" 


      context "when the action count is 1" do
        it "returns a correctly formatted action count" 

      end

      context "when the action count is 1000" do
        it "returns a correctly formatted action count" 

      end
    end

    describe "for counting the government response queue" do
      it "returns a HTML-safe string" 


      context "when the action count is 1" do
        it "returns a correctly formatted action count" 

      end

      context "when the action count is 1000" do
        it "returns a correctly formatted action count" 

      end
    end

    describe "for counting the debate queue" do
      it "returns a HTML-safe string" 


      context "when the action count is 1" do
        it "returns a correctly formatted action count" 

      end

      context "when the action count is 1000" do
        it "returns a correctly formatted action count" 

      end
    end
  end
end

