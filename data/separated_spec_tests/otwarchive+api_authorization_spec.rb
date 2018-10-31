require "spec_helper"
require "webmock"
require "controllers/api/api_helper"

describe "API v2 Authorization", type: :request do
  include ApiHelper
  end_points = %w(/api/v2/works /api/v2/bookmarks)

  describe "API POST with invalid request" do
    it "returns 401 Unauthorized if no token is supplied and forgery protection is enabled" 


    it "returns 401 Unauthorized if no token is supplied" 


    it "returns 403 Forbidden if the specified user isn't an archivist" 

  end
end

