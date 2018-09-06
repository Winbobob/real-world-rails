require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  describe "#no_petitions_yet?" do
    let(:connection) { Petition.connection }
    let(:sql) { /^SELECT COUNT/ }

    it "performs a count query" 


    it "it caches the result" 


    context "when there are no published petitions" do
      before do
        FactoryBot.create(:pending_petition)
      end

      it "returns true" 

    end

    Petition::VISIBLE_STATES.each do |state|
      context "when there is a #{state} petition" do
        before do
          FactoryBot.create(:"#{state}_petition")
        end

        it "returns false" 

      end
    end
  end

  describe "#petition_count" do
    describe "for counting government responses" do
      it "returns a HTML-safe string" 


      context "when the petition count is 1" do
        it "returns a correctly formatted petition count" 

      end

      context "when the petition count is 100" do
        it "returns a correctly formatted petition count" 

      end

      context "when the petition count is 1000" do
        it "returns a correctly formatted petition count" 

      end
    end

    describe "for counting debated petitions" do
      it "returns a HTML-safe string" 


      context "when the petition count is 1" do
        it "returns a correctly formatted petition count" 

      end

      context "when the petition count is 100" do
        it "returns a correctly formatted petition count" 

      end

      context "when the petition count is 1000" do
        it "returns a correctly formatted petition count" 

      end
    end
  end

  describe "#any_actioned_petitions?" do
    let!(:pending_petition) { FactoryBot.create :pending_petition }
    let!(:hidden_petition) { FactoryBot.create :hidden_petition }
    let!(:open_petition) { FactoryBot.create :open_petition }

    describe "when there is an actioned petition" do
      let!(:responded_petition) { FactoryBot.create :responded_petition }

      it "returns true" 

    end

    describe "when there are no actioned petitions" do
      it "returns false" 

    end
  end
end

