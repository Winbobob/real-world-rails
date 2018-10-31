require 'rails_helper'

describe DirectoryItemsController do
  let!(:user) { Fabricate(:user) }
  let!(:evil_trout) { Fabricate(:evil_trout) }
  let!(:walter_white) { Fabricate(:walter_white) }
  let!(:stage_user) { Fabricate(:staged, username: 'stage_user') }
  let!(:group) { Fabricate(:group, users: [evil_trout, stage_user]) }

  it "requires a `period` param" 


  it "requires a proper `period` param" 


  context "without data" do

    context "and a logged in user" do
      before { sign_in(user) }

      it "succeeds" 

    end

  end

  context "with data" do
    before do
      DirectoryItem.refresh!
    end

    it "succeeds with a valid value" 


    it "fails when the directory is disabled" 


    it "finds user by name" 


    it "finds staged user by name" 


    it "excludes users by username" 


    it "filters users by group" 

  end
end

