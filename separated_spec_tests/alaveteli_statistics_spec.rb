require "spec_helper"

describe "Site statistics" do
  before :each do
    config = MySociety::Config.load_default
    config['MINIMUM_REQUESTS_FOR_STATISTICS'] = 1
    config['PUBLIC_BODY_STATISTICS_PAGE'] = true
  end

  describe "for public bodies" do
    it "should include all requests except hidden requests in the total count" 

  end
end

