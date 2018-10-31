require "spec_helper"

RSpec.describe InquiriesController do
  let (:test_organization) { Fabricate(:organization) }
  let (:member) { Fabricate(:member, organization: test_organization) }
  let (:another_member) { Fabricate(:member, organization: test_organization) }
  let (:test_category) { Fabricate(:category) }
  let! (:inquiry) do
    Fabricate(:inquiry,
              user: member.user,
              organization: test_organization,
              category: test_category)
  end
  include_context "stub browser locale"
  before { set_browser_locale("ca") }

  describe "GET #index" do
    context "with a logged user" do
      it "populates and array of inquiries" 

    end
  end

  describe "GET #show" do
    context "with valid params" do
      context "with a logged user" do
        it "assigns the requested inquiry to @inquiry" 

      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      context "with a logged user" do
        it "creates a new inquiry" 

      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      context "with a logged user" do
        it "located the requested @inquiry" 


        it "changes @inquiry's attributes" 

      end
    end

    context "with invalid params" do
      context "with a logged user" do
        it "does not change @inquiry's attributes" 

      end
    end
  end

  describe "DELETE destroy" do
    it "toggle active field" 


    it "redirects to inquiries#index" 

  end
end

