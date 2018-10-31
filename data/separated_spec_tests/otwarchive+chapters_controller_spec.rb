require 'spec_helper'

describe ChaptersController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:user) { create(:user) }
  let!(:work) { create(:posted_work, authors: [user.pseuds.first]) }
  let(:unposted_work) { create(:work, authors: [user.pseuds.first]) }
  let(:banned_user) { create(:user, banned: true) }
  let(:banned_users_work) { create(:work, posted: true, authors: [banned_user.pseuds.first]) }


  describe "index" do
    it "redirects to work" 

  end

  describe "manage" do
    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "errors and redirects to root path if work does not exist" 


      it "renders manage template" 


      it "assigns @chapters to only posted chapters" 


      it "assigns @chapters to chapters in order" 

    end

    context "when other user is logged in" do
      it "errors and redirects to work" 

    end
  end

  describe "show" do
    context "when user is logged out" do
      it "renders show template" 


      it "errors and redirects to login when work is restricted" 


      it "assigns @chapters to only posted chapters" 


      it "errors and redirects to login when trying to view unposted chapter" 

    end

    context "when work is adult" do
      render_views

      before do
        allow_any_instance_of(Work).to receive(:adult?).and_return true
      end

      it "stores adult preference in sessions when given" 


      it "renders _adults template if work is adult and adult permission has not been given" 


      it "does not render _adults template if work is adult and adult permission has been given" 

    end

    context "when work is not adult" do
      render_views
      it "does not render _adults template if work is not adult" 

    end

    it "redirects to chapter with selected_id" 


    it "errors and redirects to work if chapter is not found" 


    it "assigns @chapters to chapters in order" 


    it "assigns @previous_chapter when not on first chapter" 


    it "does not assign @previous_chapter when on first chapter" 


    it "assigns @next_chapter when not on last chapter" 


    it "does not assign @next_chapter when on last chapter" 


    it "assigns @comments to only reviewed comments" 


    it "assigns @page_title with fandom, author name, work title, and chapter" 


    it "assigns @page_title with unrevealed work" 


    it "assigns @page_title with anonymous work" 


    it "assigns @kudos to non-anonymous kudos" 


    it "assigns instance variables correctly" 


    it "increments the hit count when accessing the first chapter" 


    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "assigns @chapters to all chapters" 

    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "assigns @chapters to only posted chapters" 


      it "assigns @subscription to user's subscription when user is subscribed to work" 


      it "assigns @subscription to unsaved subscription when user is not subscribed to work" 


      it "updates the reading history" 

    end
  end

  describe "new" do
    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "renders new template" 


      it "assigns instance variables correctly" 


      it "errors and redirects to user page when user is banned" 

    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "errors and redirects to work" 

    end
  end

  describe "edit" do
    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "renders edit template" 


      it "assigns instance variables correctly" 


      it "errors and redirects to user page when user is banned" 


      it "removes user, gives notice, and redirects to work when user removes themselves" 

    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "errors and redirects to work" 

    end
  end

  describe "create" do
    before do
      @chapter_attributes = { content: "This doesn't matter" }
    end

    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "errors and redirects to user page when user is banned" 


      it "does not allow a user to submit only a pseud that is not theirs" 


      it "assigns instance variables correctly" 


      it "adds a new chapter" 


      it "updates the works wip length when given" 


      context "when chapter has invalid pseuds" do
        before do
          allow_any_instance_of(Chapter).to receive(:invalid_pseuds).and_return([user.pseuds.first])
        end
        it "renders choose coauthor if chapter is valid" 


        it "renders new if chapter is not valid" 

      end

      context "when chapter has ambiguous pseuds" do
        before do
          allow_any_instance_of(Chapter).to receive(:ambiguous_pseuds).and_return([user.pseuds.first])
        end
        it "renders choose coauthor if chapter is valid" 


        it "renders new if chapter is not valid" 

      end

      it "renders new if the edit button has been clicked" 


      it "redirects if the cancel button has been clicked" 


      it "updates the work's major version" 


      context "when the post without preview button is clicked" do
        context "when the chapter and work are valid" do
          it "posts the chapter" 


          it "posts the work if the work was not posted before" 


          it "gives a notice and redirects to the posted chapter" 

        end

        context "when the chapter or work is not valid" do
          it "does not add a chapter" 


          it "renders new" 

        end

        it "updates the work's revision date" 

      end

      context "when the preview button is clicked" do
        context "when the chapter and work are valid" do
          it "does not post the chapter" 


          it "gives a notice that the chapter is a draft and redirects to the chapter preview" 


          it "gives a notice that the work and chapter are drafts and redirects to the chapter preview" 

        end

        context "when the chapter or work is not valid" do
          it "does not add a chapter" 


          it "renders new" 

        end
      end
    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      context "when the user tries to add themselves as a coauthor" do
        before do
          @chapter_attributes[:author_attributes] = { ids: [user.pseuds.first.id, @current_user.pseuds.first.id] }
        end

        it "errors and redirects to work" 

      end
    end
  end

  describe "update" do
    before do
      @chapter_attributes = { content: "This doesn't matter" }
    end

    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "errors and redirects to user page when user is banned" 


      it "does not allow a user to submit only a pseud that is not theirs" 


      it "assigns instance variables correctly" 


      it "updates the work's wip length when given" 


      context "when chapter has invalid pseuds" do
        before do
          allow_any_instance_of(Chapter).to receive(:invalid_pseuds).and_return([user.pseuds.first])
        end
        it "renders choose coauthor if chapter is valid" 


        it "renders new if chapter is not valid" 

      end

      context "when chapter has ambiguous pseuds" do
        before do
          allow_any_instance_of(Chapter).to receive(:ambiguous_pseuds).and_return([user.pseuds.first])
        end
        it "renders choose coauthor if chapter is valid" 


        it "renders new if chapter is not valid" 

      end

      context "when the preview button is clicked" do
        it "assigns preview_mode to true" 


        it "gives a notice if the chapter has been posted and renders preview" 


        it "gives a notice if the chapter has not been posted and renders preview" 

      end

      it "redirects if the cancel button has been clicked" 


      it "renders edit if the edit button has been clicked" 


      it "updates the work's minor version" 


      context "when the post button is clicked" do
        context "when the chapter and work are valid" do
          it "posts the chapter" 


          it "posts the work if the work was not posted before" 


          it "gives a notice if the chapter was already posted and redirects to the posted chapter" 


          it "gives a notice if the chapter was not already posted and redirects to the posted chapter" 

        end

        context "when the chapter or work is not valid" do
          it "does not update the chapter" 


          it "renders edit" 

        end

        it "updates the work's revision date" 

      end

      context "when the post without preview button is clicked" do
        it "posts the chapter" 

      end
    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      context "when the user tries to add themselves as a coauthor" do
        before do
          @chapter_attributes[:author_attributes] = { ids: [user.pseuds.first.id, @current_user.pseuds.first.id] }
        end

        it "errors and redirects to work" 

      end
    end
  end

  describe "update_positions" do
    before do
      @chapter1 = work.chapters.first
      @chapter2 = create(:chapter, work: work, posted: true, position: 2, authors: [user.pseuds.first])
      @chapter3 = create(:chapter, work: work, posted: true, position: 3, authors: [user.pseuds.first])
    end

    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      context "when passing params[:chapters]" do
        it "updates the positions of the chapters" 


        it "gives a notice and redirects to work" 

      end

      context "when passing params[:chapter]" do
        it "updates the positions of the chapters" 

      end
    end
  end

  describe "preview" do
    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "renders preview template" 


      it "assigns instance variables correctly" 

    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "errors and redirects to work" 

    end
  end

  describe "post" do
    before do
      @chapter_to_post = create(:chapter, work: work, authors: [user.pseuds.first], position: 2)
    end

    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "redirects to work when cancel button is clicked" 


      it "redirects to edit when edit button is clicked" 


      context "when the chapter and work are valid" do
        it "posts the chapter and redirects to work" 


        it "posts the work if the work was not posted before" 

      end

      context "when the chapter or work is not valid" do
        before do
          allow_any_instance_of(Chapter).to receive(:save).and_return(false)
        end

        it "does not update the chapter" 


        it "renders preview" 

      end

      it "updates the work's revision date" 


      it "assigns instance variables correctly" 

    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "errors and redirects to work" 

    end
  end

  describe "confirm_delete" do
    context "when user is logged out" do
      it "errors and redirects to work" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      it "renders confirm delete template" 


      it "assigns instance variables correctly" 

    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "errors and redirects to work" 

    end
  end

  describe "destroy" do
    context "when user is logged out" do
      it "errors and redirects to login" 

    end

    context "when work owner is logged in" do
      before do
        fake_login_known_user(user)
      end

      context "when work has one chapter" do
        it "redirects to edit work" 

      end

      context "when work has more than one chapter" do
        before do
          @chapter2 = create(:chapter, work: work, posted: true, position: 2, authors: [user.pseuds.first])
        end

        it "updates the work's minor version" 


        it "updates the work's revision date" 


        it "gives a notice that the chapter was deleted and redirects to work" 


        it "gives a notice that the draft chapter was deleted if the chapter was a draft and redirects to work" 


        it "errors and redirects to work when chapter is not deleted" 

      end
    end

    context "when other user is logged in" do
      before do
        fake_login
      end

      it "errors and redirects to work" 

    end
  end
end

