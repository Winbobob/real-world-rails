require 'spec_helper'

describe WeightsController do

  # This should return the minimal set of attributes required to create a valid
  # Weight. As you add validations to Weight, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      value: 0.0,
      date: Time.now
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WeightsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  let(:user) { Fabricate(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET index" do
    it "assigns all weights as @weights" 

  end

  describe "GET show" do
    it "assigns the requested weight as @weight" 

  end

  describe "GET new" do
    it "assigns a new weight as @weight" 

  end

  describe "GET edit" do
    it "assigns the requested weight as @weight" 

  end

  describe "POST create" do
    describe "with valid params" do
      before(:each) do
        sign_in user
      end
      it "creates a new Weight" 


      it "assigns a newly created weight as @weight" 


      it "redirects to the created weight" 

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved weight as @weight" 


      it "re-renders the 'new' template" 

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested weight" 


      it "assigns the requested weight as @weight" 


      it "redirects to the weight" 

    end

    describe "with invalid params" do
      it "assigns the weight as @weight" 


      it "re-renders the 'edit' template" 

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested weight" 


    it "redirects to the weights list" 

  end

end

