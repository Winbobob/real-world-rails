require 'rails_helper'

describe Admin::UsersController do
  it "requires to be signed in as an admin" 


  context "as an admin" do
    before :each do
      login_as(users(:jane))
    end

    it "lists all users" 


    it "allows to delete a user" 


    context "creating new users" do
      it "follow the 'new user' link" 


      it "creates a new user" 


      it "requires the passwords to match" 

    end

    context "updating existing users" do
      it "follows the edit link" 


      it "updates an existing user" 


      it "requires the passwords to match when changing them" 

    end

    context "(de)activating users" do
      it "does not show deactivation buttons for the current user" 


      it "deactivates an existing user" 


      it "activates an existing user" 

    end
  end
end

