# frozen_string_literal: true

require "rails_helper"

describe TeamUsersController, type: :controller do
  let(:team) { create :team }
  let(:user) { create(:user) }
  let(:team_owner) { create(:team_owner, team: team, user: user) }
  let(:team_member) { create(:team_member, team: team, user: user) }

  describe "index" do
    it "should work" 


    context "Normal user" do
      it "should not have invite button" 

    end

    context "Member" do
      it "should not have invite button" 

    end

    context "Owner" do
      it "should have invite button" 

    end
  end

  describe "new" do
    context "Owner" do
      it "should work" 

    end

    context "Member" do
      it "should work" 

    end
  end

  describe "create" do
    context "Owner" do
      it "should work" 

    end
  end

  describe "edit" do
    let(:team_user) { create(:team_member, team: team) }

    it "Owner should work" 


    it "Member should not open" 

  end

  describe "update" do
    let(:team_user) { create(:team_member, team: team) }

    it "Owner should work" 


    it "Member should not open" 

  end

  describe "Show, Accept, Reject" do
    let(:team_user) { create(:team_member, team: team, status: :pendding) }

    it "Owner should work" 


    it "Member should not open" 

  end
end

