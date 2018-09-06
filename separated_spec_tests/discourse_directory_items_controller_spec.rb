require 'rails_helper'

describe DirectoryItemsController do
  let!(:user) { Fabricate(:user) }

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
      Fabricate(:evil_trout)
      Fabricate(:walter_white)
      Fabricate(:staged, username: 'stage_user')

      DirectoryItem.refresh!
    end

    it "succeeds with a valid value" 


    it "fails when the directory is disabled" 


    it "finds user by name" 


    it "finds staged user by name" 

  end
end

