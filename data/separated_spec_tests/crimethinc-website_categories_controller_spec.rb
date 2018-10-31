require "rails_helper"

RSpec.describe Admin::CategoriesController, type: :controller do
  context "unauthorized" do
    it "redirects on index" 


    it "redirects on new" 


    it "redirects on create" 


    it "redirects on show" 


    it "redirects on edit" 


    it "redirects on update" 


    it "redirects on destroy" 

  end

  context "authorized" do
    let(:user) { create(:user) }
    before { session[:user_id] = user.id }

    describe "GET #index" do
      it "renders index" 

    end

    describe "GET #show" do
      it "renders show" 

    end

    describe "POST #create" do
      it "creates a category" 

    end

    describe "PUT #update" do
      it "updates the category" 

    end

    describe "DELETE #destroy" do
      it "deletes the category" 

    end
  end

end

