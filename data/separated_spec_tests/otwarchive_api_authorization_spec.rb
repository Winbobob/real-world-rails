require "spec_helper"
require "webmock"
require "api/api_helper"

describe "API Authorization" do
  include ApiHelper
  end_points = %w(/api/v1/works /api/v1/bookmarks)

  describe "API POST with invalid request" do
    it "should return 401 Unauthorized if no token is supplied and forgery protection is enabled" 


    it "should return 401 Unauthorized if no token is supplied" 


    it "should return 403 Forbidden if the specified user isn't an archivist" 

  end
end

