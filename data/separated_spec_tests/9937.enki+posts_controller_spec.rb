require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for 'successful posts list' do
  it "should be successful" 


  it "should render index template" 


  it "should assign the found posts for the view" 

end

shared_examples_for "ATOM feed" do
  it "renders with no layout" 

end

describe PostsController do
  describe 'handling GET to index' do
    before(:each) do
      @posts = [mock_model(Post)]
      allow(Post).to receive(:find_recent).and_return(@posts)
    end

    def do_get
      get :index
    end

    it_should_behave_like('successful posts list')

    it "should find recent posts" 

  end

  describe 'handling GET to index with tag' do
    before(:each) do
      @posts = [mock_model(Post)]
      allow(Post).to receive(:find_recent).and_return(@posts)
    end

    def do_get
      get :index, :tag => 'code'
    end

    it_should_behave_like('successful posts list')

    it "should find recent tagged posts" 

  end

  describe 'handling GET to index with no posts' do
    before(:each) do
      @posts = []
    end

    def do_get
      get :index
    end

    it_should_behave_like('successful posts list')
  end

  describe 'handling GET to index with invalid tag' do
    it 'returns missing' 

  end

  describe 'handling GET to /posts.atom'do
    before(:each) do
      @posts = [mock_model(Post)]
      allow(Post).to receive(:find_recent).and_return(@posts)
    end

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/atom+xml"
      get :index
    end

    it_should_behave_like('successful posts list')
    it_should_behave_like('ATOM feed')

    it "should find recent posts" 

  end

  describe 'handling GET to /posts.atom with tag'do
    before(:each) do
      @posts = [mock_model(Post)]
      allow(Post).to receive(:find_recent).and_return(@posts)
    end

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/atom+xml"
      get :index, :tag => 'code'
    end

    it_should_behave_like('successful posts list')
    it_should_behave_like('ATOM feed')

    it "should find recent posts" 

  end

  describe "handling GET for a single post" do
    before(:each) do
      @post = mock_model(Post)
      @comment = mock_model(Post)
      allow(Post).to receive(:find_by_permalink).and_return(@post)
      allow(Comment).to receive(:new).and_return(@comment)
    end

    def do_get
      get :show, :year => '2008', :month => '01', :day => '01', :slug => 'a-post'
    end

    it "should be successful" 


    it "should render show template" 


    it "should find the post requested" 


    it "should assign the found post for the view" 


    it "should assign a new comment for the view" 

  end
end

