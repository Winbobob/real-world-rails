# frozen_string_literal: true

require "rails_helper"
require "active_support/core_ext"

describe "API", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "POST /api/v3/photos.json" do
    include ActionDispatch::TestProcess

    context "without login" do
      it "should response 401" 

    end

    context "with login" do
      it "should work" 

    end
  end
end

