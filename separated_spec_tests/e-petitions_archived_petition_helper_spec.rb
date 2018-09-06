require 'rails_helper'

RSpec.describe ArchivedPetitionHelper, type: :helper do
  let(:parliament) { FactoryBot.create(:parliament, threshold_for_response: 500, threshold_for_debate: 5000) }

  describe "#archived_threshold" do
    context "when the response threshold has never been reached" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 50) }

      it "returns the response threshold" 

    end

    context "when the response threshold was reached but the government never responded" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 550) }

      it "returns the debate threshold" 

    end

    context "when the response threshold was reached and the government responded" do
      let(:petition) { FactoryBot.create(:archived_petition, :response, parliament: parliament, response_details: "Petition response", signature_count: 550) }

      it "returns the debate threshold" 

    end

    context "when the response threshold was not reached but the government has responded" do
      let(:petition) { FactoryBot.create(:archived_petition, :response, parliament: parliament, response_details: "Petition response", signature_count: 50) }

      it "returns the debate threshold" 

    end

    context "when the debate threshold was reached but the government never responded" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 5500) }

      it "returns the debate threshold" 

    end

    context "when the debate threshold was reached and the government responded" do
      let(:petition) { FactoryBot.create(:archived_petition, :response, parliament: parliament, response_details: "Petition response", signature_count: 5500) }

      it "returns the debate threshold" 

    end
  end

  describe "#archived_threshold_percentage" do
    context "when the signature count is less than the response threshold" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 18) }

      it "returns a percentage relative to the response threshold" 

    end

    context "when the signature count is greater than the response threshold and less than the debate threshold" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 625) }

      it "returns a percentage relative to the debate threshold" 

    end

    context "when the signature count is greater than the debate threshold" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 5500) }

      it "returns 100 percent" 

    end

    context "when the response threshold was not reached but government has responded" do
      let(:petition) { FactoryBot.create(:archived_petition, :response, parliament: parliament, response_details: "Petition response", signature_count: 275) }

      it "returns a percentage relative to the debate threshold" 

    end

    context "when the actual percentage is less than 1" do
      let(:petition) { FactoryBot.create(:archived_petition, parliament: parliament, signature_count: 2) }

      it "returns 1%" 

    end
  end

  describe "#archived_parliaments" do
    let!(:parliament) { FactoryBot.create(:parliament) }
    let!(:archived_parliament) { FactoryBot.create(:parliament, :archived) }
    let!(:dissolved_parliament) { FactoryBot.create(:parliament, :dissolved) }

    it "includes archived parliaments" 


    it "excludes parliaments that are current" 


    it "excludes parliaments that are dissolved" 

  end

  describe "#archived_petition_facets_with_counts" do
    let(:archived_petition_facets) do
      Module.new do
        def archived_petition_facets
          [:all, :published, :rejected]
        end
      end
    end

    let(:petitions) { Archived::Petition.search({}) }

    subject { helper.archived_petition_facets_with_counts(petitions) }

    before do
      FactoryBot.create(:archived_petition, :closed)
      FactoryBot.create(:archived_petition, :rejected)

      helper.extend(archived_petition_facets)
    end

    it "returns each facet with its count" 


    context "when a facet is not defined" do
      let(:archived_petition_facets) do
        Module.new do
          def archived_petition_facets
            [:all, :published, :rejected, :unknown]
          end
        end
      end

      it "does not expose the facet" 

    end
  end

  describe "#petition_duration_to_words" do
    context "when the duration is an integer" do
      it "returns the exact number of months as a string" 

    end

    context "when the duration is 0 months" do
      it "pluralizes the string correctly" 

    end

    context "when the duration is 1 month" do
      it "pluralizes the string correctly" 

    end

    context "when the duration fraction is less than 0.25" do
      it "returns an approximate number of months" 

    end

    context "when the duration fraction is between 0.25 and 0.75" do
      it "returns an approximate number of months" 

    end

    context "when the duration fraction is greater than 0.75" do
      it "returns an approximate number of months" 

    end
  end
end

