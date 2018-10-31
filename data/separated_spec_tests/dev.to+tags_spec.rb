require "rails_helper"

RSpec.describe "Tags", type: :request, proper_status: true do
  describe "GET /tags" do
    it "returns proper page" 

  end

  describe "GET /t/:tag/edit" do
    let(:tag)                  { create(:tag) }
    let(:another_tag)          { create(:tag) }
    let(:unauthorized_user)    { create(:user) }
    let(:tag_moderator)        { create(:user) }
    let(:super_admin)          { create(:user, :super_admin) }

    it "does not allow not logged-in users" 


    it "does not allow users who are not tag moderators" 


    it "allows super admins" 


    context "when user is a tag moderator" do
      before do
        tag_moderator.add_role(:tag_moderator, tag)
        sign_in tag_moderator
      end

      it "allows authorized tag moderators" 


      it "does not allow moderators of one tag to edit another tag" 

    end
  end

  describe "UPDATE /tags" do
    valid_params = { tag: { text_color_hex: "", bg_color_hex: "" } }
    let(:tag)                  { create(:tag) }
    let(:another_tag)          { create(:tag) }
    let(:unauthorized_user)    { create(:user) }
    let(:tag_moderator)        { create(:user) }
    let(:super_admin)          { create(:user, :super_admin) }

    it "does not allow not logged-in users" 


    it "does not allow unauthorized users" 


    it "allows super admins" 


    context "when user is a tag moderator" do
      before do
        tag_moderator.add_role(:tag_moderator, tag)
        sign_in tag_moderator
      end

      it "allows authorized tag moderators to update a tag" 


      it "displays proper error messages" 


      it "does not allow moderators of one tag to edit another tag" 

    end
  end
end

