require 'spec_helper'

describe AppsController, type: :controller do
  before :each do
    request.env['HTTPS'] = 'on'
  end

  describe "POST create" do
    context "signed in" do
      let(:team) { Team.create! }
      let(:admin) { team.admins.create!(email: "matthew@foo.bar", password: "foobar") }
      before(:each) { sign_in admin }

      it "should create an app that is part of the current user's team" 

    end
  end

end

