require 'spec_helper'

describe CouncillorContributionsController do
  let(:authority) do
    create(:authority, full_name: "Casey City Council", website_url: "http://www.casey.vic.gov.au")
  end

  context "when the feature flag is on" do
    around do |test|
      with_modified_env CONTRIBUTE_COUNCILLORS_ENABLED: "true" do
        test.run
      end
    end

    describe "#show" do
      it "returns a valid CSV file with the contribution" 

    end

    describe "#index" do
      it "renders accepted councillor contributions in json format in reverse chronological order" 


      it "doesn't include contributions that aren't marked accepted" 

    end
  end
end

