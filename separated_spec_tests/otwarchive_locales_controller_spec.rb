require "spec_helper"

describe LocalesController do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }
  let(:translation_admin) do
    create(:user) { |u| u.translation_admin = "1" }
  end

  describe "GET #index" do
    it "displays the default locale" 

  end

  describe "GET #new" do
    context "when logged in as a translation admin" do
      before { fake_login_known_user(translation_admin) }

      it "displays the form to create a locale" 

    end
  end

  describe "GET #edit" do
    context "when logged in as a translation admin" do
      let(:locale) { create(:locale) }

      before { fake_login_known_user(translation_admin) }

      it "displays the form to update a locale" 

    end
  end

  describe "PUT #update" do
    context "when logged in as a non-admin" do
      before { fake_login_known_user(user) }

      it "redirects to the user page" 

    end

    context "when logged in as a translation admin" do
      let(:locale) { create(:locale) }

      before { fake_login_known_user(translation_admin) }

      it "updates an existing locale" 


      it "redirects to the edit form for the same locale if the new iso is not unique" 

    end
  end

  describe "POST #create" do
    context "when logged in as a non-admin" do
      before { fake_login_known_user(user) }

      it "redirects to the user page" 

    end

    context "when logged in as a translation admin" do
      before { fake_login_known_user(translation_admin) }

      it "adds a new locale and redirects to list of locales" 


      it "redirects to the create form if iso is missing" 

    end
  end
end

