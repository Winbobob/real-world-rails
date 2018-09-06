# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe CommentsController, :type => :controller do
  before do
    sign_in alice, scope: :user
  end

  describe '#create' do
    let(:comment_hash) {
      {:text    =>"facebook, is that you?",
       :post_id =>"#{@post.id}"}
    }

    context "on my own post" do
      before do
        aspect_to_post = alice.aspects.where(:name => "generic").first
        @post = alice.post :status_message, :text => 'GIANTS', :to => aspect_to_post
      end

      it 'responds to format json' 


      it 'responds to format mobile' 

    end

    context "on a post from a contact" do
      before do
        aspect_to_post = bob.aspects.where(:name => "generic").first
        @post = bob.post :status_message, :text => 'GIANTS', :to => aspect_to_post
      end

      it 'comments' 


      it "doesn't overwrite author_id" 


      it "doesn't overwrite id" 

    end

    it 'posts no comment on a post from a stranger' 

  end

  describe '#destroy' do
    before do
      aspect_to_post = bob.aspects.where(:name => "generic").first
      @message = bob.post(:status_message, :text => "hey", :to => aspect_to_post)
    end

    context 'your post' do
      before do
        allow(@controller).to receive(:current_user).and_return(bob)
        sign_in bob, scope: :user
      end

      it "lets the user delete their comment" 


      it "lets the user destroy other people's comments" 

    end

    context "another user's post" do
      it "lets the user delete their comment" 


      it "does not let the user destroy comments they do not own" 

    end

    it 'renders nothing and 404 on a nonexistent comment' 

  end

  describe '#index' do
    before do
      aspect_to_post = bob.aspects.where(:name => "generic").first
      @message = bob.post(:status_message, :text => "hey", :to => aspect_to_post.id)
    end

    it 'works for mobile' 


    it 'returns all the comments for a post' 


    it 'returns a 404 on a nonexistent post' 


    it 'returns a 404 on a post that is not visible to the signed in user' 


    it "returns a 401 for a private post when logged out" 

  end
end

