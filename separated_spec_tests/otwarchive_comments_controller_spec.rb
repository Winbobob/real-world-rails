require 'spec_helper'

describe CommentsController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:comment) { create(:comment) }
  let(:unreviewed_comment) { create(:unreviewed_comment) }

  before(:each) do
    request.env["HTTP_REFERER"] = "/where_i_came_from"
  end

  describe "GET #add_comment_reply" do
    context "when comment is unreviewed" do
      it "redirects logged out user to login path with an error" 


      it "redirects logged in user to root path with an error" 

    end

    context "when comment is not unreviewed" do
      it "redirects to the comment on the commentable without an error" 


      it "redirects to the comment on the commentable with the reply form open and without an error" 

    end
  end

  describe "GET #unreviewed" do
    let!(:user) { create(:user) }
    let!(:work) { create(:work, authors: [user.default_pseud], moderated_commenting_enabled: true ) }
    let(:comment) { create(:unreviewed_comment, commentable_id: work.id) }

    it "redirects logged out users to login path with an error" 


    it "redirects to root path with an error when logged in user does not own the commentable" 


    it "renders the :unreviewed template for a user who owns the work" 


    it "renders the :unreviewed template for an admin" 

  end

  describe "POST #new" do
    it "errors if the commentable is not a valid tag" 


    it "renders the :new template if commentable is a valid admin post" 


    context "when the commentable is a valid tag" do
      let(:fandom) { create(:fandom) }

      context "when logged in as an admin" do
        before { fake_login_admin(create(:admin)) }

        it "renders the :new template" 

      end

      context "when logged in as a tag wrangler" do
        before do
          fake_login
          @current_user.roles << Role.new(name: 'tag_wrangler')
        end

        it "renders the :new template" 

      end

      context "when logged in as a random user" do
        before { fake_login }

        it "shows an error and redirects" 

      end

      context "when logged out" do
        before { fake_logout }

        it "shows an error and redirects" 

      end
    end

    it "renders the :new template if commentable is a valid comment" 

  end

  describe "POST #create" do
    let(:anon_comment_attributes) do
      attributes_for(:comment).slice(:name, :email, :content)
    end

    context "when replying from the inbox" do
      let!(:user) { create(:user) }
      let!(:comment) { create(:comment) }

      before do
        fake_login_known_user(user)
        request.env["HTTP_REFERER"] = user_inbox_path(user)
      end

      it "creates the reply and redirects to user inbox path" 

    end

    context "when the commentable is a valid tag" do
      let(:fandom) { create(:fandom) }

      context "when logged in as an admin" do
        before { fake_login_admin(create(:admin)) }

        it "posts the comment and shows it in context" 

      end

      context "when logged in as a tag wrangler" do
        before do
          fake_login
          @current_user.roles << Role.new(name: 'tag_wrangler')
        end

        it "posts the comment and shows it in context" 

      end

      context "when logged in as a random user" do
        before { fake_login }

        it "shows an error and redirects" 

      end

      context "when logged out" do
        before { fake_logout }

        it "shows an error and redirects" 

      end
    end
  end

  describe "PUT #review_all" do
    xit "redirects to root path with an error if current user does not own the commentable" do
      fake_login
      put :review_all, params: { work_id: unreviewed_comment.commentable_id }
      it_redirects_to_with_error(root_path, "What did you want to review comments on?")
    end
  end

  describe "PUT #approve" do
    before { comment.update_column(:approved, false) }

    context "when logged-in as admin" do
      before { fake_login_admin(create(:admin)) }

      it "marks the comment as not spam" 

    end

    context "when logged-in as the work's creator" do
      before { fake_login_known_user(comment.ultimate_parent.users.first) }

      it "marks the comment as not spam" 

    end

    context "when logged-in as the comment writer" do
      before { fake_login_known_user(comment.pseud.user) }

      it "leaves the comment marked as spam and redirects with an error" 

    end

    context "when logged-in as a random user" do
      before { fake_login }

      it "leaves the comment marked as spam and redirects with an error" 

    end

    context "when not logged-in" do
      before { fake_logout }

      it "leaves the comment marked as spam and redirects with an error" 

    end
  end

  describe "PUT #reject" do
    context "when logged-in as admin" do
      before { fake_login_admin(create(:admin)) }

      it "marks the comment as spam" 

    end

    context "when logged-in as the work's creator" do
      before { fake_login_known_user(comment.ultimate_parent.users.first) }

      it "marks the comment as spam" 

    end

    context "when logged-in as the comment writer" do
      before { fake_login_known_user(comment.pseud.user) }

      it "doesn't mark the comment as spam and redirects with an error" 

    end

    context "when logged-in as a random user" do
      before { fake_login }

      it "doesn't mark the comment as spam and redirects with an error" 

    end

    context "when not logged-in" do
      before { fake_logout }

      it "doesn't mark the comment as spam and redirects with an error" 

    end
  end

  describe "GET #show_comments" do
    context "when the commentable is a valid tag" do
      let(:fandom) { create(:fandom) }

      let(:all_comments_path) do
        comments_path(tag_id: fandom.to_param, anchor: "comments")
      end

      context "when logged in as an admin" do
        before { fake_login_admin(create(:admin)) }

        it "redirects to the tag comments page when the format is html" 


        it "loads the comments when the format is javascript" 

      end

      context "when logged in as a tag wrangler" do
        before do
          fake_login
          @current_user.roles << Role.new(name: 'tag_wrangler')
        end

        it "redirects to the tag comments page when the format is html" 


        it "loads the comments when the format is javascript" 

      end

      context "when logged in as a random user" do
        before { fake_login }

        it "shows an error and redirects" 

      end

      context "when logged out" do
        before { fake_logout }

        it "shows an error and redirects" 

      end
    end
  end

  describe "GET #hide_comments" do
    it "redirects to the comment path without an error" 

  end

  describe "GET #add_comment" do
    context "when comment is unreviewed" do
      it "redirects to the comment path with add_comment params and without an error" 

    end
  end

  describe "GET #cancel_comment" do
    context "with only valid params" do
      it "redirects to comment path with the comments anchor and without an error" 

    end

    context "with valid and invalid params" do
      it "removes invalid params and redirects without an error to comment path with valid params and the comments anchor" 

    end
  end

  describe "GET #cancel_comment_reply" do
    context "with only valid params" do
      it "redirects to comment path with the comments anchor and without an error" 

    end

    context "with valid and invalid params" do
      it "removes invalid params and redirects without an error to comment path with valid params and the comments anchor" 

    end
  end

  describe "GET #cancel_comment_delete" do
    it "redirects to the comment on the commentable without an error" 

  end

  describe "GET #cancel_comment_edit" do
    context "when logged in as the comment writer" do
      before { fake_login_known_user(comment.pseud.user) }

      context "when the format is html" do
        it "redirects to the comment on the commentable without an error" 

      end

      context "when the format is javascript" do
        it "loads the javascript to restore the comment" 

      end
    end

    context "when logged in as a random user" do
      before { fake_login }

      it "shows an error and redirects" 

    end

    context "when logged out" do
      before { fake_logout }

      it "shows an error and redirects" 

    end
  end

  describe "GET #destroy" do
    context "when logged in as the owner of the unreviewed comment" do
      it "deletes the comment and redirects to referrer with a success message" 

      it "redirects and gives an error if the comment could not be deleted" 

    end
  end

  describe "PUT #review" do
    let!(:user) { create(:user) }
    let!(:work) { create(:work, authors: [user.default_pseud], moderated_commenting_enabled: true ) }
    let(:comment) { create(:unreviewed_comment, commentable_id: work.id) }

    before do
      fake_login_known_user(user)
    end

    context "when recipient approves comment from inbox" do
      it "marks comment reviewed and redirects to user inbox path with success message" 

    end

    context "when recipient approves comment from inbox with filters" do
      it "marks comment reviewed and redirects to user inbox path with success message" 

    end

    context "when recipient approves comment from homepage" do
      it "marks comment reviewed and redirects to root path with success message" 

    end
  end

  describe "GET #show" do
    it "redirects to root path if logged in user does not have permission to access comment" 

  end

  describe "GET #index" do
    it "errors when not logged in as admin" 


    it "renders :index template when logged in as admin" 

  end
end

