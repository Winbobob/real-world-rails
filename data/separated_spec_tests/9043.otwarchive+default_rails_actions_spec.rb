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
      it "escapes less and greater than in query" 


      it "converts 'word' to 'word_count'" 


      it "converts 'words' to 'word_count'" 


      it "converts 'hits' queries to 'hits'" 


      it "converts other queries to (pluralized term)_count" 

    end

    context "when sort parameters are provided" do
      it "converts variations on 'sorted by: X' into :sort_column key" 


      it "converts variations on sort columns to column name" 


      it "converts 'ascending' or '>' into :sort_direction key 'asc'" 


      it "converts 'descending' or '<' into :sort_direction key 'desc'" 


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
    it "doesn't return the form for anyone not logged in" 


    it "renders the form if logged in" 

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
    it "doesn't error when a work has no fandoms" 

  end

  describe "index" do
    before do
      @fandom = create(:canonical_fandom)
      @work = create(:posted_work, fandom_string: @fandom.name)
    end

    it "returns the work" 


    it "sets the fandom when given a fandom id" 


    it "returns search results when given work_search parameters" 


    describe "without caching" do
      before do
        allow(controller).to receive(:use_caching?).and_return(false)
      end

      it "returns the result with different works the second time" 

    end

    describe "with caching" do
      before do
        allow(controller).to receive(:use_caching?).and_return(true)
      end

      context "with NO owner tag" do
        it "returns the same result the second time when a new work is created within the expiration time" 

      end

      context "with a valid owner tag" do
        before do
          @fandom2 = create(:canonical_fandom)
          @work2 = create(:posted_work, fandom_string: @fandom2.name)

          update_and_refresh_indexes('work')
        end

        it "only gets works under that tag" 


        it "shows different results on second page" 


        it "shows results when filters are disabled" 


        context "with restricted works" do
          before do
            @work2 = create(:posted_work, fandom_string: @fandom.name, restricted: true)
            update_and_refresh_indexes('work')
          end

          it "shows restricted works to guests" 


        end

        context "when tag is a synonym" do
          let(:fandom_synonym) { create(:fandom, merger: @fandom) }

          it "redirects to the merger's work index" 


          context "when collection is specified" do
            let(:collection) { create(:collection) }

            it "redirects to the merger's collection works index" 

          end
        end
      end
    end

    context "with an invalid owner tag" do
      it "raises an error" 

    end

    context "with an invalid owner user" do
      it "raises an error" 


      context "with an invalid pseud" do
        it "raises an error" 

      end
    end

    context "with a valid owner user" do
      let(:user) { create(:user) }
      let!(:user_work) { create(:posted_work, authors: [user.default_pseud]) }
      let(:pseud) { create(:pseud, user: user) }
      let!(:pseud_work) { create(:posted_work, authors: [pseud]) }

      before do
        update_and_refresh_indexes("work")
      end

      it "includes only works for that user" 


      context "with a valid pseud" do
        it "includes only works for that pseud" 

      end

      context "with an invalid pseud" do
        it "includes all of that user's works" 

      end
    end
  end

  describe "update" do
    let(:update_user) { create(:user) }
    let(:update_chapter) { create(:chapter) }
    let(:update_work) {
      work = create(:posted_work, authors: [update_user.default_pseud])
      work.chapters << update_chapter
      work
    }

    before do
      fake_login_known_user(update_user)
    end

    it "redirects to the edit page if the work could not be saved" 


    context "where the coauthor is being updated" do
      let(:new_coauthor) { create(:user) }
      let(:params) do
        {
          work: { title: "New title" },
          pseud: { byline: new_coauthor.login },
          id: update_work.id
        }
      end
      it "updates coauthors for each chapter when the work is updated" 

    end
  end

  describe "collected" do
    let(:collection) { create(:collection) }
    let(:collected_user) { create(:user) }

    context "with anonymous works" do
      let(:anonymous_collection) { create(:anonymous_collection) }

      let!(:work) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               collection_names: collection.name)
      end

      let!(:anonymous_work) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               collection_names: anonymous_collection.name)
      end

      before { update_and_refresh_indexes "work" }

      it "does not return anonymous works in collections for guests" 


      it "does not return anonymous works in collections for logged-in users" 


      it "returns anonymous works in collections for the author" 

    end

    context "with restricted works" do
      let(:collected_fandom) { create(:canonical_fandom) }
      let(:collected_fandom_2) { create(:canonical_fandom) }

      let!(:unrestricted_work) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               fandom_string: collected_fandom.name)
      end

      let!(:unrestricted_work_in_collection) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               collection_names: collection.name,
               fandom_string: collected_fandom.name)
      end

      let!(:unrestricted_work_2_in_collection) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               collection_names: collection.name,
               fandom_string: collected_fandom_2.name)
      end

      let!(:restricted_work_in_collection) do
        create(:posted_work,
               restricted: true,
               authors: [collected_user.default_pseud],
               collection_names: collection.name,
               fandom_string: collected_fandom.name)
      end

      before { update_and_refresh_indexes "work" }

      context "as a guest" do
        it "renders the empty collected form" 


        it "does NOT return any works if no user is set" 


        it "returns ONLY unrestricted works in collections" 


        it "returns filtered works when search parameters are provided" 

      end

      context "with a logged-in user" do
        before { fake_login }

        it "returns ONLY works in collections" 

      end
    end

    context "with unrevealed works" do
      let(:unrevealed_collection) { create(:unrevealed_collection) }

      let!(:work) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               collection_names: collection.name)
      end

      let!(:unrevealed_work) do
        create(:posted_work,
               authors: [collected_user.default_pseud],
               collection_names: unrevealed_collection.name)
      end

      before { update_and_refresh_indexes "work" }

      it "returns unrevealed works in collections for guests" 


      it "returns unrevealed works in collections for logged-in users" 

    end
  end
end

