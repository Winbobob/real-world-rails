require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::DashboardController do
  describe 'handling GET to show' do
    before(:each) do
      @posts    = [mock_model(Post), mock_model(Post)]
      @comment_activity = [double("comment-1"), double("comment-2")]
      allow(Post).to receive(:find_recent).and_return(@posts)
      allow(Stats).to receive(:new).and_return(@stats = Struct.new(:post_count, :comment_count, :tag_count).new(3,2,1))

      allow(CommentActivity).to receive(:find_recent).and_return(@comment_activity)

      session[:logged_in] = true
      get :show
    end

    it "is successful" 


    it "renders show template" 


    it "finds posts for the view" 


    it "assigns stats for the view" 


    it "finds comment activity for the view" 

  end
end

