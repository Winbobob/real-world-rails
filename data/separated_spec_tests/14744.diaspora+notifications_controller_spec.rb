# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe NotificationsController, :type => :controller do
  before do
    sign_in alice, scope: :user
  end

  describe '#update' do
    it 'marks a notification as read if it gets no other information' 


    it 'marks a notification as read if it is told to' 


    it 'marks a notification as unread if it is told to' 


    it "marks a notification as unread without timestamping" 


    it 'only lets you read your own notifications' 

  end

  describe '#index' do
    before do
      @post = FactoryGirl.create(:status_message)
      @notification = FactoryGirl.create(:notification, recipient: alice, target: @post)
    end

    it 'succeeds' 


    it "succeeds for notification dropdown" 


    it 'succeeds on mobile' 


    it 'paginates the notifications' 


    it "supports a limit per_page parameter" 


    describe "special case for start sharing notifications" do
      it "should not provide a contacts menu for standard notifications" 


      it "should provide a contacts menu for start sharing notifications" 


      it 'succeeds on mobile' 

    end

    describe "filter notifications" do
      it "supports filtering by notification type" 


      it "supports filtering by read/unread" 

    end

    context "after deleting a person" do
      before do
        user = FactoryGirl.create(:user_with_aspect)
        user.share_with(alice.person, user.aspects.first)
        user.person.delete
      end

      it "succeeds" 


      it "succeeds on mobile" 

    end
  end

  describe "#read_all" do
    let(:post) { FactoryGirl.create(:status_message) }

    it "marks all notifications as read" 


    it "marks all notifications in the current filter as read" 


    it "should redirect back in the html version if it has > 0 notifications" 


    it "should redirect back in the mobile version if it has > 0 notifications" 


    it "should redirect to stream in the html version if it has 0 notifications" 


    it "should redirect back in the mobile version if it has 0 notifications" 


    it "should return a dummy value in the json version" 

  end
end

