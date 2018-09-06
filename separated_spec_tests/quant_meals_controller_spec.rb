require 'spec_helper'

describe MealsController do

  def valid_attributes
    {
      date: Time.now,
      calories: 0,
      carbohydrates: 0,
      fat: 0,
      protein: 0
    }
  end

  let(:meal)       {Fabricate(:meal)}
  let(:user)       {Fabricate(:user)}
  let(:other_user) {Fabricate(:user)}

  describe "GET 'index'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when a user is signed in" do
      before(:each) do
        sign_in user
      end

      it "should only return the current_user's meals" 

    end
  end

  describe "GET 'show'" do
    context "when a user isn't signed in" do
      it "should redirect" 

    end

    context "when user is signed in" do
      before(:each) do
        sign_in user
      end

      it "assigns the meal to @meal" 


      it "prevents access to another user's meal" 

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

      it "assigns a new meal as @meal" 

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

      it "assigns the requested meal as @meal" 


      it "prevents access to another user's meal" 

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
        it "creates a new Meal" 


        it "assigns a newly created meal as @meal" 


        it "redirects to the meals index" 

      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved meal as @meal" 


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
        it "updates the requested meal" 


        it "assigns the requested meal as @meal" 


        it "redirects to meals index" 

      end

      describe "with invalid params" do
        it "assigns the meal as @meal" 


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

      it "destroys the requested meal" 


      it "redirects to the meals list" 

    end
  end

end

