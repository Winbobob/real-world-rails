# frozen_string_literal: true

require "spec_helper"

describe DeliveriesController, type: :controller do
  before :each do
    request.env["HTTPS"] = "on"
  end

  context "signed in" do
    let(:team) { Team.create! }
    before :each do
      admin = team.admins.create!(email: "foo@bar.com", password: "guess this")
      sign_in admin
    end

    describe "GET index" do
      it "assigns all deliveries as @deliveries" 

    end

    describe "GET show" do
      it "assigns the requested delivery as @delivery" 

    end
  end
end

