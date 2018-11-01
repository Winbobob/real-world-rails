require "rails_helper"

RSpec.describe UserRoleService do
  let(:user)        { create(:user) }
  let(:admin)       { create(:user, :super_admin) }
  let(:banned_user) { create(:user, :banned) }

  describe "#check_for_roles" do
    it "unbans a user if they were previously banned" 


    it "bans a user when there is a reason included" 


    it "gives an error if there was no reason for ban included" 


    it "gives an error if there was a reason for ban but banned was not checked" 


    it "warns a user when there is a reason included" 


    it "gives an error if there was no reason for warning included" 


    it "gives an error if there was a reason for warning but warned was not checked" 

  end

  describe "#new_roles?" do
    it "adds the trusted role to a user with valid params" 


    it "adds the analytics role to a user with valid params" 


    it "adds the scholar role to a user with valid params" 


    it "adds workshop_expiration date with valid params" 


    it "doesn't add a workshop_expiration date if scholar is not checked" 

  end

  describe "#create_or_update_note" do
    note_params = {
      reason: "banned",
      content: "some reason",
      noteable_type: "User"
    }

    it "updates a user's previous note" 

  end
end

