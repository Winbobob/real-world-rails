# frozen_string_literal: true
require "spec_helper"

describe WorksController do
  include LoginMacros
  include RedirectExpectationHelper

  describe "before_action #clean_work_search_params" do
    let(:params) { {} }

    def call_with_params(params)
      controller.params = { work_search: params }
      controller.params[:work_search] = controller.clean_work_search_params
    end

    context "when no work search parameters are given" do
      it "redirects to the login screen when no user is logged in" 

    end

    context "when the query contains countable search parameters" do
      it "should escape less and greater than in query" 


      it "should convert 'word' to 'word_count'" 


      it "should convert 'words' to 'word_count'" 


      it "should convert 'hits' queries to 'hits'" 


      it "should convert other queries to (pluralized term)_count" 

    end

    context "when sort parameters are provided" do
      it "should convert variations on 'sorted by: X' into :sort_column key" 


      it "should convert variations on sort columns to column name" 


      it "should convert 'ascending' or '>' into :sort_direction key 'asc'" 


      it "should convert 'descending' or '<' into :sort_direction key 'desc'" 


      # The rest of these are probably bugs
      it "returns no sort column if there is NO punctuation after 'sort by' clause" 


      it "can't search by date updated" 


      it "can't sort ascending if more than one word follows the colon" 

    end

    context "when the query contains categories" do
      it "surrounds categories in quotes" 


      it "does not surround categories in quotes when it shouldn't" 

    end
  end

  describe "new" do
    it "should not return the form for anyone not logged in" 


    it "should render the form if logged in" 

  end

  describe "create" do
    before do
      @user = create(:user)
      fake_login_known_user(@user)
    end

    it "doesn't allow a user to submit only a pseud that is not theirs" 


    it "renders the co-author view if a work has invalid pseuds" 


    it "renders the co-author view if a work has ambiguous pseuds" 

  end

  describe "show" do
    it "shouldn't error when a work has no fandoms" 

  end

  describe "index" do
    before do
      @fandom = create(:canonical_fandom)
      @work = create(:work, posted: true, fandom_string: @fandom.name)
    end

    it "should return the work" 


    it "should set the fandom when given a fandom id" 


    it "should return search results when given work_search parameters" 


    describe "without caching" do
      before do
        allow(controller).to receive(:use_caching?).and_return(false)
      end

      it "should return the result with different works the second time" 

    end

    describe "with caching" do
      before do
        allow(controller).to receive(:use_caching?).and_return(true)
      end

      context "with NO owner tag" do
        it "should return the same result the second time when a new work is created within the expiration time" 

      end

      context "with an owner tag" do
        before do
          @fandom2 = FactoryGirl.create(:canonical_fandom)
          @work2 = FactoryGirl.create(:work, posted: true, fandom_string: @fandom2.name)

          update_and_refresh_indexes('work')
        end

        it "should only get works under that tag" 


        it "should show different results on second page" 


        it "should show results when filters are disabled" 


        context "with restricted works" do
          before do
            @work2 = FactoryGirl.create(:work, posted: true, fandom_string: @fandom.name, restricted: true)
            update_and_refresh_indexes('work')
          end

          it "should not show restricted works to guests" 


        end

      end
    end
  end

  describe "update" do
    let(:update_user) { create(:user) }
    let(:update_chapter) { create(:chapter) }
    let(:update_work) {
      work = create(:work, authors: [update_user.default_pseud], posted: true)
      work.chapters << update_chapter
      work
    }

    before do
      fake_login_known_user(update_user)
    end

    it "should redirect to the edit page if the work could not be saved" 


    context "where the coauthor is being updated" do
      let(:new_coauthor) { create(:user) }
      let(:params) do
        {
          work: { title: "New title" },
          pseud: { byline: new_coauthor.login },
          id: update_work.id
        }
      end
      it "should update coauthors for each chapter when the work is updated" 

    end
  end

  describe "collected" do
    let(:collected_fandom) { create(:canonical_fandom) }
    let(:collected_fandom2) { create(:canonical_fandom) }
    let(:collection) { create(:collection) }
    let(:collected_user) { create(:user) }

    before do
      @unrestricted_work = create(:work,
                                  authors: [collected_user.default_pseud],
                                  posted: true,
                                  fandom_string: collected_fandom.name)
      @unrestricted_work_in_collection = create(:work,
                                                authors: [collected_user.default_pseud],
                                                collection_names: collection.name,
                                                posted: true,
                                                fandom_string: collected_fandom.name)
      @unrestricted_work_2_in_collection = create(:work,
                                                  authors: [collected_user.default_pseud],
                                                  collection_names: collection.name,
                                                  posted: true,
                                                  fandom_string: collected_fandom2.name)
      @restricted_work_in_collection = create(:work,
                                              restricted: true,
                                              authors: [collected_user.default_pseud],
                                              collection_names: collection.name,
                                              posted: true,
                                              fandom_string: collected_fandom.name)

       update_and_refresh_indexes('work')
    end

    context "as a guest" do
      it "should render the empty collected form" 


      it "should NOT return any works if no user is set" 


      it "should return ONLY unrestricted works in collections" 


      it "should return filtered works when search parameters are provided" 

    end

    context "with a logged-in user" do
      before do
        fake_login
      end

      it "should return ONLY works in collections" 

    end
  end
end

