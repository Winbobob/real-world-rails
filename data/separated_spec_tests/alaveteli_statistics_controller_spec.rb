require "spec_helper"

describe StatisticsController do
  describe "#index" do

    before do
      allow(AlaveteliConfiguration).
        to receive(:minimum_requests_for_statistics).and_return 1
      allow(AlaveteliConfiguration).
        to receive(:public_body_statistics_page).and_return true
    end

    it "uses the date of the first public request as the start_date" 


    it "should render the right template with the right data" 

  end
end

