require "spec_helper"

describe InboxController do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }

  describe "GET #show" do
    it "redirects to user page when not logged in and displays an error" 


    it "redirects to user page when logged in as another user and displays an error" 


    context "when logged in as the same user" do
      before { fake_login_known_user(user) }

      it "renders the user inbox" 


      context "with unread comments" do
        let!(:inbox_comments) do
          Array.new(3) do |i|
            create(:inbox_comment, user: user, created_at: Time.now + i.days)
          end
        end

        it "renders non-zero unread count" 


        it "renders oldest first" 

      end

      context "with 1 read and 1 unread" do
        let!(:read_comment) { create(:inbox_comment, user: user, read: true) }
        let!(:unread_comment) { create(:inbox_comment, user: user) }

        it "renders only unread" 

      end

      context "with 1 replied and 1 unreplied" do
        let!(:replied_comment) { create(:inbox_comment, user: user, replied_to: true) }
        let!(:unreplied_comment) { create(:inbox_comment, user: user) }

        it "renders only unreplied" 

      end

      context "with a deleted comment" do
        let(:inbox_comment) { create(:inbox_comment, user: user) }

        it "excludes deleted comments" 

      end
    end
  end

  describe "GET #reply" do
    let(:inbox_comment) { create(:inbox_comment) }
    let(:feedback_comment) { inbox_comment.feedback_comment }

    before { fake_login_known_user(inbox_comment.user) }

    it "renders the HTML form" 


    it "renders the JS form" 

  end

  describe "PUT #update" do
    before { fake_login_known_user(user) }

    context "with no comments selected" do
      it "redirects to inbox with caution and a notice" 


      it "redirects to the previously viewed page if HTTP_REFERER is set, with a caution and a notice" 

    end

    context "with unread comments" do
      let!(:inbox_comment_1) { create(:inbox_comment, user: user) }
      let!(:inbox_comment_2) { create(:inbox_comment, user: user) }

      it "marks all as read and redirects to inbox with a notice" 


      it "marks one as read and redirects to inbox with a notice" 


      it "deletes one and redirects to inbox with a notice" 

    end

    context "with a read comment and redirects to inbox with a notice" do
      let!(:inbox_comment) { create(:inbox_comment, user: user, read: true) }

      it "marks as unread and redirects to inbox with a notice" 


      it "marks as unread and returns a JSON response" 

    end
  end
end

