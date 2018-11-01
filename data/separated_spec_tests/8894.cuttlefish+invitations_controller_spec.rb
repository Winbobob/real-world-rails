# frozen_string_literal: true

require "spec_helper"

describe InvitationsController, type: :controller do
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:admin]
    request.env["HTTPS"] = "on"
  end

  let(:team) { Team.create! }
  let(:admin) do
    team.admins.create!(email: "foo@bar.com", password: "guess this")
  end

  describe "#create" do
    context "signed in" do
      before(:each) { sign_in admin }

      it "should invite a user by their email and make them part of the team" 

    end
  end
end

