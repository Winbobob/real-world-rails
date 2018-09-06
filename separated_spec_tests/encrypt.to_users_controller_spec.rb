require "rails_helper"

describe UsersController, type: :controller do
  
  let(:user) { create :user }

  context "anonymous user" do
  
    describe "edit user" do
      it "has a 302 status code if user logged out" 

    end

    describe "edit user" do
      it "has a 302 status code if user logged out" 

    end

  end

  context "authenticated user" do

    before do
      sign_in user
    end

    describe "edit public key" do
      it "has a 200 status code if user logged in" 

    end

    describe "edit user" do
      it "has a 200 status code if user logged in" 

    end

    describe "edit card" do
      it "has a 200 status code if user logged in" 

    end

    describe "update public key" do
      it "has a 302 status code if user logged in" 

    end
    
    describe "update card" do
      it "has a 302 status code if user logged in" 

    end
    
    describe "update user" do
      it "has a 302 status code if user logged in" 

    end
    
  end

end

