require "rails_helper"

describe "claim_reviews/show.html.slim" do
  context "claimant collections" do
    include_context 'with controller dependencies for reviews'
    let(:review_page) do
      ET1::Test::ReviewPage.new
    end

    let(:null_object) { NullObject.new }
    let(:claimant_collection_section) { review_page.group_claim }

    let(:claim) { create :claim }

    before do
      render template: "claim_reviews/show", locals: {
        claim: claim,
        primary_claimant: claim.primary_claimant || null_object,
        representative: claim.representative || null_object,
        employment: claim.employment || null_object,
        respondent: claim.primary_respondent || null_object,
        secondary_claimants: claim.secondary_claimants,
        secondary_respondents: claim.secondary_respondents
      }
      review_page.load(rendered)
    end

    describe '#group_claim' do
      context 'with secondary claimants csv' do
        it 'presents "Yes"' 


        it 'presents the number of additional claimants' 


        it 'presents the csv file name' 


        it 'does not present a list of claimants' 

      end

      context 'with secondary claimants' do
        let(:claim) { create :claim, :without_additional_claimants_csv, :with_secondary_claimants }

        it 'presents the list of claimants' 

      end

      context 'without secondary claimants' do
        let(:claim) { create :claim, :single_claimant }

        it 'returns "No"' 

      end
    end
  end
end

