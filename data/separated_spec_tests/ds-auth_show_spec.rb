require "rails_helper"

RSpec.describe "GET /api/v1/me" do
  it_behaves_like "a protected endpoint", "/api/v1/me"

  context "with a valid authentication token" do
    include_context "logged in API User"
    it_behaves_like "an endpoint that times out sessions", "/api/v1/me"

    it "returns a 200 response with the user credentials" 

  end
end

