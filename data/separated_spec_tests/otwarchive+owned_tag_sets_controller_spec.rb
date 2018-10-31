# frozen_string_literal: true
require 'spec_helper'

describe OwnedTagSetsController do
  include LoginMacros
  include RedirectExpectationHelper

  describe "index" do
    let(:params) { nil }

    context "where the user_id param is set" do
      let(:user) { create(:user) }
      let!(:owned_tag_sets) { Array.new(3) { create(:owned_tag_set, owner: user.default_pseud) } }

      it "displays the tag sets owned by the user" 

    end

    context "where the restriction param is set" do
      let(:restriction) { create(:prompt_restriction) }
      let(:owned_set_taggings) { [create(:owned_set_tagging, set_taggable_type: restriction.class.to_s, set_taggable_id: restriction.id)] }
      let!(:owned_tag_sets) { create(:owned_tag_set, owned_set_taggings: owned_set_taggings) }

      it "displays the tag sets associated with the restriction" 

    end

    context "where the query param is set" do
      let!(:matching_tag_set) { create(:owned_tag_set, title: "correct_title") }
      let!(:non_matching_tag_set) { create(:owned_tag_set, title: "asdf") }

      it "displays the tag set matching the query" 

    end

    context "where no param is set" do
      let!(:tag_sets) { Array.new(3) { create(:owned_tag_set) } }

      it "displays the available tag sets" 

    end
  end

  describe "show_options" do
    context "where the restriction is found" do
      let(:restriction) { create(:prompt_restriction) }
      let!(:fandom_tag_sets) do
        Array.new(3) do
          owned_set_tagging = create(:owned_set_tagging, set_taggable_type: restriction.class.to_s, set_taggable_id: restriction.id)
          create(:owned_tag_set, owned_set_taggings: [owned_set_tagging])
        end
      end
      let(:character_tag) { create(:character) }
      let!(:character_tag_set) do
        owned_set_tagging = create(:owned_set_tagging, set_taggable_type: restriction.class.to_s, set_taggable_id: restriction.id)
        create(:owned_tag_set, owned_set_taggings: [owned_set_tagging], tags: [character_tag])
      end
      let(:params) { { restriction: restriction.id } }

      before do
        get :show_options, params: params
      end

      context "where the restriction isn't found" do
        it "displays an error and redirects" 

      end

      context "where tag_type isn't specified" do
        it "then sets the correct tags with the type fandom" 

      end

      context "where tag_type is specified" do
        let(:tag_type) { "character" }
        let(:params) { { restriction: restriction.id, tag_type: "character" } }

        it "sets the correct tags with the type character" 

      end
    end
  end

  describe "show" do
    context "where tag set is not found" do
      it "redirects and displays an error" 

    end

    context "where tag set is found" do
      let(:visible) { false }
      let(:tag) { create(:character, common_taggings: [create(:common_tagging)]) }
      let(:owned_tag_set) do
        create(
          :owned_tag_set,
          visible: visible,
          tags: [tag]
        )
      end

      context "where tag set is not visible" do
        it "doesn't set the tag hash" 

      end

      context "where tag set is visible" do
        let(:visible) { true }

        context "where tag set has type character" do
          it "sets the correct data" 

        end
      end
    end
  end

  describe "create" do
    context "where user is not logged in" do
      it "shows the access denied path" 

    end

    context "where user is logged in" do
      let(:user) { create(:user) }
      let(:owned_tag_set_params) do
        { owned_tag_set: { title: generate(:tag_title), nominated: true } }
      end

      before do
        fake_login_known_user(user)
      end

      context "where tag set is successfully saved" do
        it "saves the owned tag set and redirects to the tag set path" 

      end

      context "where tag set is not successfully saved" do
        before do
          allow_any_instance_of(OwnedTagSet).to receive(:save).and_return(false)
        end

        it "renders new page" 

      end
    end
  end

  describe "update" do
    let(:tag_set) { create(:owned_tag_set) }
    let(:user) { create(:user) }

    before do
      fake_login_known_user(user)
    end

    context "where the user isn't a moderator" do
      it "redirects and displays an error" 

    end

    context "where the user is a moderator" do
      let(:tag_set) { create(:owned_tag_set, owner: user.default_pseud) }
      let(:params) { { id: tag_set.id, owned_tag_set: { nominated: false } } }

      context "where the tag set is successfully updated" do
        it "updates the tag set and redirects" 

      end

      context "where the tag set has not been successfully updated" do
        let(:fandom_tag) { create(:fandom) }
        let(:character_tag) { create(:character) }
        let(:tag_set) do
          create(:owned_tag_set, owner: user.default_pseud, tags: [fandom_tag, character_tag])
        end

        before do
          allow_any_instance_of(OwnedTagSet).to receive(:save).and_return(false)
        end

        it "sets the parent and child tags, then renders the edit view" 

      end
    end
  end

  describe "destroy" do
    let(:user) { create(:user) }
    let(:tag_set) { create(:owned_tag_set, owner: user.default_pseud) }

    before do
      fake_login_known_user(user)
    end

    context "where the tag is successfully destroyed" do
      it "redirects with a notice" 

    end

    context "where the tag is not successfully destroyed" do
      before do
        allow_any_instance_of(OwnedTagSet).to receive(:destroy) { raise ActiveRecord::RecordNotDestroyed }
      end

      it "redirects with a flash error" 

    end
  end

  describe "do_batch_load" do
    let(:user) { create(:user) }
    let(:tag_set) { create(:owned_tag_set, owner: user.default_pseud) }

    before do
      fake_login_known_user(user)
    end

    context "where the batch_association param is set" do
      context "where tags and associations load successfully" do
        before do
          allow_any_instance_of(OwnedTagSet).to receive(:load_batch_associations!).and_return []
        end

        it "redirects to tag set path and displays a notice" 

      end

      context "where some tags and associations don't load successfully" do
        before do
          allow_any_instance_of(OwnedTagSet).to receive(:load_batch_associations!).and_return ["something"]
        end

        it "redirects to batch load path and displays a notice" 

      end
    end

    context "where the batch_association param is not set" do
      it "redirects and displays an error" 

    end
  end
end

