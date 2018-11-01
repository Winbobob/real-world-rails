require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a PostsController" do
  let(:user) { User.make! }
  
  describe "routes" do
    it "should accept GET requests" 

  end
  
  describe "index" do
    it "should list journal posts for a project" 

  end
  
  describe "for_user" do
    it "should include posts by projects the user belongs to" 

    it "should not include posts by projects the user doesn't belongs to" 

    it "should not include user posts" 

    it "should include project title" 

    it "should include project icon_url" 

    it "should include site name" 

    it "should include site icon_url" 

    it "should not include disallowed tags like figure" 

    it "should include site posts for the user's site" 

    it "should not include duplicate site posts if the user has joined several projects" 

    it "should not include site posts from other sites" 

    describe "older_than" do
      let( :pu ) { ProjectUser.make!( user: user ) }
      let( :p1 ) { Post.make!( parent: pu.project, user: pu.project.user ) }
      let( :p2 ) { Post.make!( parent: pu.project, user: pu.project.user ) }
      let( :p3 ) { Post.make!( parent: pu.project, user: pu.project.user ) }
      before do
        expect( p1.published_at ).to be < p2.published_at
        expect( p2.published_at ).to be < p3.published_at
      end
      it "should show posts older than the selected post" 

      it "should not show posts newer than the selected post" 

    end
    describe "newer_than" do
      let( :pu ) { ProjectUser.make!( user: user ) }
      let( :p1 ) { Post.make!( parent: pu.project, user: pu.project.user ) }
      let( :p2 ) { Post.make!( parent: pu.project, user: pu.project.user ) }
      let( :p3 ) { Post.make!( parent: pu.project, user: pu.project.user ) }
      before do
        expect( p1.published_at ).to be < p2.published_at
        expect( p2.published_at ).to be < p3.published_at
      end
      it "should show posts newer than the selected post" 

      it "should not show posts older than the selected post" 

    end
  end
end

describe PostsController, "oauth authentication" do
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id, :application => OauthApplication.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a PostsController"
end

describe PostsController, "devise authentication" do
  before { http_login(user) }
  it_behaves_like "a PostsController"
end

describe PostsController, "without authentication" do
  describe "for_user" do
    it "should return site posts" 

  end
end

