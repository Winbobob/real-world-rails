# frozen_string_literal: true

require "rails_helper"

describe TeamsController, type: :controller do
  let(:user) { create :wiki_editor }
  describe "index" do
    it "should work" 

  end

  describe "show" do
    let(:team) { create(:team) }
    it "should work" 

  end

  describe "new" do
    it "should work" 

  end

  describe "create" do
    let(:team) { build(:team) }
    it "should work" 


    it "should render new after save failure" 

  end

  describe "update" do
    let(:team) { create(:team) }
    let!(:team_owner) { create(:team_owner, team: team, user: user) }
    it "should work" 


    it "should render edit after save failure" 

  end
end

