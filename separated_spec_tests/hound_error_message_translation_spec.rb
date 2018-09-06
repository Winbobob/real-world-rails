require "spec_helper"
require "lib/error_message_translation"

describe ErrorMessageTranslation do
  describe ".from_error_response" do
    context "when error status is 403" do
      it "returns error message" 

    end

    context "when error status is not 403" do
      it "returns nil" 

    end

    context "when error does not adhere to expected formatting" do
      it "returns nil" 

    end
  end

  private

  def octokit_403_error_message
    "PUT https://api.github.com/teams/3675/memberships/houndci: 403 - You must be an admin to add a team membership. // See: https://developer.github.com/v3"
  end

  def octokit_400_error_message
    "PUT https://api.github.com/teams/3675/memberships/houndci: 400 - Problems parsing JSON. // See: https://developer.github.com/v3"
  end
end

