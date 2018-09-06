require 'spec_helper'

describe TagsController do
  include LoginMacros
  include RedirectExpectationHelper

  before do
    fake_login
    @current_user.roles << Role.new(name: 'tag_wrangler')
  end

  describe "wrangle" do
    context "a fandom's unwrangled freeforms page" do
      before do
        @fandom = FactoryGirl.create(:fandom, canonical: true)
        @freeform1 = FactoryGirl.create(:freeform)
        @work = FactoryGirl.create(:work, posted: true, fandom_string: "#{@fandom.name}", freeform_string: "#{@freeform1.name}")
      end

      it "should show those freeforms" 

    end
  end

  describe "mass_update" do
    before do
      @fandom1 = FactoryGirl.create(:fandom, canonical: true)
      @fandom2 = FactoryGirl.create(:fandom, canonical: true)
      @fandom3 = FactoryGirl.create(:fandom, canonical: false)

      @freeform1 = FactoryGirl.create(:freeform, canonical: false)
      @character1 = FactoryGirl.create(:character, canonical: false)
      @character3 = FactoryGirl.create(:character, canonical: false)
      @character2 = FactoryGirl.create(:character, canonical: false, merger: @character3)
      @work = FactoryGirl.create(:work,
                                 posted: true,
                                 fandom_string: "#{@fandom1.name}",
                                 character_string: "#{@character1.name},#{@character2.name}",
                                 freeform_string: "#{@freeform1.name}")
    end

    it "should redirect to the wrangle action for that tag" 


    context "with one canonical fandom in the fandom string and a selected freeform" do
      it "should be successful" 

    end

    context "with one canonical and one noncanonical fandoms in the fandom string and a selected freeform" do
      it "should be successful" 

    end

    context "with two canonical fandoms in the fandom string and a selected character" do
      it "should be successful" 

    end

    context "with a canonical fandom in the fandom string, a selected unwrangled character, and the same character to be made canonical" do
      it "should be successful" 

    end

    context "with a canonical fandom in the fandom string, a selected synonym character, and the same character to be made canonical" do
      it "should be successful" 

    end

    context "A wrangler can remove associated tag" do
      it "should be successful" 

    end
  end

  describe "reindex" do
    context "when reindexing a tag" do
      before do
        @tag = FactoryGirl.create(:freeform)
      end

      it "Only an admin can reindex a tag" 

    end
  end

  describe "feed" do
    it "You can only get a feed on Fandom, Character and Relationships" 

  end

  describe "edit" do
    context "when editing a tag" do
      before do
        @tag = FactoryGirl.create(:banned)
      end

      it "Only an admin can edit a banned tag" 

    end
  end

  describe "update" do
    context "when updating a tag" do
      let(:tag) { create(:freeform) }
      let(:unsorted_tag) { create(:unsorted_tag) }

      it "resets the taggings count" 


      it "changes just the tag type" 

    end

    context "when updating a canonical tag" do
      let(:tag) { create(:canonical_freeform) }

      it "wrangles" 

    end
  end
end

