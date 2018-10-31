require 'rails_helper'

RSpec.describe PetitionHelper, type: :helper do
  describe '#public_petition_facets_with_counts' do
    let(:public_petition_facets) { [:all, :open, :with_response] }
    before do
      def helper.public_petition_facets; end
      allow(helper).to receive(:public_petition_facets).and_return public_petition_facets
    end

    let(:facets) do
      {
        all: 100,
        open: 10,
        with_response: 20,
        hidden: 30
      }
    end
    let(:petition_search) { double(facets: facets) }

    subject { helper.public_petition_facets_with_counts(petition_search) }

    it 'returns each facet from the public facet list' 


    it 'returns each facet with its count from the search object' 


    it 'swallows the error and does not expose the facet if the search does not support it' 

  end

  describe "#current_threshold" do
    context "when the response threshold has never been reached" do
      let(:petition) { FactoryBot.create(:petition) }

      it "returns the response threshold" 

    end

    context "when the response threshold was reached recently" do
      let(:petition) { FactoryBot.create(:petition, response_threshold_reached_at: 1.days.ago )}

      it "returns the debate threshold" 

    end

    context "when the debate threshold was reached recently" do
      let(:petition) { FactoryBot.create(:petition, response_threshold_reached_at: 2.months.ago, debate_threshold_reached_at: 1.days.ago )}

      it "returns the debate threshold" 

    end

    context "when the response threshold was not reached but government has responded" do
      let(:petition) { FactoryBot.create(:petition, government_response_at: 2.days.ago) }

      it "returns the debate threshold" 

    end
  end

  describe "#signatures_threshold_percentage" do
    context "when the signature count is less than the response threshold" do
      let(:petition) { FactoryBot.create(:petition, signature_count: 239) }

      it "returns a percentage relative to the response threshold" 

    end

    context "when the signature count is greater than the response threshold and less than the debate threshold" do
      let(:petition) { FactoryBot.create(:petition, signature_count: 76239, response_threshold_reached_at: 1.day.ago) }

      it "returns a percentage relative to the debate threshold" 

    end

    context "when the signature count is greater than the debate threshold" do
      let(:petition) { FactoryBot.create(:petition, signature_count: 127989, debate_threshold_reached_at: 1.day.ago) }

      it "returns 100 percent" 

    end

    context "when the response threshold was not reached but government has responded" do
      let(:petition) { FactoryBot.create(:petition, signature_count: 9878, government_response_at: 2.days.ago) }

      it "returns a percentage relative to the debate threshold" 

    end

    context "when the actual percentage is less than 1" do
      let(:petition) { FactoryBot.create(:petition, signature_count: 22 )}

      it "returns 1%" 

    end
  end

  describe "#reveal_government_response?" do
    context "when the param 'reveal_response' isn't set" do
      it "returns false" 

    end

    context "when the param 'reveal_response' is set to 'no'" do
      before do
        params[:reveal_response] = "no"
      end

      it "returns false" 

    end

    context "when the param 'reveal_response' is set to 'yes'" do
      before do
        params[:reveal_response] = "yes"
      end

      it "returns true" 

    end
  end
end

