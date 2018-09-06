require "rails_helper"

describe Organizer::ProposalMailerTemplate do
  let(:event) { create(:event) }
  let(:proposal) { create(:proposal, event: event) }

  describe "render" do
    it "converts double linefeeds to paragraphs" 


    it "converts double carriage returns/linefeeds to paragraphs" 


    it "passes unknown tags as themselves" 


    it "substitutes proposal title" 


    it "substitutes confirmation link" 


    it "only substitutes whitelisted tags" 

  end
end

