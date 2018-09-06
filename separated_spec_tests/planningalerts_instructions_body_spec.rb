require 'spec_helper'

describe "councillor_contributions/_instructions_body" do
  context "when the authority has a website url" do
    before do
      assign(
        :authority,
        create(:authority, full_name: "Example Council", website_url: "https://example.nsw.gov.au")
      )
    end

    it "render a link to the website" 

  end

  context "when the authority does not have a website url" do
    before do
      assign(
        :authority,
        create(:authority, full_name: "Example Council", website_url: nil)
      )
    end

    it "render its name with no link" 

  end
end

