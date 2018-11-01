require "request_spec_helper"

describe "Receiving GitHub hooks", :request do
  include FixtureHelper

  before do
    stub_gists
    stub_deploy_statuses
  end

  describe "POST /events" do
    it "returns a forbidden error to invalid hosts" 


    it "returns a unprocessable error for invalid events" 


    it "handles ping events from valid hosts" 


    it "handles deployment events from valid hosts" 


    it "handles deployment status events from valid hosts" 

  end
end

