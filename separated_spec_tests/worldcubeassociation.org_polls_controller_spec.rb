# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollsController do
  context "not logged in" do
    it "redirects to sign in" 

  end

  context "logged in as a regular user" do
    sign_in { FactoryBot.create(:user) }
    it "redirects to home page" 

  end

  context "logged in as board member" do
    let(:board_member) { FactoryBot.create :user, :board_member }
    before :each do
      sign_in board_member
    end

    describe "POSTS" do
      it "creates a poll" 


      it "edits a poll" 


      it "add two options and confirm" 


      it "removes an option and try to confirm" 


      it "can't edit a confirmed poll, except for deadline" 


      it "can change deadline of a confirmed poll" 


      it "can delete an unconfirmed poll" 


      it "can't delete a confirmed poll" 


      it "deadline defaults to now if you don't change it" 

    end
  end
end

