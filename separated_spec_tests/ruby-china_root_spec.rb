# frozen_string_literal: true

require "rails_helper"
require "active_support/core_ext"

describe "API", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "Not found routes" do
    it "should return status 404" 

  end

  describe "GET /api/v3/hello.json" do
    context "without oauth2" do
      it "should faild with 401" 

    end

    context "Simple test with oauth2" do
      it "should work" 

    end

    describe "Validation" do
      it "should status 400 and give Validation errors" 

    end
  end
end

