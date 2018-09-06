require "spec_helper"

describe WranglingGuidelinesController do
  include HtmlCleaner
  include LoginMacros
  include RedirectExpectationHelper
  let(:admin) { create(:admin) }

  describe "GET #index" do
    let!(:guideline_1) { create(:wrangling_guideline, position: 9001) }
    let!(:guideline_2) { create(:wrangling_guideline, position: 2) }
    let!(:guideline_3) { create(:wrangling_guideline, position: 7) }

    it "renders" 

  end

  describe "GET #show" do
    let(:guideline) { create(:wrangling_guideline) }

    it "renders" 

  end

  describe "GET #new" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      before { fake_login_admin(admin) }

      it "renders" 

    end
  end

  describe "GET #edit" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let(:guideline) { create(:wrangling_guideline) }

      before { fake_login_admin(admin) }

      it "renders" 

    end
  end

  describe "GET #manage" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let!(:guideline_1) { create(:wrangling_guideline, position: 9001) }
      let!(:guideline_2) { create(:wrangling_guideline, position: 2) }
      let!(:guideline_3) { create(:wrangling_guideline, position: 7) }

      before { fake_login_admin(admin) }

      it "renders" 

    end
  end

  describe "POST #create" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      before { fake_login_admin(admin) }

      it "creates and redirects to new wrangling guideline" 


      it "renders new if create fails" 

    end
  end

  describe "PUT #update" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let(:guideline) { create(:wrangling_guideline) }

      before { fake_login_admin(admin) }

      it "updates and redirects to updated wrangling guideline" 


      it "renders edit if update fails" 

    end
  end

  describe "POST #update_positions" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let!(:guideline_1) { create(:wrangling_guideline, position: 1) }
      let!(:guideline_2) { create(:wrangling_guideline, position: 2) }
      let!(:guideline_3) { create(:wrangling_guideline, position: 3) }

      before { fake_login_admin(admin) }

      it "updates positions and redirects to index" 


      it "redirects to index given no params" 

    end
  end

  describe "DELETE #destroy" do
    it "blocks non-admins" 


    context "when logged in as admin" do
      let(:guideline) { create(:wrangling_guideline) }

      before { fake_login_admin(admin) }

      it "deletes and redirects to index" 

    end
  end
end

