require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/../../factories'

describe Admin::PostsController do
  describe 'handling GET to index' do
    before(:each) do
      FactoryGirl.create_list(:post, 2)
      session[:logged_in] = true
      get :index
    end

    it "is successful" 


    it "renders index template" 


    it "finds posts for the view" 

  end

  describe 'handling GET to show' do
    before(:each) do
      @post = mock_model(Post)
      allow(Post).to receive(:find).and_return(@post)
      session[:logged_in] = true
      get :show, :id => 1
    end

    it "is successful" 


    it "renders show template" 


    it "finds post for the view" 

  end

  describe 'handling GET to new' do
    before(:each) do
      @post = mock_model(Post)
      allow(Post).to receive(:new).and_return(@post)
      session[:logged_in] = true
      get :new
    end

    it('is successful') { expect(response).to be_success}
    it('assigns post for the view') { assigns[:post] == @post }
  end

  describe 'handling PUT to update with valid attributes' do
    before(:each) do
      @post = mock_model(Post, :title => 'A post')
      allow(@post).to receive(:update_attributes).and_return(true)
      allow(Post).to receive(:find).and_return(@post)
    end

    def do_put
      session[:logged_in] = true
      put :update, :id => 1, :post => valid_post_attributes
    end

    it 'updates the post' 


    it 'it redirects to show' 

  end

  describe 'handling PUT to update with invalid attributes' do
    before(:each) do
      @post = mock_model(Post)
      allow(@post).to receive(:update_attributes).and_return(false)
      allow(Post).to receive(:find).and_return(@post)
    end

    def do_put
      session[:logged_in] = true
      put :update, :id => 1, :post => valid_post_attributes
    end

    it 'renders show' 


    it 'is unprocessable' 

  end

  describe 'handling PUT to update with expected whitelisted attributes present' do
    before(:each) do
      @post = FactoryGirl.create(:post)
      allow(Post).to receive(:find).and_return(@post)
    end

    it 'allows whitelisted attributes as expected' 

  end

  describe 'handling POST to create with valid attributes' do
    it 'creates a post' 

  end

  describe 'handling POST to create with expected whitelisted attributes present' do
    it 'allows whitelisted attributes as expected' 

  end

  def valid_post_attributes
    {
      'title'      => "My Post",
      'body'       => "hello this is my post",
      'minor_edit' => "0"
    }
  end

  describe 'handling DELETE to destroy' do
    before(:each) do
      @post = Post.new
      allow(@post).to receive(:destroy_with_undo)
      allow(Post).to receive(:find).and_return(@post)
    end

    def do_delete
      session[:logged_in] = true
      delete :destroy, :id => 1
    end

    it("redirects to index") do
      do_delete
      expect(response).to be_redirect
      expect(response).to redirect_to(admin_posts_path)
    end

    it("deletes post") do
      expect(@post).to receive(:destroy_with_undo)
      do_delete
    end
  end

  describe 'handling DELETE to destroy, JSON request' do
    before(:each) do
      @post = Post.new(:title => 'A post')
      allow(@post).to receive(:destroy_with_undo).and_return(mock_model(UndoItem, :description => 'hello'))
      allow(Post).to receive(:find).and_return(@post)
    end

    def do_delete
      session[:logged_in] = true
      delete :destroy, :id => 1, :format => 'json'
    end

    it("deletes post") do
      expect(@post).to receive(:destroy_with_undo).and_return(mock_model(UndoItem, :description => 'hello'))
      do_delete
    end

    it("renders json including a description of the post") do
      do_delete
      expect(JSON.parse(response.body)['undo_message']).to eq('hello')
    end
  end
end

describe Admin::PostsController, 'with an AJAX request to preview' do
  before(:each) do
    session[:logged_in] = true
    xhr :post, :preview, :post => {
      :title                => 'My Post',
      :body                 => 'body',
      :tag_list             => 'ruby',
      :published_at_natural => 'now'
    }
  end

  it "assigns a new post for the view" 

end

