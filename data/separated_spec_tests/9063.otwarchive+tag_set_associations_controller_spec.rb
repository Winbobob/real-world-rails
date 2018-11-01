require "spec_helper"

describe TagSetAssociationsController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:owned_tag_set) { create(:owned_tag_set) }
  let(:mod_pseud) {
    create(:pseud) do |pseud|
      owned_tag_set.add_moderator(pseud)
      owned_tag_set.save!
    end
  }
  let(:moderator) { mod_pseud.user }

  describe "PUT update_multiple" do
    context "when user is not logged in" do
      it "redirects and returns an error message" 

    end

    context "when logged in user is moderator of tag set" do
      before do
        fake_login_known_user(moderator.reload)
      end

      context "no tag associations are saved" do
        it "redirects and returns a notice" 

      end

      shared_examples "new tag association" do
        before do
          params = {
            tag_set_id: owned_tag_set.id,
            "create_association_#{tag.id}_#{parent_tag.name}": "1",
          }
          put :update_multiple, params: params
        end

        it "creates the new tag association" 


        it "redirects and returns a notice" 

      end

      describe "for a non-fandom parent tag" do
        include_examples "new tag association" do
          let(:parent_tag) { create(:character) }
          let(:tag) { create(:character) }
        end
      end

      describe "for a character child tag" do
        include_examples "new tag association" do
          let(:parent_tag) { create(:fandom) }
          let(:tag) { create(:character) }
        end
      end

      describe "for a fandom child tag" do
        include_examples "new tag association" do
          let(:parent_tag) { create(:fandom) }
          let(:tag) { create(:fandom) }
        end
      end

      describe "for a relationship child tag" do
        include_examples "new tag association" do
          let(:parent_tag) { create(:fandom) }
          let(:tag) { create(:relationship) }
        end
      end

      context "multiple tag associations" do
        let(:parent_tag) { create(:fandom) }
        let(:child_tag_1) { create(:relationship) }
        let(:child_tag_2) { create(:relationship) }
        let(:child_tag_3) { create(:relationship) }

        before do
          params = {
            tag_set_id: owned_tag_set.id,
            "create_association_#{child_tag_1.id}_#{parent_tag.name}": "1",
            "create_association_#{child_tag_2.id}_#{parent_tag.name}": "1",
            "create_association_#{child_tag_3.id}_#{parent_tag.name}": "",
          }
          put :update_multiple, params: params
        end

        it "creates the new tag association" 


        it "redirects and returns a notice" 

      end

      context "some tag associations cannot be saved" do
        it "redirects and returns an error message" 

      end
    end
  end
end

