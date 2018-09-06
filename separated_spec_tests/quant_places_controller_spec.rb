require 'spec_helper'

describe PlacesController do

  def valid_attributes
    {
      lat: 0.0,
      lng: 0.0,
      date: Time.now
    }
  end

  let(:user) {Fabricate(:user)}
  let(:other_user) {Fabricate(:user)}

  describe "GET 'index'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is signed in" do
      before(:each) do
        sign_in user
      end

      it "should only return the current_user's places" 

    end
  end

  describe "GET 'show'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is signed in" do
      before(:each) do
        sign_in user
      end

      it "assigns the place to @place" 


      it "prevents access to another user's place" 

    end
  end

  describe "GET 'new'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is signed in" do
      before(:each) do
        sign_in user
      end

      it "assigns a new place as @place" 

    end
  end

  describe "GET 'edit'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is is signed in" do
      before(:each) do
        sign_in user
      end

      it "assigns the requested place as @place" 


      it "prevents access to another user's place" 

    end
  end

  describe "POST 'create'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is is signed in" do
      before(:each) do
        sign_in user
      end

      describe "with valid params" do
        it "creates a new Place" 


        it "assigns a newly created place as @place" 


        it "redirects to the created place" 

      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved place as @place" 


        it "re-renders the 'new' template" 

      end
    end
  end

  describe "PUT update" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is is signed in" do
      before(:each) do
        sign_in user
      end

      describe "with valid params" do
        it "updates the requested place" 


        it "assigns the requested place as @place" 


        it "redirects to the place" 

      end

      describe "with invalid params" do
        it "assigns the place as @place" 


        it "re-renders the 'edit' template" 

      end
    end
  end

  describe "DELETE destroy" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is is signed in" do
      before(:each) do
        sign_in user
      end

      it "destroys the requested place" 


      it "redirects to the places list" 

    end
  end

end

