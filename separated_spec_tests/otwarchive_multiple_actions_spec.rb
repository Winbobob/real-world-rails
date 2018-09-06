# frozen_string_literal: true
require "spec_helper"

describe WorksController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:multiple_user_pseud) { create(:pseud) }
  let!(:multiple_works_user) {
    user = create(:user)
    user.pseuds << multiple_user_pseud
    user
  }

  describe "edit_multiple" do
    it "should redirect to the orphan path when the Orphan button was clicked" 

  end

  describe "confirm_delete_multiple" do
    it "should return the works specified in the work_ids parameters" 

  end

  describe "delete_multiple" do
    let(:multiple_work1) {
      create(:work,
             authors: [multiple_works_user.default_pseud],
             title: "Work 1",
             posted: true)
    }
    let(:multiple_work2) {
      create(:work,
             authors: [multiple_works_user.default_pseud],
             title: "Work 2",
             posted: true)
    }

    before do
      fake_login_known_user(multiple_works_user)
      post :delete_multiple, params: { id: multiple_work1.id, work_ids: [multiple_work1.id, multiple_work2.id] }
    end

    # already covered - just for completeness
    it "should delete all the works" 


    it "should display a notice" 

  end

  describe "update_multiple" do
    let(:multiple_works_user) { create(:user) }
    let(:multiple_work1) {
      create(:work,
             authors: [multiple_works_user.default_pseud],
             title: "Work 1",
             anon_commenting_disabled: true,
             moderated_commenting_enabled: true,
             posted: true)
    }
    let(:multiple_work2) {
      create(:work,
             authors: [multiple_works_user.default_pseud],
             title: "Work 2",
             anon_commenting_disabled: true,
             moderated_commenting_enabled: true,
             posted: true)
    }
    let(:params) {
      {
        work_ids: [multiple_work1.id, multiple_work2.id],
        work: {
          rating_string: "",
          fandom_string: "",
          relationship_string: "",
          character_string: "",
          freeform_string: "",
          pseuds_to_remove: [""],
          pseuds_to_add: "",
          collections_to_add: "",
          language_id: "",
          work_skin_id: "",
          restricted: "0",
          unrestricted: "0",
          anon_commenting_disabled: "",
          moderated_commenting_enabled: ""
        }
      }.merge(work_params)
    }

    before do
      fake_login_known_user(multiple_works_user)
    end

    context 'adjusting commenting ability' do
      let(:work_params) {
        {
          work: {
            anon_commenting_disabled: "allow_anon",
            moderated_commenting_enabled: "not_moderated"
          }
        }
      }

      it "should convert the anon_commenting_disabled parameter to false" 


      it "should convert the moderated_commenting_enabled parameter to false" 

    end

    context 'adding and removing coauthors' do
      let(:coauthor_to_remove_pseud) { FactoryGirl.create(:pseud) }
      let(:coauthor_to_add_pseud) { FactoryGirl.create(:pseud) }
      let(:work_params) {
        {
          work: {
            pseuds_to_remove: [coauthor_to_remove_pseud.id.to_s, ""],
            pseuds_to_add: coauthor_to_add_pseud.name
          }
        }
      }

      before do
        multiple_work2.update_attribute(:authors, [multiple_works_user.default_pseud, coauthor_to_remove_pseud])
        put :update_multiple, params: params
      end

      it "removes coauthors when pseuds_to_remove param exists" 


      it "adds coauthors when pseuds_to_add param exists" 

    end
  end
end

