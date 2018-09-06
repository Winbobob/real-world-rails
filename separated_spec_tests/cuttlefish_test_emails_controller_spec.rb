require 'spec_helper'

describe TestEmailsController, type: :controller do
  before :each do
    request.env['HTTPS'] = 'on'
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

      it "should send a test email" 


      it "should redirect to the list of recent emails" 

    end
  end
end

