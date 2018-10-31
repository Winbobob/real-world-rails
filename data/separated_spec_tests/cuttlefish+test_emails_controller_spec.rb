# frozen_string_literal: true

require "spec_helper"

describe TestEmailsController, type: :controller do
  before :each do
    request.env["HTTPS"] = "on"
  end

  context "signed in" do
    let(:team) { Team.create! }
    before :each do
      admin = team.admins.create!(email: "foo@bar.com", password: "guess this")
      sign_in admin
    end

    describe "#new" do
      it "should give some default text" 

    end

    describe "#create" do
      let(:app) { team.apps.create!(name: "Test") }
      let(:email) { mock_model("Email", deliveries: []) }
      let(:create_email) { instance_double("Email::Create", result: email) }

      it "should create an email" 


      it "should redirect to the list of recent emails" 

    end
  end
end

