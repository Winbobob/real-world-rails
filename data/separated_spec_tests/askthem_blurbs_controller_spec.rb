require "spec_helper"

describe BlurbsController do
  let(:valid_attributes) { { headline: "Test", body: "Test body" } }

  context "a logged out user" do
    describe "GET index" do
      it "should refuse access" 

    end

    describe "GET show" do
      it "should refuse access" 

    end

    describe "GET new" do
      it "should refuse access" 

    end

    describe "GET edit" do
      it "should refuse access" 

    end

    describe "POST create" do
      it "should refuse access" 

    end

    describe "PUT update" do
      it "should refuse access" 

    end

    describe "DELETE destroy" do
      it "should refuse access" 

    end
  end

  context "and not logged in as staff member" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET index" do
      it "should refuse access" 

    end

    describe "GET show" do
      it "should refuse access" 

    end

    describe "GET new" do
      it "should refuse access" 

    end

    describe "GET edit" do
      it "should refuse access" 

    end

    describe "POST create" do
      it "should refuse access" 

    end

    describe "PUT update" do
      it "should refuse access" 

    end

    describe "DELETE destroy" do
      it "should refuse access" 

    end
  end

  context "and logged in as staff member" do
    before do
      @staff_member = FactoryGirl.create(:user)
      @staff_member.add_role :staff_member
      sign_in @staff_member
    end

    describe "GET index" do
      it "should show list of blurbs" 

    end

    describe "GET show" do
      it "assigns the requested blurb as @blurb" 

    end

    describe "GET new" do
      it "assigns a new blurb as @blurb" 

    end

    describe "GET edit" do
      it "assigns the requested blurb as @blurb" 

    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Blurb" 


        it "assigns a newly created blurb as @blurb" 


        it "redirects to the created blurb" 

      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved blurb as @blurb" 


        it "re-renders the 'new' template" 

      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested blurb" 


        it "assigns the requested blurb as @blurb" 


        it "redirects to the blurb" 

      end
    end

    describe "DELETE destroy" do
      it "destroys the requested blurb" 


      it "redirects to the blurbs list" 

    end
  end
end

