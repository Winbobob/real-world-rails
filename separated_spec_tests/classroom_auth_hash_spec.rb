# frozen_string_literal: true

require "rails_helper"

describe AuthHash do
  let(:auth_hash) { AuthHash.new(OmniAuth.config.mock_auth[:github]) }

  describe "#extract_user_info" do
    it "extracts the users information" 

  end

  describe "#non_staff_github_admins_ids" do
    it "returns an empty array if there the ENV is not set" 


    it "returns only one id" 


    it "returns multiple ids" 

  end
end

