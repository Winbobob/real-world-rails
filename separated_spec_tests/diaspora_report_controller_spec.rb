# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ReportController, type: :controller do
  before do
    sign_in alice
    @message = alice.post(:status_message, text: "hey", to: alice.aspects.first.id)
    @comment = alice.comment!(@message, "flying pigs, everywhere")
  end

  describe "#index" do
    context "admin not signed in" do
      it "is behind redirect_unless_admin" 

    end

    context "admin signed in" do
      before do
        Role.add_admin(alice.person)
      end
      it "succeeds and renders index" 

    end

    context "moderator signed in" do
      before do
        Role.add_moderator(alice.person)
      end
      it "succeeds and renders index" 

    end
  end

  describe "#create" do
    let(:comment_hash) {
      {text:    "facebook, is that you?",
       item_id: "#{@post.id}"}
    }

    context "report offensive post" do
      it "succeeds" 

    end
    context "report offensive comment" do
      it "succeeds" 

    end
  end

  describe "#update" do
    context "mark post report as user" do
      it "is behind redirect_unless_admin_or_moderator" 

    end
    context "mark comment report as user" do
      it "is behind redirect_unless_admin_or_moderator" 

    end

    context "mark post report as admin" do
      before do
        Role.add_admin(alice.person)
      end
      it "succeeds" 

    end
    context "mark comment report as admin" do
      before do
        Role.add_admin(alice.person)
      end
      it "succeeds" 

    end

    context "mark post report as moderator" do
      before do
        Role.add_moderator(alice.person)
      end

      it "succeeds" 

    end

    context "mark comment report as moderator" do
      before do
        Role.add_moderator(alice.person)
      end
      it "succeeds" 

    end
  end

  describe "#destroy" do
    context "destroy post as user" do
      it "is behind redirect_unless_admin_or_moderator" 

    end
    context "destroy comment as user" do
      it "is behind redirect_unless_admin_or_moderator" 

    end

    context "destroy post as admin" do
      before do
        Role.add_admin(alice.person)
      end
      it "succeeds" 

    end
    context "destroy comment as admin" do
      before do
        Role.add_admin(alice.person)
      end
      it "succeeds" 

    end

    context "destroy post as moderator" do
      before do
        Role.add_moderator(alice.person)
      end
      it "succeeds" 

    end
    context "destroy comment as moderator" do
      before do
        Role.add_moderator(alice.person)
      end
      it "succeeds" 

    end
  end
end

