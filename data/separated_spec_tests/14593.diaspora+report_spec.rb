# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe Report, type: :mailer do
  describe "#make_notification" do
    before do
      @reported_user = bob
      @post = @reported_user.post(:status_message, text: "hello", to: @reported_user.aspects.first.id)
      @comment = @reported_user.comment!(@post, "welcome")
      @post_report = @reported_user.reports.create(
        item_id: @post.id, item_type: "Post",
        text: "offensive content"
      )
      @comment_report = @reported_user.reports.create(
        item_id: @comment.id, item_type: "Comment",
        text: "offensive comment"
      )
      @remote = FactoryGirl.create(:person, diaspora_handle: "remote@remote.net")
      @user = FactoryGirl.create(:user_with_aspect, username: "local", language: "de")
      @user2 = FactoryGirl.create(:user_with_aspect, username: "locally")
      Role.add_admin(@user.person)
      Role.add_moderator(@user2.person)
    end

    it "should deliver successfully" 


    it "should be added to the delivery queue" 


    it "should include correct recipient" 


    it "FROM: header should be the pod name + default sender address" 


    it "should send mail in recipent's prefered language" 


    it "should find correct post translation" 


    it "should find correct comment translation" 

  end
end

