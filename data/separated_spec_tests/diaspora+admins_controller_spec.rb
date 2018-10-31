# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe AdminsController, :type => :controller do
  before do
    @user = FactoryGirl.create :user
    sign_in @user, scope: :user
  end

  describe "#dashboard" do
    context "admin not signed in" do
      it "is behind redirect_unless_admin" 

    end

    context "admin signed in" do
      before do
        Role.add_admin(@user.person)
        @post = bob.post(:status_message, text: "hello", to: bob.aspects.first.id)
        @post_report = alice.reports.create(
          item_id: @post.id, item_type: "Post",
          text: "offensive content"
        )
      end

      it "succeeds" 


      it "warns the user about unreviewed reports" 


      it "doesn't show a report warning if there are no unreviewed reports" 

    end
  end

  describe '#user_search' do
    context 'admin not signed in' do
      it 'is behind redirect_unless_admin' 

    end

    context 'admin signed in' do
      before do
        Role.add_admin(@user.person)
      end

      it 'succeeds and renders user_search' 


      it 'assigns users to an empty array if nothing is searched for' 


      it 'searches on username' 


      it 'searches on email' 


      it 'searches on age < 13 (COPPA)' 

    end
  end

  describe '#admin_inviter' do
    context 'admin not signed in' do
      it 'is behind redirect_unless_admin' 

    end

    context 'admin signed in' do
      before do
        Role.add_admin(@user.person)
      end

      it 'does not die if you do it twice' 


      it 'invites a new user' 


      it "doesn't invite an existing user" 

    end
  end

  describe '#stats' do
    before do
      Role.add_admin(@user.person)
    end

    it "succeeds and renders stats" 


    it "succeeds and renders stats for different ranges" 

  end
end

